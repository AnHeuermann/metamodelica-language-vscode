// SYNTAX TEST "source.metamodelica" "Option"

opt := if cond then SOME(i) else NONE();
//                  ^^^^ source.metamodelica entity.name.type
//                          ^^^^ source.metamodelica keyword.control
//                               ^^^^ source.metamodelica entity.name.type
