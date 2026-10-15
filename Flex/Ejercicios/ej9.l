 //Filtro que elimine comentarios scripts (desde # hasta fin de línea)

%%

#.*		{/*No hacemos nada*/;}

.		{ECHO;}
\n		{ECHO;}

%%

int main(){
	yylex();
	return 0;
}
