%{
#include<stdio.h>
#include "y.tab.h"
int yyerror(char* s);
int yylval;
%}

%%
[0-9]+ {return NUMBER;}
[a-zA-Z]+ {return ID;}
[\t]+ {;}
\n {return 0;}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}


/*OUTPUT

Enter the expression : 
id+id*id
The expression is valid

Enter the expression : 
+id
The expression is invalid
*/
