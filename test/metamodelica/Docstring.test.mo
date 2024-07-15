// SYNTAX TEST "source.metamodelica" "Doc string"

function f
algorithm
  str := match some_var
    case _ then "";
//              ^^ source.metamodelica string.quoted.double
    else "";
//       ^^ source.metamodelica string.quoted.double
  end match;
end f;
