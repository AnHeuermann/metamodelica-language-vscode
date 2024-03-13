// SYNTAX TEST "source.modelica" "Comments"

model M "Documentation"
//      ^^^^^^^^^^^^^^^ comment.line
  Real x "Variable x";
//       ^^^^^^^^^^^^ comment.line
  Real y = 1.0 "Variable y";
  String z = "hello" "Variable z";
  Foo foo(x=1) "Variable foo";
//             ^^^^^^^^^^^^^^ comment.line
end M;
