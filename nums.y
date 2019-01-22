%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	void yyerror(char*);
	int yylex();
	int intSum = 0;
	double expSum = 0;
	float floatSum = 0;
	int hexSum = 0;
	int hexadecimalToDecimal(char hexVal[]);
	void decimalToHexadecimal(int n);
	int nrWiersza = 0;
%}

%union {char* wyr;}
%start START
%type <wyr> EXP
%type <wyr> FLOAT
%type <wyr> HEX
%type <wyr> INT
%token <wyr> Exp
%token <wyr> Float
%token <wyr> Hex
%token <wyr> Int
%token N
%token UNK

%%

START 
	: START EXP N { 	
		nrWiersza=nrWiersza+1;
		printf("Suma wykladniczych w %d wierszu = %f\n",nrWiersza, expSum);
		expSum = 0;
	 }
	| START FLOAT N { 
		nrWiersza=nrWiersza+1;
		printf("Suma staloprzecinkowych w %d wierszu = %.2f\n", nrWiersza, floatSum); floatSum = 0; 
	}
	| START INT N { 
		nrWiersza=nrWiersza+1;
		printf("Suma calkowitych w %d wierszu = %d\n",nrWiersza, intSum); intSum = 0; 
	}
	| START HEX N {
		nrWiersza=nrWiersza+1;
		printf("Suma heksadecymalnych w %d wierszu = 0x", nrWiersza);
		decimalToHexadecimal(hexSum);
		printf("\n"); 
		hexSum = 0;
	 }
	| /*nic*/
	;
EXP 
	: EXP Exp { expSum += atof($2); }
	| Exp { expSum += atof($1); }
	;
FLOAT 
	: FLOAT Float { floatSum += atof($2); }
	| Float { floatSum += atof($1); }
	;
HEX
	: HEX Hex { hexSum += hexadecimalToDecimal($2); }
	| HEX Int { hexSum += hexadecimalToDecimal($2); }
	| Hex { hexSum += hexadecimalToDecimal($1); }
	;
INT
	: INT Int { intSum += atoi($2); }
	| Int { intSum += atoi($1); }
	;
	
%%

int hexadecimalToDecimal(char hexVal[]) 
{    
    int len = strlen(hexVal); 
    int base = 1; 
    int dec_val = 0; 
      
    for (int i=len-1; i>=0; i--) 
    {    
        if (hexVal[i]>='0' && hexVal[i]<='9') 
        { 
            dec_val += (hexVal[i] - 48)*base; 
            base = base * 16; 
        } 
        else if (hexVal[i]>='A' && hexVal[i]<='F') 
        { 
            dec_val += (hexVal[i] - 55)*base; 
            base = base*16; 
        } 
    } 
    return dec_val; 
}
void decimalToHexadecimal(int n) 
{    
    char hexaDeciNum[100]; 
    int i = 0; 
    while(n!=0) 
    {   
        int temp  = 0; 
        temp = n % 16; 
        if(temp < 10) 
        { 
            hexaDeciNum[i] = temp + 48; 
            i++; 
        } 
        else
        { 
            hexaDeciNum[i] = temp + 55; 
            i++; 
        }
        n = n/16; 
    }  
    for(int j=i-1; j>=0; j--)
	{
		printf("%c",hexaDeciNum[j]);
	} 
} 
int main(){
	yyparse();
}
void yyerror(char* s){
	printf("%s", s);
}
int yywrap(){
	return 0;
}