package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espaco=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int | float | double | String | byte | char | long | short | boolean | void | return |
this | for | switch | case | if | else | break | default | instanceof | do | static |
new | class | public | private | abstract | protected | finally | import | native | transient |
assert | synchronized | const | package | this | enum | continue | extends | interface | throw | 
volatile | goto | super | throws | strictfp | implements | protected |
while {lexeme=yytext(); return KEYWORD;}
{espaco} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Soma;}
"-" {return Subtracao;}
"*" {return Multiplicacao;}
"/" {return Divisao;}
"%" {return Modulo;}
"**" {return Potencia;}
"(" {return AbreParenteses;}
")" {return FechaParenteses;}
"{" {return AbreChaves;}
"}" {return FechaChaves;}
"[" {return AbreColchetes;}
"]" {return FechaColchetes;}
">" {return Maior;}
"<" {return Menor;}
"<" {return Menor;}
">=" {return MaiorIgual;}
"<=" {return MenorIgual;}
"==" {return Comparacao;}
"!=" {return Diferente;}
"++" {return Incrementa;}
"--" {return Decrementa;}
"&&" {return Condicional_AND;}
"||" {return Condicional_OR;}
"?:" {return Ternario;}
"~" {return Complemento;}
"<<" {return Signed_Left_Shift;}
">>" {return Signed_Right_Shift;}
"&" {return Bitwise_AND;}
"^" {return Bitwise_Exclusive_OR;}


{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return NUMERO;}
<<EOF>> {lexeme=yytext(); return FIM;}
 . {return ERROR;}
