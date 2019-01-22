%{
	#include "string.h"
	#include "y.tab.h"
	int yyparse();
	int yywrap();
%}

INT [0]|[1-9][0-9]*
HEX	0x[A-F0-9]+
FLOAT ([0]|[1-9][0-9]*)[.][0-9]+
EXP	([0]|[1-9][0-9]*)[.][0-9]+[E][+|-][0-9]+
LINE ^[0-9]:

%%
{EXP} {	
	yylval.wyr = malloc(strlen(yytext));
	strcpy(yylval.wyr, yytext);
	return Exp;
}
{FLOAT} {
	yylval.wyr = malloc(strlen(yytext));
	strcpy(yylval.wyr, yytext);
	return Float;
}
{INT} {	
	yylval.wyr = malloc(strlen(yytext));
	strcpy(yylval.wyr, yytext);
	return Int;
}
{HEX} {
	yylval.wyr = malloc(strlen(yytext));
	strcpy(yylval.wyr, yytext);
	return Hex;
}
\n { return N; }
{LINE}	;
[ \t] ;
. {	printf("Niespodziewany znak!\n"); return UNK; }
%%
