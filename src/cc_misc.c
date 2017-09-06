#include "cc_misc.h"

int comp_get_line_number (void)
{
  //implemente esta função
  return line_counter;
}

void yyerror (char const *mensagem)
{
  fprintf (stderr, "%s\n", mensagem); //altere para que apareça a linha
}

void main_init (int argc, char **argv)
{
  //implemente esta função com rotinas de inicialização, se necessário
	if (!dict){
		dict = dict_new();
	}
}

void main_finalize (void)
{
  //implemente esta função com rotinas de inicialização, se necessário
	comp_print_table();
}

void comp_print_table (void)
{
  //para cada entrada na tabela de símbolos
  //Etapa 1: chame a função cc_dict_etapa_1_print_entrada
  //implemente esta função
 int i;
 int l;
 dte_t *simbolo;

  for (i = 0, l = dict->size; i < l; ++i) {
    if (dict->data[i]) {
        simbolo = (dte_t *)dict->data[i]->value;
	cc_dict_etapa_1_print_entrada(dict->data[i]->key, simbolo->line);
    }
  }

}
