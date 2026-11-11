%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token ZERO ONE

%%
input:
    C '\n' { printf("String Accepted\n"); }
    ;

/* Each non-terminal is a DFA state:
   A : start / last symbol 1 (no useful suffix)
   B : last symbol is 0
   C : last two symbols are 01  (accepting) */
A:
      A ONE
    | C ONE
    |
    ;

B:
      A ZERO
    | B ZERO
    | C ZERO
    ;

C:
      B ONE
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
