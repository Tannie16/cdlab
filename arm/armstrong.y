%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}
%token NUM
%%
input : NUM '\n'
        {
            int n = $1, temp = n, digits = 0, i, d;
            long sum = 0, power;
            while (temp > 0) { digits++; temp /= 10; }
            if (n == 0) digits = 1;
            temp = n;
            while (temp > 0) {
                d = temp % 10;
                power = 1;
                for (i = 0; i < digits; i++) power *= d;
                sum += power;
                temp /= 10;
            }
            if (sum == n) printf("%d is an Armstrong number\n", n);
            else          printf("%d is NOT an Armstrong number\n", n);
            YYACCEPT;
        }
      ;
%%
int yyerror(char *s) { printf("Invalid input\n"); return 0; }
int main() { printf("Enter a number: "); yyparse(); return 0; }
