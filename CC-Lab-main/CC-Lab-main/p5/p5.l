Himesh Bhure
24070521013
Sem v Sec A
%{
#include<stdio.h>

char changeCase(char z){
    char r;
    if(z >= 'A' && z <= 'Z'){
        r = z + 32;
    }
    else{
        r = z - 32;
    }
    printf(" result  %c", r);
}

%}

%%
[A-Za-z] { putchar(changeCase(yytext[0])); }
{putchar(yytext[0]);}
%%

int main(){
    printf("Enter character: ");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

