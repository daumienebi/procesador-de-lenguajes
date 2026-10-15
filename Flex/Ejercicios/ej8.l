 //Programa que cuente los números en formato punto flotante que aparecen en un fichero cuyo nombre se le pasa como argumento.

%{
int contador = 0;
%}
%%

[0-9]+\.[0-9]+?		{contador++;}

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
	printf("Hay %d números en formato punto flotante\n",contador);
	return 0;
}
