%{
#include<stdio.h>
int v=0;
int c=0;
%}
%%
[aeiouAEIOU] {v++;}
[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ] {c++;}
%%
int main()
{
yyin=fopen("abcd.txt","r");
yylex();
printf("%d vowels\n %d consonants\n",v,c);
return 0;
}
int yywrap()
{
return(1);
}

/*OUTPUT
7 vowels
10 consonants
*/

INPUT FILE

Hello I am Melvin J.S

