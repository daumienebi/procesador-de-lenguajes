 // Construir un programa que toma como argumento un nombre de fichero y muestra su contenido por pantalla anteponiendo a cada línea su número, también debe poder utilizarse como un filtro (como cat –n).

%{

int num_linea = 0;
%}

%%

.+\n		{
		   /*Recojo cualquier caracter de la linea y lo muestro con su numero de linea, se podria mejorar asignandolos de golpe*/
		   num_linea++;
		   printf("%d. %s",num_linea,yytext);		
		}

%%

int main(int argc, char **argv) {
	if(argc > 1) {
		FILE *file;
		file = fopen(argv[1], "r");

		if (!file) {
			fprintf(stderr, "no se puede abrir %s\n", argv[1]);
			exit(1);
		}

		yyin = file;
	} // else yyin=stdin; 

	yylex();
	return 0;
}
