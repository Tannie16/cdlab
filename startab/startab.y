%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token A B OTHER

%%
input:
    A M B '\n' { printf("String Accepted\n"); }
    ;

M:
      M A
    | M B
    | M OTHER
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
    printf("Enter string: ");
    yyparse();
    return 0;
}
