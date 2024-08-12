//Recursive descend parser
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char string[20];
int point=0;

int s();
int ldash();
int l();

int ldash()
{
   if(string[point] == ',')
   {
      printf("%c\t L->L,S\n",string[point]);
      point++;
      
      if(s())
      {
         if(ldash())
            return 1;
         else 
            return 0;
      }
      else
         return 0;
   }
   else
      return 1;
}

int l()
{
   if(s())
   {
      if(ldash())
         return 1;
      else
         return 0;
   }
   else
      return 0;
}

int s()
{
   if(string[point] == '(')
   {
      printf("%c\t S->(L)\n",string[point]);
      point++;
      
      if(l())
      {
         if(string[point] == ')')
         {
            printf("%c\t S->(L)\n",string[point]);
            point++;
            return 1;
         }
         else
         {
            return 0;
         }
      }
      else
         return 0;
   }
   else if(string[point] == 'a')
   {
      printf("%c\t S->a\n",string[point]);
      point++;
      return 1;
   }
   else
      return 0;
}

void main()
{
   printf("Enter input string : ");
   gets(string);
   if(s() && string[point] == '\0')
   {
      printf("The string is accepted\n");
   }
   else
   {
      printf("The string is not accepted\n");
   }
}

/*
Enter input string : (a,(a,a))
(	 S->(L)
a	 S->a
,	 L->L,S
(	 S->(L)
a	 S->a
,	 L->L,S
a	 S->a
)	 S->(L)
)	 S->(L)
The string is accepted

Enter input string : (aa,a)
(	 S->(L)
a	 S->a
The string is not accepted
*/
