// SYNTAX TEST "source.metamodelica" "Function with doc string"

public function foo
  "Function does crazy stuff --fmiFlags
   and creates an awesome record for stuff.
   Author: ItIsI"
  input Boolean isAwesome = true;
//^^^^^ source.metamodelica keyword.control
//      ^^^^^^^ source.metamodelica storage.type
//                          ^^^^ source.metamodelica constant.language
  output Option<SimCode.Awesome> awesome;
//^^^^^^ source.metamodelica keyword.control
//       ^^^^^^ source.metamodelica storage.type
//              ^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
// [...]
end foo;

function bar"I'm a comment"
//          ^^^^^^^^^^^^^^^ source.metamodelica comment.line
end bar;

function f "Does a thing, but must be shorter than this string.
author: Author name  TUD-2015-04"
  input BackendDAE.Equation eq;
//^^^^^ source.metamodelica keyword.control
end f;
