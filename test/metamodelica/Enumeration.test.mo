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
);

type FavouriteMinionFood = enumeration(BANANA "A banana", APPLE "An apple", GELATO "Ice-cream from the italian \"gelato\"", PAPAYA "Wikipedia tells me the fruit is a berry. I don't agree.");
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
