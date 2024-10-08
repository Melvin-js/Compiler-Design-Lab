%{
#include<stdio.h>
#include<string.h>


FILE *output_file;


#define IDENTIFIER
#define NUMBER 2
#define KEYWORD 3
#define OPERATOR 4
#define WHITESPACE 5
#define STRING 6
#define ISYMBOL 7

%}

KEYWORD "if"|"else"|"while"|"for"|"int"|" else if"|"void"|"main"|"return"|"scanf"|"printf"|"char"
OPERATOR "*"|"/"|"-"|"+"|"%"|"="
SYMBOL "{"|"}"|"("|")"|";"|","
%%

{KEYWORD} {fprintf(output_file,"Keyword: %s\n",yytext);}
{SYMBOL} {fprintf(output_file,"Symbol: %s\n",yytext);}
[0-9]+ {fprintf(output_file,"Number: %s\n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {fprintf(output_file,"Identifier: %s\n",yytext);}
{OPERATOR} {fprintf(output_file,"Operator: %s\n",yytext);}
"\""[^"]*"\"" {fprintf(output_file,"String: %s\n",yytext);}
[ \t\n]+ {}
. {fprintf(output_file,"Unknown character: %s\n",yytext);}
%%

int main(int argc,char **argv){
   FILE *input_file =fopen("input10.txt","r");
   output_file =fopen("output10.txt","w");
   yyin = input_file;
   yylex();
   fclose(input_file);
   fclose(output_file);
   return 0;
}

int yywrap(){
 return (1);
 }
