%option noyywrap
%{
#include "y.tab.h"
%}

%%
"while"                     return WHILE;
[a-zA-Z_][a-zA-Z0-9_]*      return ID;
[0-9]+                      return NUM;
"<="|">="|"=="|"!="|"<"|">" return RELOP;
[ \t\n]                     ;
.                           return yytext[0];
%%
