%{
#include <stdio.h>
int yylex();
int yyerror(const char *s);
%}

%token LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET INVALID

%%
input : expr '\n'
      ;

expr  : LPAREN expr RPAREN expr
      | LBRACE expr RBRACE expr
      | LBRACKET expr RBRACKET expr
      |
      ;
%%

int yyerror(const char *s) {
    printf("Not balanced\n");
    return 0;
}

int main() {
    printf("Enter brackets: ");
    if (yyparse() == 0)
        printf("Balanced\n");
    return 0;
}
