// SYNTAX TEST "source.metamodelica" "Function"

function myMetaModelicaFunction
//<-- source.metamodelica keyword
//       ^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
  input list<Real> x;
//^^^^^ source.metamodelica keyword.control
//      ^^^^^^^^^^ source.metamodelica storage.type
  output list<Integer> y = {};
//^^^^^^ source.metamodelica keyword.control
//       ^^^^^^^^^^^^^ storage.type
//                       ^ source.metamodelica keyword.operator.assignment
algorithm
//<-- source.metamodelica keyword
  _ := match x
//  ^^ source.metamodelica keyword.operator.assignment
//     ^^^^^ keyword.control
    local
//  ^^^^^ keyword.control
      Real yi;
//    ^^^^ source.metamodelica storage.type
    case {} algorithm
//  ^^^^ keyword.control
//          ^^^^^^^^^ source.metamodelica keyword
      Error.addMessage(Error.INTERNAL_ERROR,{getInstanceName() + " failed."});
//    ^^^^^^^^^^^^^^^^ source.metamodelica entity.name.function
//                                           ^^^^^^^^^^^^^^^ source.metamodelica support.function.special
//                                                               ^^^^^^^^^^ source.metamodelica string.quoted.double
    then ();
//  ^^^^ source.metamodelica keyword.control
    else algorithm
//  ^^^^ source.metamodelica keyword.control
//       ^^^^^^^^^ source.metamodelica keyword
      for xi in x loop
//    ^^^ source.metamodelica keyword.control
//           ^^ source.metamodelica keyword
//                ^^^^ source.metamodelica keyword.control
        y := xi::y;
//        ^^ source.metamodelica keyword.operator.assignment
      end for;
//    ^^^^^^^ source.metamodelica keyword.control
    then ();
//  ^^^^ source.metamodelica keyword.control
  end match;
//^^^ source.metamodelica keyword.control
//    ^^^^ source.metamodelica keyword.control
end myMetaModelicaFunction;
//<--- source.metamodelica keyword
//  ^^^^^^^^^^^^^^^^^^^^^^ source.metamodelica entity.name.type
