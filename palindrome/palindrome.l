%{
#include "y.tab.h"
%}

%%
[a-zA-Z0-9]   { yylval = yytext[0]; return CH; }
\n            { return '\n'; }
.             { return yytext[0]; }
%%

int yywrarp(){
return 1;
}
