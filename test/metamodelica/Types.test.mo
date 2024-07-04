// SYNTAX TEST "source.metamodelica" "Types"

type L = list<P>;
//       ^^^^ source.metamodelica storage.type
//            ^ source.metamodelica storage.type
type T = tuple<P, Q>;
//       ^^^^^ source.metamodelica storage.type
//             ^ source.metamodelica storage.type
//                ^ source.metamodelica storage.type
type A = array<P>;
//       ^^^^^ source.metamodelica storage.type
//             ^ source.metamodelica storage.type
type O = Option<P>;
//       ^^^^^^ source.metamodelica storage.type
//              ^ source.metamodelica storage.type
