%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
char buf[100];
int len = 0;
%}

%token CH

%%
input:
    str '\n'
    {
        int i, ok = 1;
        for (i = 0; i < len / 2; i++)
            if (buf[i] != buf[len - 1 - i]) ok = 0;
        if (ok) printf("String is a Palindrome\n");
        else    printf("String is NOT a Palindrome\n");
    }
    ;

str:
      CH       { buf[len++] = $1; }
    | str CH   { buf[len++] = $2; }
    ;
%%

int yyerror(char *s)
{
    printf("Invalid string\n");
    return 0;
}

int main()
{
    printf("Enter string: ");
    yyparse();
    return 0;
}
