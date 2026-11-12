//Himesh Bhure
//24070521013
//Sem V Sec A

%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int yylex();
void yyerror(char *s);
%}

%token NUMBER inc dec
%left '+' '-'
%left '*' '/' '%'
%right '^'
%right inc dec

%%
stmt:
    | stmt expr '\n'  { printf("result: %d\n", $2); }
    | stmt error '\n' { yyerrok; printf("error recovered\n"); }
    ;

expr: NUMBER          {$$ = $1; }
    | expr '+' expr   {$$ = $1 + $3; }
    | expr '-' expr   {$$ = $1 - $3; }
    | expr '*' expr   {$$ = $1 * $3; }
    | expr '/' expr   {if($3 == 0) { printf("unefind\n"); $$ = 0; } else $$ = $1 / $3; }
    | expr '^' expr   {$$ = pow($1, $3); }
    | expr '%' expr   {if($3 == 0) { printf("mod by 0\n"); $$ = 0; } else $$ = $1 % $3; }
    | expr inc        {$$ = $1 + 1; }
    | expr dec        {$$ = $1 - 1; }
    |'(' expr ')'    {$$ = $2; }
    ;
%%

void yyerror(char *s){
    printf("error\n");
}

int main(){
    yyparse();
    return 0;
}