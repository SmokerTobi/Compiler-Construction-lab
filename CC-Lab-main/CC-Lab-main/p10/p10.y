Himesh Bhure
24070521013
Sem v Sec A

%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
int yyerror(char *);
%}
%token FOR ID NUM RELOP INC TRUE FALSE
%%
S : FOR '(' E ';' C ';' U ')'
    {
        printf("valid\n");
    }
  | ID '=' '(' C ')' '?' TRUE ':' FALSE ';'
    {
        printf("valid\n");
    };
E : ID '=' NUM
  ;
C : ID RELOP NUM
  ;
U : ID INC
  ;
%%
int yyerror(char *s)
{
    printf("Invalid\n");
    return 0;
}
int main(void)
{
    printf("enter\n");
    yyparse();
    return 0;
}
