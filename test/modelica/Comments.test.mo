// SYNTAX TEST "source.modelica" "Comments"

model M "Documentation"
//<-- source.modelica keyword
//    ^ source.modelica entity.name.type
//      ^^^^^^^^^^^^^^^ source.modelica comment.line
  Real x "Variable \"x\"";
//       ^^^^^^^^^^^^^^^^ source.modelica comment.line
  Real y = 1.0 "Variable y";
//             ^^^^^^^^^^^^ source.modelica comment.line
  String z1 = "hello" "Variable z1";
//                    ^^^^^^^^^^^^^ source.modelica comment.line
  String z2 = "hello";
//            ^^^^^^^ source.modelica string.quoted.double
  Foo foo(x=1) "Variable foo";
//    ^^^ source.modelica entity.name.function
//             ^^^^^^^^^^^^^^ source.modelica comment.line
  Real a = foo("hello") "Function foo";
//         ^^^ source.modelica entity.name.function
//             ^^^^^^^ source.modelica string.quoted.double
//                      ^^^^^^^^^^^^^^ source.modelica comment.line
  Real b = bar("hello");
//         ^^^ source.modelica entity.name.function
//             ^^^^^^^ source.modelica string.quoted.double
  String v = "a" + "b" "Variable v";
//           ^^^ source.modelica string.quoted.double
//                 ^^^ source.modelica string.quoted.double
//                     ^^^^^^^^^^^^ source.modelica comment.line
  String w = "a" + "b";
//           ^^^ source.modelica string.quoted.double
//                 ^^^ source.modelica string.quoted.double
end M;
//<-- source.modelica keyword
//  ^ source.modelica entity.name.type
