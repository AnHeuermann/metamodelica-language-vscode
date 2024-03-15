// SYNTAX TEST "source.metamodelica" "Enumeration"

type FavouriteMinionFood = enumeration(
//<--- source.metamodelica storage.type
//   ^^^^^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
//                       ^ source.metamodelica keyword.operator.assignment
//                         ^^^^^^^^^^^ source.metamodelica storage.type.enumeration
  BANANA  "A banana",
//^^^^^^ source.metamodelica entity.name.type
//        ^^^^^^^^^^ source.metamodelica comment.line
  APPLE   "An apple",
//^^^^^ source.metamodelica entity.name.type
//        ^^^^^^^^^^ source.metamodelica comment.line
  GELATO  "Ice-cream from the italian \"gelato\"",
//^^^^^^ source.metamodelica entity.name.type
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
  PAPAYA  "Wikipedia tells me the fruit is a berry. I don't agree."
//^^^^^^ source.metamodelica entity.name.type
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica comment.line
);
