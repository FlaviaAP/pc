/*
  Coloque aqui o identificador do grupo e dos seus membros
*/
%{
#include "parser.h" //arquivo automaticamente gerado pelo bison
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

.+                      { return TOKEN_ERRO;}

%%
