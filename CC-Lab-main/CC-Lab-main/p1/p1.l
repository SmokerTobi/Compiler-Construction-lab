Himesh Bhure
24070521013
Sem v Sec A

%{
#include<stdio.h>
int comments=0;
%}

%%
"//".* {comments++;}
.\n {ECHO;}
%%

int main(){
    printf("Enter a string: ");
    yylex();
    printf("Comments %d", comments);
    return 0;
}

int yywrap(){
    return 1;
}