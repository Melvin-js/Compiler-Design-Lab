%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[a-zA-Z_] {return LETTER;}
[0-9] {return DIGIT;}
\n {return 0;}
. {return yytext[0];}

%%

int yywrap()
{
  return 1;
  }
  
  
/*OUTPUT

Enter a name to be tested for identifier!
_Hello2
It is a valid identifier!

Enter a name to be tested for identifier!
2abcd
It's not a valid identifier!
*/
