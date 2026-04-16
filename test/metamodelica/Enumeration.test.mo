// SYNTAX TEST "source.metamodelica" "Enumeration"

type FavouriteMinionFood = enumeration(
//<--- source.metamodelica storage.type
//   ^^^^^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
//                       ^ source.metamodelica keyword.operator.assignment
//                         ^^^^^^^^^^^ source.metamodelica storage.type.enumeration
  BANANA  "A banana",
//^^^^^^ source.metamodelica variable.other.enummember
//        ^^^^^^^^^^ source.metamodelica comment.line
  APPLE   "An apple",
//^^^^^ source.metamodelica variable.other.enummember
//        ^^^^^^^^^^ source.metamodelica comment.line
  GELATO  "Ice-cream from the italian \"gelato\"",
//^^^^^^ source.metamodelica variable.other.enummember
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
  PAPAYA  "Wikipedia tells me the fruit is a berry. I don't agree."
//^^^^^^ source.metamodelica variable.other.enummember
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
) "No mushrooms here";
//^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
type FavouriteMinionFood = enumeration(BANANA "A banana", APPLE "An apple", GELATO "Ice-cream from the italian \"gelato\"", PAPAYA "Wikipedia tells me the fruit is a berry. I don't agree.") "No mushrooms here" ;
//<--- source.metamodelica storage.type
//   ^^^^^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
//                       ^ source.metamodelica keyword.operator.assignment
//                         ^^^^^^^^^^^ source.metamodelica storage.type.enumeration
//                                     ^^^^^^ source.metamodelica variable.other.enummember
//                                            ^^^^^^^^^^  source.metamodelica comment.line
//                                                        ^^^^^ source.metamodelica variable.other.enummember
//                                                              ^^^^^^^^^^  source.metamodelica comment.line
//                                                                          ^^^^^^ source.metamodelica variable.other.enummember
//                                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
//                                                                                                                          ^^^^^^ source.metamodelica variable.other.enummember
//                                                                                                                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
//                                                                                                                                                                                            ^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line

// Issue #78: enumeration with closing paren on same line as opening paren

// Baseline: closing paren and semicolon on same line
type Issue78_A = enumeration();
//<--- source.metamodelica storage.type
//   ^^^^^^^^^ source.metamodelica entity.name.type
//             ^ source.metamodelica keyword.operator.assignment
//               ^^^^^^^^^^^ source.metamodelica storage.type.enumeration

// Closing paren on same line, semicolon on next line.
// Subsequent code must not be inside the (now properly closed) enumeration block.
type Issue78_B = enumeration()
//               ^^^^^^^^^^^ source.metamodelica storage.type.enumeration
;
type Issue78_C = enumeration();
//<--- source.metamodelica storage.type

// Docstring and semicolon on next line.
// Subsequent code must not be inside the (now properly closed) enumeration block.
type Issue78_D = enumeration()
//               ^^^^^^^^^^^ source.metamodelica storage.type.enumeration
"docstring";
type Issue78_E = enumeration();
//<--- source.metamodelica storage.type
