%option noyywrap
%{
#include "y.tab.h"
%}

%%
0       return ZERO;
1       return ONE;
\n      return '\n';
.       return yytext[0];
%%
