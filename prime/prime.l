%option noyywrap
%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+  { yylval = atoi(yytext); return NUM; }
\n      { return '\n'; }
[ \t]   ;
.       { return yytext[0]; }
%%
