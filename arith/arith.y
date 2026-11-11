%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token NUM ID

%%
input:
    E '\n' { printf("Valid arithmetic expression\n"); }
    ;

E: E '+' T | E '-' T | T;

T: T '*' F | T '/' F | F ;

F: '(' E ')' | NUM | ID ;
%%

int yyerror(char *s)
{
    printf("Invalid arithmetic expression\n");
    return 0;
}

int main()
{
    printf("Enter expression: ");
    yyparse();
    return 0;
}
