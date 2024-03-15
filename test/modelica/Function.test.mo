// SYNTAX TEST "source.modelica" "Function with doc string"

public function foo
  "Function does crazy stuff --fmiFlags
   and creates an awesome record for stuff.
   Author: ItIsI"
  input Boolean isAwesome = true;
//^^^^^ source.modelica keyword.control
//      ^^^^^^^ source.modelica storage.type
//                          ^^^^ source.modelica constant.language
  output MyRecord awesome;
//^^^^^^ source.modelica keyword.control
// [...]
//<--- source.modelica comment.line
//^^^^^^ source.modelica comment.line
end foo;
//<--- source.modelica keyword
//  ^^^ source.modelica entity.name.type
