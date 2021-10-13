var c;
var state;
var pos=0;//当前字符串位置
var state1;
var state2;
var hang=1;//行号
var postion=1;//位置序号
var change=0;//行号增加数量
var next="";//下一个
var current="";//当前
var endS=[31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,30,30,30,30,30,30,30,30,30,30,54,70,38,71,59,60,36,34,65,35,66,37,68,67,55,51,56,39,63,64,73,61,72,62,69,74,40,75,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,30,31,31,28,31,31,20,31,31,30,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,30,31,31,31,31,31,10,31,31,31,31,31,30,31,31,30,31,31,31,31,31,30,31,22,31,31,30,31,31,30,31,27,31,31,31,31,31,31,31,31,31,31,31,32,32,30,30,30,30,30,30,30,30,30,30,14,53,76,45,31,41,43,5,42,44,26,33,1,0,46,57,49,21,52,50,58,77,48,47,31,31,31,31,31,31,31,31,31,31,31,31,24,3,32,31,31,31,31,31,31,32,31,31,30,31,31,30,31,32,32,32,32,30,32,32,30,32,32,30,32,32,30,32,32,30,32,32,7,32,32,30,32,32,32,32,30,30,30,30,30,30,30,30,30,30,25,31,4,31,31,15,31,31,31,31,8,2,30,30,30,30,30,30,30,30,30,30,30,30,30,30,19,13,31,31,31,9,6,31,11,31,31,31,31,31,23,31,31,29,12,17,18,31,16,-1,];
var CODE="abcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^";
function single_line_comment()
{
	var temp="";
	temp+=txt_save[pos-1];
    while(c!='\n')
    {
		c=txt_save[pos];
		if(c!='\n')temp+=c;
		pos++;
	}
	pos--;
	c=txt_save[pos];
	pos++;
	tokens_list=tokens_list+current+temp+"#";
    return;
}

function multi_line_comment()
{
	var flag=false;
	var temp="";
	var a;
	temp+=txt_save[pos-1];
    while(pos<txt_save.length)
    {
        if(c=='/'&&flag==true) break;
		if(c=='*') flag=true;
		c=txt_save[pos];
		temp+=c;
		pos++;
	}
	c=txt_save[pos];
	pos++;
	var split_multi=split_text(temp,"\n");
	tokens_list=tokens_list+current;
	for(var i=0;i<split_multi.length-1;i++)
	{
	tokens_list=tokens_list+split_multi[i]+"#multi#"+hang+"#"+postion+"\n";
	hang++;
	}
	tokens_list=tokens_list+split_multi[split_multi.length-1]+"#";
    return;
}

