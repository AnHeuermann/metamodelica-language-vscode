# Change Log

All notable changes to the "MetaModelica" extension will be documented in this file.

## [1.6.0] - 2026-07-17

- Path completion for [OpenModelica scripting API][om-scripting-api] calls:
  files and directories are suggested while typing a string argument of a path
  taking function, such as `loadFile`, `cd`, `importFMU` or `runScript`
- Suggestions are filtered by the file extension the called function expects
- Relative paths are resolved against the directory of the script

## [1.1.0] - 2023-06-30

- MOS script snippets
- MOS script API functions highlighting
- Fixed string escapes

## [1.0.0] - 2023-06-29

- Fixed syntax highlighting for Susan template language
- Modelica syntax highlighting within `loadString` functions of MOS scripts
- Changed tmGrammar to YAML files

## [0.1.0] - 2022-02-08

- Initial release based on Modelica extension (version v0.0.4) by Danny Moesch
  [SimplyDanny/modelica-language-vscode][simplyDanny-modelica]
- Adding basic MetaModelica (.mo) and Susan (.tpl) support

[om-scripting-api]: https://openmodelica.org/doc/OpenModelicaUsersGuide/latest/scripting_api.html
[simplyDanny-modelica]: https://github.com/SimplyDanny/modelica-language-vscode
