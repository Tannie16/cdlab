%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token A B

%%
input:
    S B '\n' { printf("String Accepted\n"); }
    ;

S:
      S A
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
    printf("Enter string (a*b): ");
    yyparse();
    return 0;
}
