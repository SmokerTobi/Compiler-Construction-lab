Himesh Bhure
24070521013
Sem v Sec A

%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *);
%}

%token ID DT

%%
S : DT ID F ;

F : ',' ID F
  | ';' '\n'
  ;
%%

int yyerror(char *s) {
    printf("Invalid \n");
    exit(0);
}

int main() {
    printf("Enter declaration: ");
    yyparse();
    printf("Valid \n");
    return 0;
}