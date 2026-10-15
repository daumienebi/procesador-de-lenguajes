 //Hacer un programa que cuente el número de líneas en blanco.

%{
int num_lineas_blanco = 0;
%}
%%

^[ \t ]*\n	{
			// Usamos \t para cubrir tanto los espacios
			// como los tabuladores
			num_lineas_blanco ++;
		}


.		{;}
\n		{;}

%%

int main(){

	yylex();
	printf("Hay %d lineas en blanco\n",num_lineas_blanco);
	
}


/* Forma no tan eficiente porque no tiene en cuenta los espacios en blanco
 //Hacer un programa que cuente el número de líneas en blanco.

%{
int num_lineas_blanco = 0;
int num_caracteres = 0;
%}
%%

.		{num_caracteres ++;}


\n		{
			if(num_caracteres == 0){
			   num_lineas_blanco++;
			}
			// Reiniciamos el contador
			num_caracteres = 0;
		}

%%

int main(){

	yylex();
	printf("Hay %d lineas en blanco",num_lineas_blanco);
	
}
*/
