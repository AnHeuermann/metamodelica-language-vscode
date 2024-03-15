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
//       ^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica storage.type
// [...]
end foo;
