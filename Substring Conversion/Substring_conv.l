%{
#include<stdio.h>
%}
%%
abc	{printf("ABC");}
.|\n	{printf("%c",yytext[0]);}
%%
int main(){
printf("Enter the input string:\n");
yylex();
return 0;
}
int yywrap(){
return 1;
}


/*OUTPUT

Enter the input string:
This is abc text
This is ABC text

*/