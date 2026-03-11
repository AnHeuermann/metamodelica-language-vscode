// SYNTAX TEST "source.modelica" "Docstring on next line (issue #29)"

// Docstring on same line (existing behavior)
model WithSameLineDoc "Same line doc"
//<--- source.modelica keyword
//    ^^^^^^^^^^^^^^^ source.modelica entity.name.type
//                    ^^^^^^^^^^^^^^^ source.modelica comment.line
end WithSameLineDoc;

// Docstring on next line (was broken before fix)
model WithNextLineDoc
  "Next line doc"
//^^^^^^^^^^^^^^^ source.modelica comment.line
end WithNextLineDoc;

// Multi-line docstring starting on next line
model WithMultiLineDoc
  "Multi-line
//^^^^^^^^^^^ source.modelica comment.line
  docstring"
//^^^^^^^^^^ source.modelica comment.line
end WithMultiLineDoc;
