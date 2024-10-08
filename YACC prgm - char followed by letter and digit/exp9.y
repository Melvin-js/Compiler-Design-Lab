%{
#include<stdio.h>
int valid=1;
extern int yylex();
void yyerror(const char *s);
%}

%token LETTER DIGIT

%%
start: LETTER s
  ;
s : LETTER s
  | DIGIT s
  |
  ;
%%

void yyerror(const char *s)
{
  printf("\nIt's not a valid identifier!\n");
  valid=0;
}

int main()
{
printf("\nEnter a name to be tested for identifier!\n");
  yyparse();
  
  if(valid)
  {
   printf("It is a valid identifier!\n");
   }
   
   return 0;
 }
 

