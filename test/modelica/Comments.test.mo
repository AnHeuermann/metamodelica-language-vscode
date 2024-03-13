// SYNTAX TEST "source.modelica" "Comments"

model M "Documentation"
//      ^^^^^^^^^^^^^^^ comment.line
  Real x "Variable x";
//       ^^^^^^^^^^^^ comment.line
  Real y = 1.0 "Variable y";
//             ^^^^^^^^^^^^ comment.line
  String z = "hello" "Variable z";
//                   ^^^^^^^^^^^^ comment.line
  Foo foo(x=1) "Variable foo";
//             ^^^^^^^^^^^^^^ comment.line
end M;
