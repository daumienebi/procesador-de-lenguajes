 //Un filtro que liste las “palabras” que encabezan y finalizan las líneas
 
%%

[a-zA-Z]+/\n		{
 			   /*Mostrar los del final de linea que son palabras seguidos de un salto de linea*/
			   printf("%s",yytext);
			}
			
^[a-zA-Z]+" "		{
 			   /*Mostrar los del principio de linea que son palabras seguidos de un espacio*/
			   printf("%s",yytext);
			}


.			{;}

\n			{;}

%%

int main(){

	yylex();
	return 0;
}
