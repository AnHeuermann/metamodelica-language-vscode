// @ts-check
'use strict';

const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { detectMoFileLanguage } = require('../src/detectLanguage');

const examples = path.join(__dirname, '..', 'examples');

test('SimpleFilter.mo is detected as base-modelica', () => {
    const text = fs.readFileSync(path.join(examples, 'SimpleFilter.mo'), 'utf8');
    assert.equal(detectMoFileLanguage(text), 'base-modelica');
});

test('LotkaVolterra.mo is detected as modelica', () => {
    const text = fs.readFileSync(path.join(examples, 'LotkaVolterra.mo'), 'utf8');
    assert.equal(detectMoFileLanguage(text), 'modelica');
});

test('MetaModelica.mo is detected as metamodelica', () => {
    const text = fs.readFileSync(path.join(examples, 'MetaModelica.mo'), 'utf8');
    assert.equal(detectMoFileLanguage(text), 'metamodelica');
});
