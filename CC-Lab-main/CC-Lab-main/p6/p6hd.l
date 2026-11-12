//Himesh Bhure
//24070521013
//Sem V Sec A


%{
#include <stdio.h>

void hexToDecimal(char a[]){
	int i,n=0,value;

	for(i=0;a[i]!='\0';i++){
		if(a[i]>='0' && a[i]<='9')
			value=a[i]-'0';
		else if(a[i]>='A' && a[i]<='F')
			value=a[i]-'A'+10;
		else
			value=a[i]-'a'+10;

		n=n*16+value;
	}

	printf("Decimal: %d",n);
}
%}

%%

[0-9A-Fa-f]+	{ hexToDecimal(yytext); }
.		{ putchar(yytext[0]); }

%%

int main(){
	printf("Enter a Hexadecimal Number: ");
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}
