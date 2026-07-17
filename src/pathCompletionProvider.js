// @ts-check
'use strict';

const vscode = require('vscode');
const path = require('node:path');
const { getPathContext, matchesExtension } = require('./pathCompletion');

/**
 * Resolve the directory a partial path points at.
 *
 * Relative paths resolve against the directory of the script itself, which is
 * where OpenModelica runs it from. Untitled documents have no directory, so the
 * first workspace folder is used instead.
 *
 * @param {vscode.TextDocument} document
 * @param {string} directory - Leading directory part of the typed path.
 * @returns {vscode.Uri | null}
 */
function resolveDirectory(document, directory) {
    if (path.isAbsolute(directory)) {
        return vscode.Uri.file(directory);
    }

    let base;
    if (document.uri.scheme === 'file') {
        base = path.dirname(document.uri.fsPath);
    } else {
        const folder = vscode.workspace.workspaceFolders?.[0];
        if (folder === undefined) {
            return null;
        }
        base = folder.uri.fsPath;
    }

    return vscode.Uri.file(path.resolve(base, directory));
}

/**
 * Build a completion item for one directory entry.
 *
 * @param {string} name - Entry name.
 * @param {boolean} isDirectory
 * @param {vscode.Range} range - Range the item replaces.
 * @returns {vscode.CompletionItem}
 */
function createItem(name, isDirectory, range) {
    const kind = isDirectory ? vscode.CompletionItemKind.Folder : vscode.CompletionItemKind.File;
    const item = new vscode.CompletionItem(name, kind);
    item.range = range;

    if (isDirectory) {
        // Complete to 'name/' and open the suggestions for the next segment.
        item.insertText = `${name}/`;
        item.command = { command: 'editor.action.triggerSuggest', title: 'Suggest' };
        // Sort directories before files, so that navigating deeper is cheap.
        item.sortText = `0${name}`;
    } else {
        item.sortText = `1${name}`;
    }

    return item;
}

/** @type {vscode.CompletionItemProvider} */
const pathCompletionProvider = {
    /**
     * @param {vscode.TextDocument} document
     * @param {vscode.Position} position
     * @returns {Promise<vscode.CompletionItem[]>}
     */
    async provideCompletionItems(document, position) {
        const linePrefix = document.lineAt(position).text.slice(0, position.character);
        const context = getPathContext(linePrefix);
        if (context === null) {
            return [];
        }

        const directory = resolveDirectory(document, context.directory);
        if (directory === null) {
            return [];
        }

        /** @type {[string, vscode.FileType][]} */
        let entries;
        try {
            entries = await vscode.workspace.fs.readDirectory(directory);
        } catch {
            // Typing a path that does not exist yet is normal, not an error.
            return [];
        }

        const range = new vscode.Range(
            position.line,
            context.replaceStart,
            position.line,
            position.character
        );

        /** @type {vscode.CompletionItem[]} */
        const items = [];
        for (const [name, fileType] of entries) {
            const isDirectory = (fileType & vscode.FileType.Directory) !== 0;

            // Directories stay listed even when files are filtered by extension,
            // otherwise there is no way to reach a match further down the tree.
            if (isDirectory) {
                items.push(createItem(name, true, range));
            } else if (context.pathFunction.target === 'file' && matchesExtension(name, context.pathFunction)) {
                items.push(createItem(name, false, range));
            }
        }

        return items;
    },
};

module.exports = { pathCompletionProvider };
