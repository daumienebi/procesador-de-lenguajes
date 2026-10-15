 //Construir un filtro que codifique el texto de un fichero usando el cifrado “César”.
 
%{
#include <ctype.h>
int clave_cifrado = 3; // clave para el cifrado
%}
 
%%
[a-zA-Z]		{
			   /*Cogemos el char que has leido flex, lo pasamos a minusculas antes de cifrarlo */
			   printf("%c",tolower(yytext[0]) + clave_cifrado);
			}
%%

int main(){

	yylex();
	return 0;
}
