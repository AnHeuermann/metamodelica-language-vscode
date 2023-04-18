template someTemplateFunction(Text message, Context context, builtin.SourceInfo info)
::=
  match context
  case FUNCTION_CONTEXT(__) then
    <<
    void foo() {
      FILE_INFO info = {<%infoArgs(info)%>};
      printf("<%message%>\"\n");
    }
    >>
  else
    <<
    void foo() {
      printf("Unknown context\n");
      printf("<%message%>\n");
    }
    >>
end someTemplateFunction;
