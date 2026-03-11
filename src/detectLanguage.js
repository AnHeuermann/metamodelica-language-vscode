// @ts-check
'use strict';

// First line pattern for Base Modelica files
const BASE_MODELICA_FIRST_LINE = /^\/\/! base \d+\.\d+\.\d+/;

// Keywords and patterns unique to MetaModelica that do not exist in standard Modelica:
//   uniontype      - MetaModelica union type declaration
//   matchcontinue  - MetaModelica match expression with backtracking
//   match          - MetaModelica match expression (not a Modelica keyword)
//   list<          - MetaModelica generic list type
//   tuple<         - MetaModelica generic tuple type
//   Option<        - MetaModelica Option type
//   array<         - MetaModelica generic array type (distinct from Modelica's array(...))
const METAMODELICA_PATTERN = /\b(uniontype|matchcontinue|match)\b|\b(list|tuple|Option|array)\s*</;

/**
 * Detect the language of a .mo file from its content.
 * @param {string} text - Full file content
 * @returns {'base-modelica' | 'metamodelica' | 'modelica'}
 */
function detectMoFileLanguage(text) {
    const firstLine = text.split('\n')[0];
    if (BASE_MODELICA_FIRST_LINE.test(firstLine)) {
        return 'base-modelica';
    }
    if (METAMODELICA_PATTERN.test(text)) {
        return 'metamodelica';
    }
    return 'modelica';
}

module.exports = { detectMoFileLanguage };
