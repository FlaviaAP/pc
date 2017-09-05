/*
  Coloque aqui o identificador do grupo e dos seus membros
*/
%{
#include "parser.h" //arquivo automaticamente gerado pelo bison
#include "cc_misc.h" // necessário para o contador de linhas

line_counter = 1;
%}

DIGIT    [0-9]
INTEGER  -?{DIGIT}+
LETTERS_ [_a-zA-Z]

%%

{INTEGER}               { return TK_LIT_INT; }
{INTEGER}\.{DIGIT}+     { return TK_LIT_FLOAT; }
true                    { return TK_LIT_TRUE; }
false                   { return TK_LIT_FALSE; }
\'.\'                   { return TK_LIT_CHAR; }
\"[^"]*\"               { return TK_LIT_STRING; }

[ \t]+
\n                      { line_counter++; }
.+                      { return TOKEN_ERRO; }

%%
