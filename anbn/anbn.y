%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token A B

%%
input:
    S '\n' { printf("String Accepted\n"); };
S: A S B| ;
%%

int yyerror(char *s)
{
    printf("String Rejected\n");
    return 0;
}

int main()
{
    printf("Enter string (a^n b^n): ");
    yyparse();
    return 0;
}
