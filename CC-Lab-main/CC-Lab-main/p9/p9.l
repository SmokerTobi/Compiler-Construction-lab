//Himesh Bhure
//24070521013
//Sem V Sec A

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[+\-*/\^%] { return yytext[0]; }
"++"       { return inc; }
"--"       { return dec; }
[ \t]      { ; }
\n         { return '\n'; }
.          { printf("error"); }
%%

int yywrap(){
    return 1;
}