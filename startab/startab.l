%option noyywrap
%{
#include "y.tab.h"
%}

%%
a         return A;
b         return B;
[c-z]     return OTHER;
\n        return '\n';
.         return yytext[0];
%%
