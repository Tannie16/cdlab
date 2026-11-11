%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token FOR ID NUM RELOP INC DEC

%%
statement:
    FOR '(' init ';' condition ';' update ')' body
    { printf("Valid FOR statement\n"); }
    ;

init:
    ID '=' expr
    ;

condition:
    operand RELOP operand
    ;

update:
      ID INC
    | ID DEC
    | ID '=' expr
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
    printf("Invalid FOR statement\n");
    return 0;
}

int main()
{
    printf("Enter FOR statement: ");
    yyparse();
    return 0;
}
