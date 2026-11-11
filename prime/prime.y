%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}
%token NUM
%%
input : NUM '\n'
        {
            int n = $1, i, prime = (n >= 2);
            for (i = 2; i * i <= n; i++)
                if (n % i == 0) { prime = 0; break; }
            if (prime) printf("%d is a Prime number\n", n);
            else       printf("%d is NOT a Prime number\n", n);
            YYACCEPT;
        }
      ;
%%
int yyerror(char *s) { printf("Invalid input\n"); return 0; }
int main() { printf("Enter a number: "); yyparse(); return 0; }
