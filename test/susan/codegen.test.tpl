// SYNTAX TEST "source.susan" "Example someTemplateFunction"

template someTemplateFunction(Text message, Context context, builtin.SourceInfo info)
//<--- source.susan keyword
//       ^^^^^^^^^^^^^^^^^^^^^ source.susan entity.name.function
::=
//<-- source.susan keyword.control
  match context
//^^^^^ source.susan keyword.control
  case FUNCTION_CONTEXT(__) then
//^^^^ source.susan keyword.control
//     ^^^^^^^^^^^^^^^^ source.susan entity.name.function
//                          ^^^^ source.susan keyword.control
    <<
    void foo() {
      FILE_INFO info = {<%infoArgs(info)%>};
      printf("<%message%>\"\n");
    }
    >>
//  ^^ source.susan string.interpolated keyword
  else
//^^^^ source.susan keyword.control
    <<
    void foo() {
      printf("Unknown context\n");
      printf("<%message%>\n");
    }
    >>
//  ^^ source.susan string.interpolated keyword
end someTemplateFunction;
//<-- source.susan keyword
//  ^^^^^^^^^^^^^^^^^^^^ source.susan entity.name.function
