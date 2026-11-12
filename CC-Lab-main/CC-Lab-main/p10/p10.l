Himesh Bhure
24070521013
Sem v Sec A

%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
"for"                      { return FOR; }
"true"                      { return TRUE; }
"false"                     { return FALSE; }
[a-zA-Z][a-zA-Z0-9_]*     { return ID; }
[0-9]+                      { return NUM; }
"<="|">="|"=="|"!="|"<"|">" { return RELOP; }
"++"|"--"                   { return INC; }
"?"                         { return '?'; }
":"                        { return ':'; }
[(){};=+\-]                 { return yytext[0]; }
.                           { return yytext[0]; }
[ \t\n]+                    ;

%%

int yywrap(void)
{
    return 1;
}
