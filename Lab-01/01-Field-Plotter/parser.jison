/*
	A cursory grammar for mathematical expressions.
	Author: Alexander Novotny
*/

%lex
%%

\s+ // Ignored
[0-9]+("."[0-9]+)?\b    return 'NUMBER'
"*"                     return '*'
"/"                     return '/'
"-"                     return '-'
"+"                     return '+'
"^"                     return '^'
"("                     return '('
")"                     return ')'
"pi"                    return 'PI'
"e"                     return 'E'
"sin"                   return 'SIN'
"cos"                   return 'COS'
"tan"                   return 'TAN'
"ln"                    return 'LOG'
"sqrt"                  return 'SQRT'
"x"                     return 'x'
"y"                     return 'y'
.                       return 'ERROR'

/lex

%left '+' '-'
%left '*' '/'
%left '^'

%start expression

%%

expression
	: term
	| term '+' expression
	| term '-' expression
	;

term
	: factor
	| factor '*' term
	| factor '/' term
	| factor term
	;

factor
	: base
	| base '^' factor
	;

base
	: NUMBER
	| variable
	| funcs base
	| PI
	| E
	| '(' expression ')'
	;

variable
	: x
	| y
	;

funcs
	: SIN
	| COS
	| TAN
	| LOG
	| SQRT
	;