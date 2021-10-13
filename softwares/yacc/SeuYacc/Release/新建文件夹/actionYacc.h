#ifndef _ACTION_YACC_H
#define _ACTION_YACC_H
#include "structDefine.h"
#include "supportFunction.h"
#include <string>
#include <stack>
#include <stdlib.h>
extern unsigned int offset;
std::string p;
extern std::deque<StackItem> stack;
extern std::stack<std::string> paramStack;
std::pair<unsigned int, std::string> performAction(unsigned int index, std::map<std::string, std::string>& reduceHead) {
size_t stackSize = stack.size() - 1;
switch(index) {
case 0 ://var_decl->int id 

return std::pair<unsigned int, std::string>(2,"var_decl");

default: return std::pair<unsigned int, std::string>(0,"");
}
}// end function
std::string getProduction(unsigned int index) {
switch(index) {
case 0 :return "var_decl->int id ";
default: return "";
}
}
#endif //_ACTION_YACC_H
