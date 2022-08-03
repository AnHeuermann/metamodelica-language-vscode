function myMetaModelicaFunction
  input list<Real> x;
  output list<Integer> y = {};
algorithm
  _ := match x
    local
      Real yi;

    case {} algorithm
      Error.addMessage(Error.INTERNAL_ERROR,{getInstanceName() + " failed."});
    then ();

    else algorithm
      for xi in x loop
        y := xi::y;
      end for;
    then ();
  end match;
end myMetaModelicaFunction;
