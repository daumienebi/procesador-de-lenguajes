%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int num_paquetes = 0, num_relaciones = 0, num_clases = 0;
int num_interfaces = 0, num_plantillas = 0;

char nombre_clase_max[100] = "";
int max_metodos = -1;

/* Variables relacionados con la clase actual */
char nombre_actual[100] = "";
int llaves = 0;
int metodos_actuales = 0;
%}

%option stack

%x COMENT TIKZ CLASE

%%

  /*Siempre ignoramos todos los comentarios*/
"%"                   { yy_push_state(COMENT); }
<COMENT>\n            { yy_pop_state(); }
<COMENT>.             { ; }

  /* Fuera del diagrama TikZ */
"\\begin{tikzpicture}"  { BEGIN(TIKZ); }
.|\n                    { ; }

  /* Cuando entramos al diagrama TikZ */
<TIKZ>{
    "\\end{tikzpicture}"  { BEGIN(INITIAL); }
    "\\begin{umlpackage}" { num_paquetes++; }
    "\\umlrelationship"   { num_relaciones++; }
    "\\umlclass"          { 
                            num_clases++; 
                            llaves = 0;
                            metodos_actuales = 0;
                            //limpiamos el array de chars que almacena el nombre
                            nombre_actual[0] = '\0';
                            BEGIN(CLASE); 
                          }
    .|\n                  { ; }
}

  /* Cuando nos encontramos dentro de una clase \umlclass */
<CLASE>{
    "type=interface"      { num_interfaces++; }
    "template="           { num_plantillas++; }

    "{"                   { llaves++; }
    "}"                   { 
                            /* Al cerrar la 3ª llave (métodos), guardamos y salimos */
                            if (llaves == 3) {
                                if (metodos_actuales > max_metodos) {
                                    max_metodos = metodos_actuales;
                                    strcpy(nombre_clase_max, nombre_actual);
                                }
                                BEGIN(TIKZ);
                            }
                          }
                          
    \\\\                  { if (llaves == 3) metodos_actuales++; }
    
    [a-zA-Z0-9_]+         { 
                            if (llaves == 1 && nombre_actual[0] == '\0') {
                                strcpy(nombre_actual, yytext);
                            } else if (llaves == 3 && metodos_actuales == 0) {
                                metodos_actuales = 1;
                            }
                          }

    .|\n                  { ; }
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
	}else yyin=stdin;
    yylex();
    printf("- El número de paquetes es %d.\n", num_paquetes);
    printf("- El número de relaciones es: %d.\n", num_relaciones);
    printf("- El número de clases es: %d (%d interfaces y %d plantillas).\n", 
           num_clases, num_interfaces, num_plantillas);
    if (max_metodos >= 0) {
        printf("- La clase con mayor número de métodos es \"%s\" con %d métodos.\n", 
               nombre_clase_max, max_metodos);
    }
    return 0;
}
