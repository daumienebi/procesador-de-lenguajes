
%x COM

%%

"//".*\n		;
"/*"			BEGIN(COM);
<COM>"/*"		BEGIN(INITIAL);
<COM>.|n		;
<*>,|/N			ECHO		


%%


aaAA
