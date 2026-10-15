 //Un filtro que añada el número de línea
 
%{
int num_lineas = 0; 

%}
 
%%

.+\n		{
		   /*Simplemente recojo cualquier cosa de enetrada y le pongo el numero de linea delante*/
		   num_lineas++;
		   printf("%d. %s ",num_lineas,yytext);
		}

%%

int main(){
	yylex();
	printf("Hay %d lineas\n",num_lineas);
	return 0;
}
