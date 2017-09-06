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

{INTEGER}               { 
			  dte_t *simbolo = (dte_t*)malloc(sizeof(dte_t));
			  dte_t *_simbolo;

			  simbolo->line = line_counter;
			  char *lexema = strdup(yytext);
                          _simbolo = dict_put(dict, lexema, simbolo);
			  if (simbolo != _simbolo){
			     _simbolo->line = simbolo->line;
			  }
			  return TK_LIT_INT;
			}

{INTEGER}\.{DIGIT}+     { return TK_LIT_FLOAT; }
true                    { return TK_LIT_TRUE; }
false                   { return TK_LIT_FALSE; }
\'.\'                   { return TK_LIT_CHAR; }
\"[^"]*\"               {

			  dte_t *simbolo = (dte_t*)malloc(sizeof(dte_t));
			  dte_t *_simbolo;
			  simbolo->line = line_counter;
			  char *lexema = strdup(yytext);
			  lexema[strlen(lexema)-1] = '\0';
			  lexema = &(lexema[1]);

                          _simbolo = dict_put(dict, lexema, simbolo);
			  if (simbolo != _simbolo){
			     _simbolo->line = simbolo->line;
			  }

			  return TK_LIT_STRING;
}

[ \t]+
\n                      { line_counter++; }
.+                      { return TOKEN_ERRO; }

%%
