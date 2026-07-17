// @ts-check
'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { getPathContext, matchesExtension } = require('../src/pathCompletion');

const fixture = path.join(__dirname, 'openmodelica-scripting', 'autoCompletePath.mos');

/**
 * @typedef {Object} Case
 * @property {number} line - 1 based line number of the marker, for failure messages.
 * @property {string} linePrefix - Code line up to the marked cursor column.
 * @property {string} expected - Expected completion, normalised as in the fixture.
 */

/**
 * Collect the '^' marked cases from a fixture file. Each marker refers to the
 * closest code line above it.
 *
 * @param {string} text - Fixture file content.
 * @returns {Case[]}
 */
function parseCases(text) {
    const lines = text.split('\n');
    /** @type {Case[]} */
    const cases = [];

    lines.forEach((line, index) => {
        const marker = line.match(/^\/\/ *\^ (.+)$/);
        if (marker === null) {
            return;
        }

        // The code under test is the nearest preceding line that is not a marker.
        let codeIndex = index - 1;
        while (codeIndex >= 0 && /^\/\/ *\^ /.test(lines[codeIndex])) {
            codeIndex--;
        }

        cases.push({
            line: index + 1,
            linePrefix: lines[codeIndex].slice(0, line.indexOf('^')),
            expected: marker[1].trim(),
        });
    });

    return cases;
}

/**
 * Render a path context the way the fixture spells it out.
 *
 * @param {ReturnType<getPathContext>} context
 * @returns {string}
 */
function format(context) {
    if (context === null) {
        return 'none';
    }
    const { extensions, target } = context.pathFunction;
    return `${context.functionName} ${target} ${extensions === null ? 'any' : extensions.join(',')}`;
}

const cases = parseCases(fs.readFileSync(fixture, 'utf8'));

test('autoCompletePath.mos provides cases', () => {
    assert.ok(cases.length > 0, 'no ^ markers found in fixture');
});

for (const testCase of cases) {
    test(`autoCompletePath.mos:${testCase.line} expects ${testCase.expected}`, () => {
        assert.equal(format(getPathContext(testCase.linePrefix)), testCase.expected);
    });
}

test('a path is split into directory and prefix', () => {
    const context = getPathContext('runScript("scripts/su');
    assert.equal(context?.partialPath, 'scripts/su');
    assert.equal(context?.directory, 'scripts/');
    assert.equal(context?.prefix, 'su');
    // Completions replace 'su' only, not the directory in front of it.
    assert.equal(context?.replaceStart, 'runScript("scripts/'.length);
});

test('a path without a separator is all prefix', () => {
    const context = getPathContext('loadFile("Lotka');
    assert.equal(context?.directory, '');
    assert.equal(context?.prefix, 'Lotka');
    assert.equal(context?.replaceStart, 'loadFile("'.length);
});

test('a closed string argument is not completed', () => {
    assert.equal(getPathContext('loadFile("model.mo");'), null);
});

test('an escaped quote does not close the string', () => {
    const context = getPathContext('loadFile("C:\\\\dir\\"na');
    assert.equal(context?.functionName, 'loadFile');
    assert.equal(context?.prefix, 'C:\\\\dir\\"na');
});

test('extension filters accept only matching files', () => {
    const loadFile = getPathContext('loadFile("')?.pathFunction;
    assert.ok(loadFile !== undefined);
    assert.equal(matchesExtension('LotkaVolterra.mo', loadFile), true);
    assert.equal(matchesExtension('LotkaVolterra.MO', loadFile), true);
    assert.equal(matchesExtension('results.mat', loadFile), false);
});

test('a null extension filter accepts any file', () => {
    const readFile = getPathContext('readFile("')?.pathFunction;
    assert.ok(readFile !== undefined);
    assert.equal(matchesExtension('anything.xyz', readFile), true);
});
