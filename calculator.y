%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    double fval;
}

%token <fval> FLOAT
%token PLUS MINUS TIMES DIVIDE POW LPAREN RPAREN

%left PLUS MINUS
%left TIMES DIVIDE
%right POW

%type <fval> expr

%%

program:
    expr { printf("Sonuç: %lf\n", $1); }
;

expr:
    expr PLUS expr   { $$ = $1 + $3; }
  | expr MINUS expr  { $$ = $1 - $3; }
  | expr TIMES expr  { $$ = $1 * $3; }
  | expr DIVIDE expr {
        if ($3 == 0.0) {
            yyerror("Hata: Sıfıra bölme!");
            exit(1);
        } else {
            $$ = $1 / $3;
        }
    }
  | expr POW expr    { $$ = pow($1, $3); }
  | LPAREN expr RPAREN { $$ = $2; }
  | FLOAT { $$ = $1; }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: %s\n", s);
}

int main(void) {
    return yyparse();
}
