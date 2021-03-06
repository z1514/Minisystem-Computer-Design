/* 
* actionYacc.h
* auto generated by SeuYacc::output_action()
* action source file: Cminus.y
*/ 

#include "DataStructureDefine.h"
#include "generateHead.h"
using namespace std;


string p;

pair<unsigned int, string> performAction(unsigned int index, map<string, string>& reduceHead) {
size_t stackSize = Stack.size() - 1;

switch(index) {
case 0 ://S->program 

return pair<unsigned int, string>(1,"S");

case 1 ://program->globalData stmts 

return pair<unsigned int, string>(2,"program");

case 2 ://program->stmts 

return pair<unsigned int, string>(1,"program");

case 3 ://globalData->globalStmts 
		
return pair<unsigned int, string>(1,"globalData");

case 4 ://globalStmts->globalStmts globalStmt 

return pair<unsigned int, string>(2,"globalStmts");

case 5 ://globalStmts->globalStmt 

return pair<unsigned int, string>(1,"globalStmts");

case 6 ://globalStmt->static var_decl ; 

return pair<unsigned int, string>(3,"globalStmt");

case 7 ://stmts->stmts M stmt 
			backpatch(Stack[stackSize - 3 + 1]._map["nextlist"], Stack[stackSize - 3 + 2]._map["instr"]);
			reduceHead["nextlist"] = Stack[stackSize - 3 + 3]._map["nextlist"];
			
return pair<unsigned int, string>(3,"stmts");

case 8 ://stmts->stmt 
			reduceHead["nextlist"] = Stack[stackSize - 1 + 1]._map["nextlist"];
			
return pair<unsigned int, string>(1,"stmts");

case 9 ://stmt->{ stmts } 
			reduceHead["nextlist"] = Stack[stackSize - 3 + 2]._map["nextlist"];
			
return pair<unsigned int, string>(3,"stmt");

case 10 ://stmt->fun_define 
			returnToGlobalTable();
			
return pair<unsigned int, string>(1,"stmt");

case 11 ://stmt->if_stmt 
			reduceHead["nextlist"] = Stack[stackSize - 1 + 1]._map["nextlist"];
			
return pair<unsigned int, string>(1,"stmt");

case 12 ://stmt->while_stmt 
			reduceHead["nextlist"] = Stack[stackSize - 1 + 1]._map["nextlist"];
			
return pair<unsigned int, string>(1,"stmt");

case 13 ://stmt->var_decl ; 
			reduceHead["nextlist"] = Stack[stackSize - 2 + 1]._map["nextlist"];
			
return pair<unsigned int, string>(2,"stmt");

case 14 ://stmt->expr_stmt ; 
			
return pair<unsigned int, string>(2,"stmt");

case 15 ://stmt->return expr ; 
			emit("return",Stack[stackSize - 3 + 2]._map["place"],"","");
			setOutLiveVar(Stack[stackSize - 3 + 2]._map["place"]);
			
return pair<unsigned int, string>(3,"stmt");

case 16 ://stmt->return ; 
			emit("return","","","");
			
return pair<unsigned int, string>(2,"stmt");

case 17 ://fun_define->fun_decl_head BlockLeader { stmts } 
						reduceHead["name"] = Stack[stackSize - 5 + 1]._map["name"];
						
return pair<unsigned int, string>(5,"fun_define");

case 18 ://fun_decl_head->type_spec id ( ) 
						reduceHead["name"] = Stack[stackSize - 4 + 2]._map["lexeme"];
						createSymbolTable(Stack[stackSize - 4 + 2]._map["lexeme"], atoi(Stack[stackSize - 4 + 1]._map["width"].c_str()));
						addFunLabel(nextInstr, Stack[stackSize - 4 + 2]._map["lexeme"]);
						
return pair<unsigned int, string>(4,"fun_decl_head");

case 19 ://fun_decl_head->type_spec id ( param_list ) 
						reduceHead["name"] = Stack[stackSize - 5 + 2]._map["lexeme"];
						createSymbolTable(Stack[stackSize - 5 + 2]._map["lexeme"], atoi(Stack[stackSize - 5 + 1]._map["width"].c_str()));
						addToSymbolTable(Stack[stackSize - 5 + 4]._map["itemlist"]);
						addFunLabel(nextInstr, Stack[stackSize - 5 + 2]._map["lexeme"]);
						
return pair<unsigned int, string>(5,"fun_decl_head");

case 20 ://param_list->param_list , param 
                reduceHead["itemlist"] = Stack[stackSize - 3 + 1]._map["itemlist"]  +   Stack[stackSize - 3 + 3]._map["itemlist"];
                
return pair<unsigned int, string>(3,"param_list");

case 21 ://param_list->param 
                reduceHead["itemlist"] = Stack[stackSize - 1 + 1]._map["itemlist"];
                
return pair<unsigned int, string>(1,"param_list");

case 22 ://param->type_spec id 
		        reduceHead["itemlist"] = makeParam(Stack[stackSize - 2 + 2]._map["lexeme"],Stack[stackSize - 2 + 1]._map["type"],atoi(Stack[stackSize - 2 + 1]._map["width"].c_str()));
				
return pair<unsigned int, string>(2,"param");

case 23 ://param->type_spec id [ int_literal ] 
				reduceHead["itemlist"] = makeParam(Stack[stackSize - 5 + 2]._map["lexeme"],Array(atoi(Stack[stackSize - 5 + 4]._map["lexval"].c_str()),Stack[stackSize - 5 + 1]._map["type"]),atoi(Stack[stackSize - 5 + 4]._map["lexval"].c_str()) * atoi(Stack[stackSize - 5 + 1]._map["width"].c_str()));
                
return pair<unsigned int, string>(5,"param");

case 24 ://int_literal->num 
					reduceHead["lexval"] = Stack[stackSize - 1 + 1]._map["lexeme"];
					
return pair<unsigned int, string>(1,"int_literal");

case 25 ://static_var_decl->static var_decl 
					//reduceHead["code"] = Stack[stackSize - 2 + 2]._map["code"];
					
return pair<unsigned int, string>(2,"static_var_decl");

case 26 ://var_decl->type_spec id 
				enter(Stack[stackSize - 2 + 2]._map["lexeme"],Stack[stackSize - 2 + 1]._map["type"],atoi(Stack[stackSize - 2 + 1]._map["width"].c_str()));
				
return pair<unsigned int, string>(2,"var_decl");

case 27 ://var_decl->type_spec id [ int_literal ] 
				enter(Stack[stackSize - 5 + 2]._map["lexeme"],Array(atoi(Stack[stackSize - 5 + 4]._map["lexval"].c_str()),Stack[stackSize - 5 + 1]._map["type"]),atoi(Stack[stackSize - 5 + 4]._map["lexval"].c_str()) * atoi(Stack[stackSize - 5 + 1]._map["width"].c_str()));
				
return pair<unsigned int, string>(5,"var_decl");

case 28 ://type_spec->int 
				reduceHead["type"] = "int";
				reduceHead["width"] = "4";
				
return pair<unsigned int, string>(1,"type_spec");

case 29 ://type_spec->void 
				reduceHead["type"] = "void";
				reduceHead["width"] = "0";
				
return pair<unsigned int, string>(1,"type_spec");

case 30 ://expr_stmt->id = expr 
				p = lookupPlace(Stack[stackSize - 3 + 1]._map["lexeme"]);
				if (p.empty()) error();
				emit("=",Stack[stackSize - 3 + 3]._map["place"],"",p);
                
return pair<unsigned int, string>(3,"expr_stmt");

case 31 ://expr_stmt->addr_id = expr 
 				emit("$=",Stack[stackSize - 3 + 3]._map["place"],"",Stack[stackSize - 3 + 1]._map["place"]);
		   
return pair<unsigned int, string>(3,"expr_stmt");

case 32 ://expr->expr + expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("ADD", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 33 ://expr->expr - expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("SUB", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 34 ://expr->expr * expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("MUL", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 35 ://expr->expr / expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("DIV", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 36 ://expr->expr & expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("AND", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
								
return pair<unsigned int, string>(3,"expr");

case 37 ://expr->expr | expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("OR", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
				                
return pair<unsigned int, string>(3,"expr");

case 38 ://expr->expr ^ expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("XOR", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
				                
return pair<unsigned int, string>(3,"expr");

case 39 ://expr->~ expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 2 + 2]._map["place"]);
				emit("NOT", Stack[stackSize - 2 + 2]._map["place"],"", reduceHead["place"]);
				                
return pair<unsigned int, string>(2,"expr");

case 40 ://expr->- expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 2 + 2]._map["place"]);
				emit("NEG", Stack[stackSize - 2 + 2]._map["place"],"", reduceHead["place"]);
				                
return pair<unsigned int, string>(2,"expr");

case 41 ://expr->++ id 
                reduceHead["place"] = newtemp(Stack[stackSize - 2 + 2]._map["place"]);
				emit("ACC", Stack[stackSize - 2 + 2]._map["place"],"", reduceHead["place"]);
				                
return pair<unsigned int, string>(2,"expr");

case 42 ://expr->expr << expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("SLL", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 43 ://expr->expr >> expr 
                reduceHead["place"] = newtemp(Stack[stackSize - 3 + 1]._map["place"]);
				emit("SRL", Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], reduceHead["place"]);
                
return pair<unsigned int, string>(3,"expr");

case 44 ://expr->( expr ) 
                reduceHead["place"] = Stack[stackSize - 3 + 2]._map["place"];
                
return pair<unsigned int, string>(3,"expr");

case 45 ://expr->id 
				reduceHead["place"] = lookupPlace(Stack[stackSize - 1 + 1]._map["lexeme"]);
            
return pair<unsigned int, string>(1,"expr");

case 46 ://expr->addr_id 
 				reduceHead["place"] = newtemp(Stack[stackSize - 1 + 1]._map["place"]);
				emit("=$",Stack[stackSize - 1 + 1]._map["place"],"",reduceHead["place"]);
	 
return pair<unsigned int, string>(1,"expr");

case 47 ://expr->id ( arg_list ) 
		p = gen(paramStack.size());
		while (!paramStack.empty()) {			emit("param", paramStack.top(),"","");
			paramStack.pop();
		}		emit("call", p, Stack[stackSize - 4 + 1]._map["lexeme"],"");
		enter("#return","int",4);
		reduceHead["place"] = newtemp("#return");
		emit("=","#return","",reduceHead["place"]);
		//reduceHead["place"] = "return#";
	   
return pair<unsigned int, string>(4,"expr");

case 48 ://expr->num 
		reduceHead["place"] = addNum(Stack[stackSize - 1 + 1]._map["lexeme"]);
	   
return pair<unsigned int, string>(1,"expr");

case 49 ://arg_list->arg_list , expr 
				paramStack.push(Stack[stackSize - 3 + 3]._map["place"]);
				
return pair<unsigned int, string>(3,"arg_list");

case 50 ://arg_list->expr 
				paramStack.push(Stack[stackSize - 1 + 1]._map["place"]);
				
return pair<unsigned int, string>(1,"arg_list");

case 51 ://arg_list->
				//paramStack.clear();
		  
return pair<unsigned int, string>(0,"arg_list");

case 52 ://if_stmt->if ( logic_expr ) M stmt 
		backpatch(Stack[stackSize - 6 + 3]._map["truelist"], Stack[stackSize - 6 + 5]._map["instr"]);
		reduceHead["nextlist"] = merge(Stack[stackSize - 6 + 3]._map["falselist"], Stack[stackSize - 6 + 6]._map["nextlist"]);
		
return pair<unsigned int, string>(6,"if_stmt");

case 53 ://if_stmt->if ( logic_expr ) M stmt N else M stmt 
		backpatch(Stack[stackSize - 10 + 3]._map["truelist"], Stack[stackSize - 10 + 5]._map["instr"]);
		backpatch(Stack[stackSize - 10 + 3]._map["falselist"], Stack[stackSize - 10 + 9]._map["instr"]);
		reduceHead["nextlist"] = merge(merge(Stack[stackSize - 10 + 6]._map["nextlist"], Stack[stackSize - 10 + 7]._map["instr"]), Stack[stackSize - 10 + 10]._map["nextlist"]);
		
return pair<unsigned int, string>(10,"if_stmt");

case 54 ://while_stmt->while M ( logic_expr ) M stmt 
		backpatch(Stack[stackSize - 7 + 7]._map["nextlist"], Stack[stackSize - 7 + 2]._map["instr"]);
		backpatch(Stack[stackSize - 7 + 4]._map["truelist"], Stack[stackSize - 7 + 6]._map["instr"]);
		reduceHead["nextlist"] = Stack[stackSize - 7 + 4]._map["falselist"];
		emit("j","","",Stack[stackSize - 7 + 2]._map["instr"]);
		
return pair<unsigned int, string>(7,"while_stmt");

case 55 ://logic_expr->logic_expr && M logic_expr 
				backpatch(Stack[stackSize - 4 + 1]._map["truelist"], Stack[stackSize - 4 + 3]._map["instr"]);
				reduceHead["truelist"] = Stack[stackSize - 4 + 4]._map["truelist"];
				reduceHead["falselist"] = merge(Stack[stackSize - 4 + 1]._map["falselist"], Stack[stackSize - 4 + 4]._map["falselist"]);
			
return pair<unsigned int, string>(4,"logic_expr");

case 56 ://logic_expr->logic_expr || M logic_expr 
				backpatch(Stack[stackSize - 4 + 1]._map["falselist"], Stack[stackSize - 4 + 3]._map["instr"]);
				reduceHead["truelist"] = merge(Stack[stackSize - 4 + 1]._map["truelist"], Stack[stackSize - 4 + 4]._map["truelist"]);
				reduceHead["falselist"] = Stack[stackSize - 4 + 4]._map["falselist"];
			
return pair<unsigned int, string>(4,"logic_expr");

case 57 ://logic_expr->! logic_expr 
				reduceHead["truelist"] = Stack[stackSize - 2 + 2]._map["falselist"];
				reduceHead["falselist"] = Stack[stackSize - 2 + 2]._map["truelist"];
			
return pair<unsigned int, string>(2,"logic_expr");

case 58 ://logic_expr->( logic_expr ) 
				reduceHead["truelist"] = Stack[stackSize - 3 + 2]._map["truelist"];
				reduceHead["falselist"] = Stack[stackSize - 3 + 2]._map["falselist"];
			
return pair<unsigned int, string>(3,"logic_expr");

case 59 ://logic_expr->expr rel expr 
				reduceHead["truelist"] = makelist(nextInstr);
				reduceHead["falselist"] = makelist(nextInstr+1);
				emit("j"+Stack[stackSize - 3 + 2]._map["op"], Stack[stackSize - 3 + 1]._map["place"], Stack[stackSize - 3 + 3]._map["place"], "_");
				emit("j","","","_");
			
return pair<unsigned int, string>(3,"logic_expr");

case 60 ://logic_expr->expr 
 				reduceHead["truelist"] = makelist(nextInstr);
				reduceHead["falselist"] = makelist(nextInstr+1);
				emit("j!=", Stack[stackSize - 1 + 1]._map["addr"], "0", "_");
				emit("j","","","_");
			
return pair<unsigned int, string>(1,"logic_expr");

case 61 ://logic_expr->true 
				reduceHead["truelist"] = makelist(nextInstr);
				emit("j","","","_");
			
return pair<unsigned int, string>(1,"logic_expr");

case 62 ://logic_expr->false 
				reduceHead["falselist"] = makelist(nextInstr);
				emit("j","","","_");
			
return pair<unsigned int, string>(1,"logic_expr");

case 63 ://M->
reduceHead["instr"] = "LABEL_" + gen(nextInstr);
labelMap.insert(make_pair("LABEL_" + gen(nextInstr), nextInstr));	//change

return pair<unsigned int, string>(0,"M");

case 64 ://N->
 reduceHead["instr"] = makelist(nextInstr);
      emit("j","","","_");
    
return pair<unsigned int, string>(0,"N");

case 65 ://BlockLeader->
      addLeader(nextInstr);
    
return pair<unsigned int, string>(0,"BlockLeader");

case 66 ://rel->< 
reduceHead["op"] = "<";

return pair<unsigned int, string>(1,"rel");

case 67 ://rel->> 
reduceHead["op"] = ">";

return pair<unsigned int, string>(1,"rel");

case 68 ://rel-><= 
reduceHead["op"] = "<=";

return pair<unsigned int, string>(1,"rel");

case 69 ://rel-><= 
reduceHead["op"] = ">=";

return pair<unsigned int, string>(1,"rel");

case 70 ://rel->== 
reduceHead["op"] = "==";

return pair<unsigned int, string>(1,"rel");

case 71 ://rel->!= 
reduceHead["op"] = "!=";

return pair<unsigned int, string>(1,"rel");

case 72 ://addr_id->$ expr 
		reduceHead["place"]=newtemp(Stack[stackSize - 2 + 2]._map["place"],true);
		emit("=",Stack[stackSize - 2 + 2]._map["place"],"",reduceHead["place"]);
		
return pair<unsigned int, string>(2,"addr_id");

case 73 ://addr_id->id [ expr ] 
 		reduceHead["place"]=newtemp(Stack[stackSize - 4 + 3]._map["place"]);
		emit("MUL",Stack[stackSize - 4 + 3]._map["place"],to_string(atoi(Stack[stackSize - 4 + 3]._map["width"].c_str())),reduceHead["place"]);
		p = lookupPlace(Stack[stackSize - 4 + 1]._map["lexeme"]);
		emit("ADD",p,reduceHead["place"],reduceHead["place"]);
		
return pair<unsigned int, string>(4,"addr_id");

default: return pair<unsigned int, string>(0,"");
}
}// end function
string getProduction(unsigned int index) {
switch(index) {
case 0 :return "S->program ";
case 1 :return "program->globalData stmts ";
case 2 :return "program->stmts ";
case 3 :return "globalData->globalStmts ";
case 4 :return "globalStmts->globalStmts globalStmt ";
case 5 :return "globalStmts->globalStmt ";
case 6 :return "globalStmt->static var_decl ; ";
case 7 :return "stmts->stmts M stmt ";
case 8 :return "stmts->stmt ";
case 9 :return "stmt->{ stmts } ";
case 10 :return "stmt->fun_define ";
case 11 :return "stmt->if_stmt ";
case 12 :return "stmt->while_stmt ";
case 13 :return "stmt->var_decl ; ";
case 14 :return "stmt->expr_stmt ; ";
case 15 :return "stmt->return expr ; ";
case 16 :return "stmt->return ; ";
case 17 :return "fun_define->fun_decl_head BlockLeader { stmts } ";
case 18 :return "fun_decl_head->type_spec id ( ) ";
case 19 :return "fun_decl_head->type_spec id ( param_list ) ";
case 20 :return "param_list->param_list , param ";
case 21 :return "param_list->param ";
case 22 :return "param->type_spec id ";
case 23 :return "param->type_spec id [ int_literal ] ";
case 24 :return "int_literal->num ";
case 25 :return "static_var_decl->static var_decl ";
case 26 :return "var_decl->type_spec id ";
case 27 :return "var_decl->type_spec id [ int_literal ] ";
case 28 :return "type_spec->int ";
case 29 :return "type_spec->void ";
case 30 :return "expr_stmt->id = expr ";
case 31 :return "expr_stmt->addr_id = expr ";
case 32 :return "expr->expr + expr ";
case 33 :return "expr->expr - expr ";
case 34 :return "expr->expr * expr ";
case 35 :return "expr->expr / expr ";
case 36 :return "expr->expr & expr ";
case 37 :return "expr->expr | expr ";
case 38 :return "expr->expr ^ expr ";
case 39 :return "expr->~ expr ";
case 40 :return "expr->- expr ";
case 41 :return "expr->++ id ";
case 42 :return "expr->expr << expr ";
case 43 :return "expr->expr >> expr ";
case 44 :return "expr->( expr ) ";
case 45 :return "expr->id ";
case 46 :return "expr->addr_id ";
case 47 :return "expr->id ( arg_list ) ";
case 48 :return "expr->num ";
case 49 :return "arg_list->arg_list , expr ";
case 50 :return "arg_list->expr ";
case 51 :return "arg_list->";
case 52 :return "if_stmt->if ( logic_expr ) M stmt ";
case 53 :return "if_stmt->if ( logic_expr ) M stmt N else M stmt ";
case 54 :return "while_stmt->while M ( logic_expr ) M stmt ";
case 55 :return "logic_expr->logic_expr && M logic_expr ";
case 56 :return "logic_expr->logic_expr || M logic_expr ";
case 57 :return "logic_expr->! logic_expr ";
case 58 :return "logic_expr->( logic_expr ) ";
case 59 :return "logic_expr->expr rel expr ";
case 60 :return "logic_expr->expr ";
case 61 :return "logic_expr->true ";
case 62 :return "logic_expr->false ";
case 63 :return "M->";
case 64 :return "N->";
case 65 :return "BlockLeader->";
case 66 :return "rel->< ";
case 67 :return "rel->> ";
case 68 :return "rel-><= ";
case 69 :return "rel-><= ";
case 70 :return "rel->== ";
case 71 :return "rel->!= ";
case 72 :return "addr_id->$ expr ";
case 73 :return "addr_id->id [ expr ] ";
default: return "";
}
}

