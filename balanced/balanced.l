%{
#include "y.tab.h"
%}

%%
"("     { return LPAREN; }
")"     { return RPAREN; }
"{"     { return LBRACE; }
"}"     { return RBRACE; }
"["     { return LBRACKET; }
"]"     { return RBRACKET; }
\n      { return '\n'; }
[ \t]   ;
.       { return INVALID; }
%%

int yywrap() {
    return 1;
}
