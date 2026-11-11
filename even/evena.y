%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%token A B

%%
input:
    E '\n' { printf("String Accepted\n"); }
    ;

/* E : even number of a's so far, O : odd number of a's so far */
E:
      E B
    | O A
    |
    ;

O:
      O B
    | E A
    ;
%%

int yyerror(char *s)
{
    printf("String Rejected\n");
    return 0;
}

int main()
{
    printf("Enter string over {a,b}: ");
    yyparse();
    return 0;
}
