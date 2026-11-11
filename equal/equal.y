%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token ZERO ONE

%%
input:
    S '\n' { printf("String Accepted\n"); }
    ;

/* Split the string at every point where #0 == #1.
   Each piece is either an "up" piece (starts with 0, ends with first return
   to balance) or a "down" piece (starts with 1).  Inside an up piece only
   smaller up pieces can occur, and similarly for down pieces.            */
S:
      S UP
    | S DOWN
    |
    ;

UP:
    ZERO UPS ONE
    ;

UPS:
      UPS UP
    |
    ;

DOWN:
    ONE DOWNS ZERO
    ;

DOWNS:
      DOWNS DOWN
    |
    ;
%%

int yyerror(char *s)
{
    printf("String Rejected\n");
    return 0;
}

int main()
{
    printf("Enter binary string: ");
    yyparse();
    return 0;
}
