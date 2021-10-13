%{
#include <stdio.h>
void single_line_comment();
void multi_line_comment();
%}

digit        [0~9]
letter      [a-zA-Z]
id          {letter}({letter}|{digit})*
number    {digit}+(.{digit}+)?(E[+-]?{digit}+)?
hex       0(x|X)(0|1|2|3|4|5|6|7|8|9|a|b|c|d|e|f|A|B|C|D|E|F)*

%%
"//"		{single_line_comment(); return ("single");}
"/*"		{multi_line_comment(); return ("multi");}
"void"		return ("void");
"int"		return ("int");
"char"		return ("char");
"double"	return ("double");
"float"		return ("float");
"bool"      return ("bool");
"true"      return ("true");
"false"     return ("false");
"long"	    return ("long");
"short"     return ("short");
"static"	return ("static");
"const"     return ("const");
"sizeof"	return ("sizeof");
"enum"		return ("enum");
"typedef"   return ("typedef");
"struct"	return ("struct");
"switch"	return ("switch");
"break"		return ("break");
"case"		return ("case");
"default"	return ("default");
"do"		return ("do");
"while"		return ("while");
"for"		return ("for");
"auto"		return ("auto");
"continue"	return ("continue");
"if"		return ("if");
"else"		return ("else");
"return"	return ("return");
{number} 	return ("num");
{id}		return ("id");
{hex}		return ("hex");
"->"		return ("ptr_op");
"+" 		return ("+");
"-" 		return ("-");
"*" 		return ("*");	
"/" 		return ("/");
"%" 		return ("%");
"?" 		return ("?");
"&"         return ("&");
"++"		return ("++");
"--"		return ("--");
"+=" 		return ("+=");
"-=" 		return ("-=");
"*=" 		return ("*=");
"/=" 		return ("/=");
"&&" 		return ("&&");
"||" 		return ("||");
"<=" 		return ("<=");
">=" 		return (">=");
"=" 		return ("="); 
"==" 		return ("=="); 
"!=" 		return ("!=");
"!"         return ("!");
"<" 		return ("<");
">" 		return (">"); 
"<<"        return ("<<");
">>"        return (">>");
"(" 		return ("(");
")" 		return (")");
"{" 		return ("{");
"}" 		return ("}");
"[" 		return ("[");
"]" 		return ("]");
"," 		return (",");
"."			return (".");
";" 		return (";");
":" 		return (":");
" " 		return (" ");
"""			return ("\"");
"'"			return ("'");
"|"			return ("|");
"^"			return ("^");
"~"			return ("~");
"$"			return ("$");
"**"		return ("fffffff");
"\n"		return ("");
"_"			return ("_");
%%


void single_line_comment()
{
	while (c != '\n')
	{
		c = c_save[pos];
		//cout << c << endl;
		pos++;
	}
	pos--;
	c = c_save[pos];
	//cout << c << endl;
	pos++;
	return;
}
void multi_line_comment()
{
	bool flag = false;
	while (pos < c_save.size())
	{
		if (c == '/' && flag == true)break;
		if (c == '*')flag = true;
		c = c_save[pos];
		if (c == '\n')
		{
			hang++;
		}
		pos++;
	}
	c = c_save[pos];
	if (c_save[pos] == '\n')
		hang++;
	pos++;
	//if(c_save[pos]=='\n')
	return;
}
