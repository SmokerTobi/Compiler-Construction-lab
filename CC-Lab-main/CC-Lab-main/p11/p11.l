Himesh Bhure
24070521013
Sem v Sec A
%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
"int"|"float"|"char"|"double"   { return DT; }
[a-zA-Z_][a-zA-Z0-9_]*           { return ID; }
","                              { return ','; }
";"                              { return ';'; }
[ \t]                            { ; }
\n                               { return '\n'; }
.                                { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}