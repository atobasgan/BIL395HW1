%{
#include "calculator.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

%%

[0-9]+"."[0-9]+      { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+               { yylval.fval = atof(yytext); return FLOAT; }
"**"                 { return POW; }
"^"                  { return POW; }
"+"                  { return PLUS; }
"-"                  { return MINUS; }
"*"                  { return TIMES; }
"/"                  { return DIVIDE; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
[ \t\n]+             { /* boşlukları yoksay */ }

.                    { printf("Geçersiz karakter: %s\n", yytext); return 0; }

%%

int yywrap(void) {
    return 1;
}
