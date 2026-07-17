// @ts-check
'use strict';

/**
 * @typedef {Object} PathFunction
 * @property {'file' | 'folder'} target - What the argument refers to.
 * @property {string[] | null} extensions - Accepted file extensions, or null for any file.
 */

// OpenModelica scripting API functions whose string arguments are paths.
// `cd` is the only one taking a directory; the rest expect files.
/** @type {Record<string, PathFunction>} */
const PATH_FUNCTIONS = {
    cd: { target: 'folder', extensions: null },
    importFMU: { target: 'file', extensions: ['.fmu'] },
    loadFile: { target: 'file', extensions: ['.mo'] },
    readFile: { target: 'file', extensions: null },
    readSimulationResultVars: { target: 'file', extensions: ['.mat', '.csv'] },
    remove: { target: 'file', extensions: null },
    runScript: { target: 'file', extensions: ['.mos'] },
    writeFile: { target: 'file', extensions: null },
};

/**
 * @typedef {Object} PathContext
 * @property {string} functionName - The scripting API function being called.
 * @property {PathFunction} pathFunction - Completion target and extension filter.
 * @property {string} partialPath - String content typed so far, up to the cursor.
 * @property {string} directory - Leading directory part of `partialPath` ('' when none).
 * @property {string} prefix - Segment after the last '/', i.e. what is being filtered on.
 * @property {number} replaceStart - Column where `prefix` starts, for the completion range.
 */

/**
 * Find the unterminated string literal the cursor sits in.
 *
 * Returns the column right after its opening quote, or -1 when the cursor is
 * outside a string or inside a line comment. Escaped quotes (\") do not close
 * the string.
 *
 * @param {string} linePrefix - Line text before the cursor.
 * @returns {number}
 */
function findOpenStringStart(linePrefix) {
    let stringStart = -1;

    for (let i = 0; i < linePrefix.length; i++) {
        const char = linePrefix[i];

        if (stringStart === -1) {
            // A comment outside a string swallows the rest of the line.
            if (char === '/' && linePrefix[i + 1] === '/') {
                return -1;
            }
            if (char === '"') {
                stringStart = i + 1;
            }
        } else if (char === '\\') {
            i++;
        } else if (char === '"') {
            stringStart = -1;
        }
    }

    return stringStart;
}

/**
 * Scan backwards from a string literal to the function name of the call it
 * belongs to. Nested parentheses and earlier string arguments are skipped, so
 * `foo(bar("x"), "<cursor>"` still resolves to `foo`.
 *
 * @param {string} linePrefix - Line text before the cursor.
 * @param {number} stringStart - Column just after the opening quote.
 * @returns {string | null}
 */
function findEnclosingFunction(linePrefix, stringStart) {
    let depth = 0;

    for (let i = stringStart - 2; i >= 0; i--) {
        const char = linePrefix[i];

        if (char === '"') {
            // Skip over a complete string argument.
            i--;
            while (i >= 0 && !(linePrefix[i] === '"' && linePrefix[i - 1] !== '\\')) {
                i--;
            }
        } else if (char === ')') {
            depth++;
        } else if (char === '(') {
            if (depth === 0) {
                const name = linePrefix.slice(0, i).match(/([A-Za-z_]\w*)\s*$/);
                return name ? name[1] : null;
            }
            depth--;
        }
    }

    return null;
}

/**
 * Determine whether the cursor sits in a path argument of a scripting API
 * function, and what should be completed there.
 *
 * Detection is line based: a call split across several lines is not recognised.
 *
 * @param {string} linePrefix - Line text before the cursor.
 * @returns {PathContext | null} Null when there is nothing to complete.
 */
function getPathContext(linePrefix) {
    const stringStart = findOpenStringStart(linePrefix);
    if (stringStart === -1) {
        return null;
    }

    const functionName = findEnclosingFunction(linePrefix, stringStart);
    if (functionName === null) {
        return null;
    }

    const pathFunction = PATH_FUNCTIONS[functionName];
    if (pathFunction === undefined) {
        return null;
    }

    const partialPath = linePrefix.slice(stringStart);
    const separator = partialPath.lastIndexOf('/');

    return {
        functionName,
        pathFunction,
        partialPath,
        directory: separator === -1 ? '' : partialPath.slice(0, separator + 1),
        prefix: partialPath.slice(separator + 1),
        replaceStart: stringStart + separator + 1,
    };
}

/**
 * Check whether a file is worth suggesting for a path argument.
 *
 * @param {string} fileName
 * @param {PathFunction} pathFunction
 * @returns {boolean}
 */
function matchesExtension(fileName, pathFunction) {
    if (pathFunction.extensions === null) {
        return true;
    }
    return pathFunction.extensions.some((ext) => fileName.toLowerCase().endsWith(ext));
}

module.exports = { PATH_FUNCTIONS, getPathContext, matchesExtension };
