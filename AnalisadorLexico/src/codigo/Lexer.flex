package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
P = [0-9]+\.[0-9]+
LIT = [\'][^\;]+[\']|[\"][^\;]+[\"]
COM = [/][/][^\n]+|[/][*][^]+[*][/]
A = [a-zA-Z]+([\[][\]])+ |[a-zA-Z]+([\[][0-9]+[\]])+
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


"=" | "+" | "-" | "*" | "/" | "%" | "**" | ">" | "<" | ">="| "<="| "=="| "!=" |
"++" | "+="| "-="| "*="| "/="| "%=" | "^=" |"--"| "&&"| "||"| "~"| "<<"| ">>"| "&" | "^" {lexeme=yytext(); return OPERADOR;}
{COM} {lexeme=yytext(); return COMENTARIO;}
"(" | ")" | "{" | "{" | "}"| "[" | "]" | "," | ";" | "."  {lexeme=yytext(); return SIMBOLOS;}
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}
{LIT} | ("(-"{D}+")")|{D}+ | {P} {lexeme=yytext(); return LITERAL;}
{A} {lexeme=yytext(); return ARRAY;}
 . {return ERROR;}
