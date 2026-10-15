 // El espacio antes de estos comentarios son importantes!!
 // Ejemplo de codigo en flex que valdria para realizar sumas de importes de dinero
 // que recibimos en yenes(Y), dolares(S) y euros(E).
 
%{
float yenes,dolares,euros;
%}

nums "-"?[0-9]+(\.[0-9]+)?
%%
{nums}/E		{euros += atof(yytext);}
{nums}/S		{dolares += atof(yytext);}
{nums}/Y		{yenes += atof(yytext);}
.|\n			{/* Ignorar cualquier cosa que no sea los importes de dinero*/ ;}

%%
