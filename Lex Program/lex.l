%{
#include<stdio.h>
int c_letter=0,s_letter=0,lines=0,words=0,num=0,special_char=0,total=0;
%}
%%
[\n] lines++,words++;
[\t ] words++;
[A-Z] c_letter++;
[a-z] s_letter++;
[0-9] num++;
. special_char++;
%%
int main()
{
          FILE *fp=fopen("input.txt","r");
          yyin=fp;
          FILE *fp1=fopen("output.txt","w");
          yyout=fp1;
          yylex();
          total=c_letter+s_letter+num+special_char;
          fprintf(yyout,"This file contains....");
          fprintf(yyout,"\n\t%d Capital Letters",c_letter);
          fprintf(yyout,"\n\t%d Small Letters ",s_letter);
          fprintf(yyout,"\n\t%d No of lines ",lines);
          fprintf(yyout,"\n\t%d Words",words);
          fprintf(yyout,"\n\t%d Numbers ",num);
          fprintf(yyout,"\n\t%d Special Charachter",special_char);
          fprintf(yyout,"\n\t%d Total characters",total);
          fclose(fp);
}   
      int yywrap()
            {
              return(1);
            }