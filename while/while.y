%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token WHILE ID NUM RELOP

%%
statement:
    WHILE '(' condition ')' body
    { printf("Valid WHILE statement\n"); }
    ;

condition:
    operand RELOP operand
    ;

body:
      '{' stmts '}'
    | assign
    ;

stmts:
      stmts assign
    |
    ;

assign:
    ID '=' expr ';'
    ;

expr:
      operand
    | expr '+' operand
    | expr '-' operand
    ;

operand:
      ID
    | NUM
    ;
%%

int yyerror(char *s)
{
    printf("Invalid WHILE statement\n");
    return 0;
}

int main()
{
    printf("Enter WHILE statement: ");
    yyparse();
    return 0;
}
