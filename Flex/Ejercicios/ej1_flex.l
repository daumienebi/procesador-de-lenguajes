 // El espacio antes de estos comentarios son importantes!!
 // Ejemplo de codigo en flex para reconocer el numero de palabras y numeros que recibe por teclado
 
%{
int num_pal,num_num;
%}
%%
[a-zA-Z]+		{num_pal++;}
[0-9]+			{num_num++;}
.|\n			;
%%

int main(){
	yylex();
	printf("Números : %d, Palabras : %d \n",num_num,num_pal);
	return 0;
}
