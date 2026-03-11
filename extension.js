// @ts-check
'use strict';

const vscode = require('vscode');
const { detectMoFileLanguage } = require('./src/detectLanguage');

/**
 * Detect whether a .mo file is Base Modelica, MetaModelica, or Modelica and set the language accordingly.
 * @param {vscode.TextDocument} document
 */
async function detectMoLanguage(document) {
    if (!document.fileName.endsWith('.mo')) {
        return;
    }
    if (document.languageId !== 'modelica' && document.languageId !== 'metamodelica' && document.languageId !== 'base-modelica') {
        return;
    }

    const text = document.getText();
    const targetLanguage = detectMoFileLanguage(text);

    if (document.languageId !== targetLanguage) {
        await vscode.languages.setTextDocumentLanguage(document, targetLanguage);
    }
}

/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
    // Process documents that are already open when the extension activates
    vscode.workspace.textDocuments.forEach(detectMoLanguage);

    // Process newly opened documents
    context.subscriptions.push(
        vscode.workspace.onDidOpenTextDocument(detectMoLanguage)
    );
}

function deactivate() {}

module.exports = { activate, deactivate };
