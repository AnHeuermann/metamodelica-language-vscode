// SYNTAX TEST "source.metamodelica" "Function"

function myMetaModelicaFunction
  input list<Real> x;
//      ^^^^^^^^^^ storage.type
  output list<Integer> y = {};
//       ^^^^^^^^^^^^^ storage.type
algorithm
  _ := match x
//     ^^^^^ keyword.control
    local
//  ^^^^^ keyword.control
      Real yi;

    case {} algorithm
//  ^^^^ keyword.control
      Error.addMessage(Error.INTERNAL_ERROR,{getInstanceName() + " failed."});
    then ();

    else algorithm
      for xi in x loop
        y := xi::y;
      end for;
    then ();
  end match;
//^^^^^^^^^ keyword.control
end myMetaModelicaFunction;