function act(p)
{
	switch(p)
	{
		case 0:
		single_line_comment(); 
		//console.log(notes);
		return ("single");
		break;
		case 1:
		multi_line_comment(); 
		//console.log(notes);
		return ("multi");
		break;
		case 2:
		return ("void");
		break;
		case 3:
		return ("int");
		break;
		case 4:
		return ("char");
		break;
		case 5:
		return ("double");
		break;
		case 6:
		return ("float");
		break;
		case 7:
		return ("bool");
		break;
		case 8:
		return ("true");
		break;
		case 9:
		return ("false");
		break;
		case 10:
		    return ("long");
		break;
		case 11:
		return ("short");
		break;
		case 12:
		return ("static");
		break;
		case 13:
		return ("const");
		break;
		case 14:
		return ("sizeof");
		break;
		case 15:
		return ("enum");
		break;
		case 16:
		return ("typedef");
		break;
		case 17:
		return ("struct");
		break;
		case 18:
		return ("switch");
		break;
		case 19:
		return ("break");
		break;
		case 20:
		return ("case");
		break;
		case 21:
		return ("default");
		break;
		case 22:
		return ("do");
		break;
		case 23:
		return ("while");
		break;
		case 24:
		return ("for");
		break;
		case 25:
		return ("auto");
		break;
		case 26:
		return ("continue");
		break;
		case 27:
		return ("if");
		break;
		case 28:
		return ("else");
		break;
		case 29:
		return ("return");
		break;
		case 30:
		return ("num");
		break;
		case 31:
		return ("id");
		break;
		case 32:
		return ("hex");
		break;
		case 33:
		return ("ptr_op");
		break;
		case 34:
		return ("+");
		break;
		case 35:
		return ("-");
		break;
		case 36:
		return ("*");
		break;
		case 37:
		return ("/");
		break;
		case 38:
		return ("%");
		break;
		case 39:
		return ("?");
		break;
		case 40:
		return ("&");
		break;
		case 41:
		return ("++");
		break;
		case 42:
		return ("--");
		break;
		case 43:
		return ("+=");
		break;
		case 44:
		return ("-=");
		break;
		case 45:
		return ("*=");
		break;
		case 46:
		return ("/=");
		break;
		case 47:
		return ("&&");
		break;
		case 48:
		return ("||");
		break;
		case 49:
		return ("<=");
		break;
		case 50:
		return (">=");
		break;
		case 51:
		return ("=");
		break;
		case 52:
		return ("==");
		break;
		case 53:
		return ("!=");
		break;
		case 54:
		return ("!");
		break;
		case 55:
		return ("<");
		break;
		case 56:
		return (">");
		break;
		case 57:
		return ("<<");
		break;
		case 58:
		return (">>");
		break;
		case 59:
		return ("(");
		break;
		case 60:
		return (")");
		break;
		case 61:
		return ("{");
		break;
		case 62:
		return ("}");
		break;
		case 63:
		return ("[");
		break;
		case 64:
		return ("]");
		break;
		case 65:
		return (",");
		break;
		case 66:
		return (".");
		break;
		case 67:
		return (";");
		break;
		case 68:
		return (":");
		break;
		case 69:
		return (" ");
		break;
		case 70:
		return ("\"");
		break;
		case 71:
		return ("'");
		break;
		case 72:
		return ("|");
		break;
		case 73:
		return ("^");
		break;
		case 74:
		return ("~");
		break;
		case 75:
		return ("$");
		break;
		case 76:
		return ("fffffff");
		break;
		case 77:
		return ("");
		break;
	}
	return"";
}


//const tokens=readText("text.c");


function analysis(current,next)
{
	//console.log(state,current);
	state1=dfaTable[state][CODE.indexOf(current)];
    if(state1!=-1)
    {
		//console.log(state1,next)
		state2=dfaTable[state1][CODE.indexOf(next)];
        if(state2==-1)
        {
			var action=act(endS[state1]);
			state=349;
			if (action == "num" && (pos + 1 < txt_save.length) && (CODE.indexOf(txt_save[pos - 1]) < 53))
			{
				//console.log("weifa");
				tokens_list=tokens_list+current;
				var i = pos - 1;
				while (CODE.indexOf(txt_save[i]) < 63)
				{
					tokens_list += txt_save[i];
					i = pos;
					pos++;
				}
				pos--;
				c = txt_save[pos];
				current = c;
				pos++;
				next = txt_save[pos];
				return"#fffffff";
			}
			else
			{
				if(action == "single"||action == "multi")
				{
					return action;
				}
			
				tokens_list=tokens_list+current+"#";
				return action;
			}
        }
		state=state1;
		tokens_list=tokens_list+current;
        return "";
    }
    else return"#fffffff";
}

function analysis_main()
{
	state1=0;
	state2=0;
	pos=0;
	
	//console.log(txt_save);
	hang=1;
    postion=1;
    change=0;

    state=349;
    next="";
	current="";
	current=txt_save[pos];
    pos++;
	while(pos<txt_save.length)
	{
		c = txt_save[pos];
		pos++;
		next=c;
		if (current == '\n'&&next!='\t')
		{
			change++;
		}
		if(c=='\t') continue;
		var t=analysis(current,next,state);
		if(t!="") 
		{
			if (change != 0)
				postion = 0;
			hang += change;
			change= 0;
			if (current != '\n')
			tokens_list=tokens_list+t+"#"+hang+"#"+postion+"\n";
			postion++;
		}
		current=c;
	}
	var ee=0;
	if(current!=undefined&&current!="\n")
	{
	var t=analysis(current,ee);
	if(t!="") tokens_list=tokens_list+t+"#"+hang+"#"+postion+"\n";
	}
	//console.log(tokens_list);
	
}