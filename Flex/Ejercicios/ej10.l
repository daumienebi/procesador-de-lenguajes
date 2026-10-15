 //Filtro que elimine líneas con más de tres tabuladores salvo que se encuentren consecutivos en cuyo caso simplemente los sustituya por un blanco

%{
int num_tabs = 0;
%}

%%

(\t\t\t)+		{
		   /*Lo sustituimos por un espacio en blanco*/
		   printf(" ");
		}


\t		{ 
		   num_tabs++;
		   ECHO;
		}

\n		{
		   if(num_tabs > 3){
		      // nada...lo ignoramos
		   }else{
		   	printf("\n");
		   }
		   num_tabs = 0;
		}

.		{ECHO;}

%%

int main(){
	yylex();
	return 0;
}
