 // Programa que muestre los URLs de un archivo html.


%%


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
