template someTemplateFunction(Text txt, Context ctx, builtin.SourceInfo info)
::=
  match ctx
  case FUNCTION_CONTEXT(__) then
    <<
    void foo() {
      FILE_INFO info = {<%infoArgs(info)%>};
      printf("<%txt%>\"\n");
    }
    >>
  else
    <<
    void foo() {
      printf("Unknown context\n");
      printf("<%txt%>\n");
    }
    >>
end someTemplateFunction;
