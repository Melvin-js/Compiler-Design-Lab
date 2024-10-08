%{
#include<stdio.h>
#include<stdlib.h>
int yyerror(char* s);
int yylex(void);
%}

%token NUMBER ID
%left'+''-'
%left'*''%'
%left'('')'
%%
expr :expr'+'expr
	|expr'-'expr
	|expr'*'expr
 	|expr'/'expr
 	|'-'NUMBER
 	|'-'ID
 	|'('expr')'
 	|NUMBER
 	|ID
%%
int main()
{
printf("Enter the expression : \n");
yyparse();
printf("The expression is valid\n");
return 0;
}
int yyerror(char* s)
{
printf("The expression is invalid \n");
exit(0);
}



