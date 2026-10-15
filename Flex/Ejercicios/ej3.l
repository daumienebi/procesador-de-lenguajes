 //Hacer un programa que cuente el número de espacios y tabuladores.
 
%{

int num_tabuladores = 0;
int num_espacios = 0;

%}
 
%%
 
\t		{num_tabuladores++;}

(" ")		{num_espacios++;}

.		{;}
\n		{;}

%%

int main(){

	yylex();
	printf("Num tabuladores : %d\n",num_tabuladores);
	printf("Num espacios : %d\n",num_espacios);
}
