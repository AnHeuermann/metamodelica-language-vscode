// SYNTAX TEST "source.modelica" "Comments"

model M "Documentation"
//      ^^^^^^^^^^^^^^^ comment.line
  Real x "Variable \"x\"";
//       ^^^^^^^^^^^^ comment.line
  Real y = 1.0 "Variable y";
//             ^^^^^^^^^^^^ comment.line
  String z1 = "hello" "Variable z1";
//                    ^^^^^^^^^^^^^ comment.line
  String z2 = "hello";
//            ^^^^^^^ string.quoted.double
  Foo foo(x=1) "Variable foo";
//             ^^^^^^^^^^^^^^ comment.line
  Real a = foo("hello") "Function foo";
//             ^^^^^^^ string.quoted.double
//                      ^^^^^^^^^^^^^^ comment.line
  Real b = bar("hello");
//             ^^^^^^^ string.quoted.double
  String v = "a" + "b" "Variable v";
//           ^^^ string.quoted.double
//                 ^^^ string.quoted.double
//                     ^^^^^^^^^^^^ comment.line
  String w = "a" + "b";
//           ^^^ string.quoted.double
//                 ^^^ string.quoted.double
end M;
