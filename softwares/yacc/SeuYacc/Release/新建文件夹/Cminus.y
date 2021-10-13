%right '=' '+=' '-=' '*=' '/='
%left '==' '!='
%left '<' '>' '<=' '>='
%left '+' '-'
%left '*' '/'
%left '||'
%left '&&'
%right '!'
%left 'else'
%%

var_decl   : 'int' 'id' {}
		;