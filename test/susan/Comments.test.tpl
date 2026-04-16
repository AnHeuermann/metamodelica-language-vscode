// SYNTAX TEST "source.susan" "Susan block comments"

/*
//<-- source.susan comment.block
/* inner */
//<-- source.susan comment.block
still in outer comment
//<--- source.susan comment.block
*/
//<-- source.susan comment.block
end daeExpCast;
//<--- source.susan keyword
//  ^^^^^^^^^^ source.susan entity.name.function

/* comment one */
//<-- source.susan comment.block
end foo;
//<--- source.susan keyword
//  ^^^ source.susan entity.name.function
/* comment two */
//<-- source.susan comment.block
