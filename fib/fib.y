%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}
%token NUM
%%
input : NUM '\n'
        {
            int n = $1, i;
            long a = 0, b = 1, next;
            printf("Fibonacci series: ");
            for (i = 0; i < n; i++) {
                printf("%ld ", a);
                next = a + b;
                a = b;
                b = next;
            }
            printf("\n");
            YYACCEPT;
        }
      ;
%%
int yyerror(char *s) { printf("Invalid input\n"); return 0; }
int main() { printf("Enter number of terms: "); yyparse(); return 0; }
