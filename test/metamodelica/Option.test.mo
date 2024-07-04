// SYNTAX TEST "source.metamodelica" "Option"

function f
  input Option<Integer> oi;
//      ^^^^^^ source.metamodelica storage.type
//             ^^^^^^^ source.metamodelica storage.type
algorithm
  () := match oi
    case SOME(i) then ();
//       ^^^^ source.metamodelica entity.name.type
    case NONE() then ();
//       ^^^^ source.metamodelica entity.name.type
  end match;
end f;
