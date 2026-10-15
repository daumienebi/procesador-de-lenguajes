 // Hacer un programa que cuente el número de líneas con menos de:
 //	a) 30 caracteres
 //	b) 30 letras

%{
int caracteres = 0;
int letras = 0;
int lineas_con_menos_de_30_caracteres = 0;
int lineas_con_menos_de_30_letras = 0;
%}

%%

[a-zA-Z]	{
			letras++;
			caracteres++;
		}

\n		{
			if(letras < 30){
			lineas_con_menos_de_30_letras++;
			}
			if(caracteres < 30){
			lineas_con_menos_de_30_caracteres++;
			}
			// Reiniciamos los contadores
			letras = 0;
			caracteres = 0;
		}

.		{caracteres++;}

%%
int main(){

	yylex();
	printf("\nLineas con menos de 30 caracteres : %d",lineas_con_menos_de_30_caracteres);
	printf("\nLineas con menos de 30 letras : %d\n",lineas_con_menos_de_30_letras);
	return 0;
}
