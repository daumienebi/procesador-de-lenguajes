 //Construir un filtro que transforme todas las letras mayúsculas en minúsculas.
 
%{
#include <ctype.h>

%}
 
%%

[A-Z]		{
		/*Lo convertimos a lowercase*/
		printf("%c",tolower(yytext[0]));
		}


%%

int main(){

	yylex();
	return 0;
}
