// SYNTAX TEST "source.metamodelica" "Types"

type L = list<P>;
//       ^^^^ source.metamodelica storage.type
//            ^ source.metamodelica entity.name.type
type T = tuple<P, Q>;
//       ^^^^^ source.metamodelica storage.type
//             ^ source.metamodelica entity.name.type
//                ^ source.metamodelica entity.name.type
type A = array<P>;
//       ^^^^^ source.metamodelica storage.type
//             ^ source.metamodelica entity.name.type
type O = Option<P>;
//       ^^^^^^ source.metamodelica storage.type
//              ^ source.metamodelica entity.name.type

type LL = list<list<P>>;
//        ^^^^ source.metamodelica storage.type
//             ^^^^ source.metamodelica storage.type
//                  ^ source.metamodelica entity.name.type

type TL = tuple<list<P>, Q>;
//        ^^^^^ source.metamodelica storage.type
//              ^^^^ source.metamodelica storage.type
//                   ^ source.metamodelica entity.name.type
//                       ^ source.metamodelica entity.name.type

type TL = UnorderedMap<Key, Value>;
//        ^^^^^^^^^^^^ source.metamodelica entity.name.type
//                     ^^^ source.metamodelica entity.name.type
//                          ^^^^^ source.metamodelica entity.name.type

x < 1 and x > 0;
//^ keyword.operator.comparison
//    ^^^ keyword.control
//          ^ keyword.operator.comparison
