Himesh Bhure
24070521013
Sem v Sec A




%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUMBER;}
[*/+-^%] { return yytext[0]; }
[ \t] { ;}
\n { return '\n'; }
. { printf("Error");}
%%

int yywrap() {
    return 1;
}
