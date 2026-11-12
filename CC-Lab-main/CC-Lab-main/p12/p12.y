Himesh Bhure
24070521013
Sem v Sec A

%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(char *s);

int t = 1;
%}

%token ID NUM
%left '+' '-'
%left '*' '/'
%left UMINUS

%%
S : E '\n'
    {
        printf("Result: %d\n", $1);
        t = 1;
    }
  ;

E : E '+' E
    {
        $$ = $1 + $3;
        printf("t%d = %d + %d = %d\n", t++, $1, $3, $$);
    }
  | E '-' E
    {
        $$ = $1 - $3;
        printf("t%d = %d - %d = %d\n", t++, $1, $3, $$);
    }
  | E '*' E
    {
        $$ = $1 * $3;
        printf("t%d = %d * %d = %d\n", t++, $1, $3, $$);
    }
  | E '/' E
    {
        if ($3 == 0)
        {
            yyerror("Division by zero");
            YYABORT;
        }
        $$ = $1 / $3;
        printf("t%d = %d / %d = %d\n", t++, $1, $3, $$);
    }
  | '(' E ')'
    {
        $$ = $2;
    }
  | '-' E %prec UMINUS
    {
        $$ = -$2;
        printf("t%d = -%d = %d\n", t++, $2, $$);
    }
  | NUM
    {
        $$ = $1;
    }
  | ID
    {
        printf("Error: Variables are not supported: ID\n");
        YYABORT;
    }
  ;

%%

void yyerror(char *s)
{
    printf("error: %s\n", s);
}

int main()
{
    printf("Enter : ");
    yyparse();
    return 0;
}
