#ifndef _TABLE_YACC_H
#define _TABLE_YACC_H
#include "StructDefine.h"
#include <vector>
#include <map>
void initTable(std::map<unsigned int, std::map<std::string, TableItem> >& _parseTable) {
std::map<std::string, TableItem> tran;
// state 0
tran.insert(std::make_pair("int", TableItem(1,1)));
_parseTable.insert(std::make_pair(0,tran));
tran.swap(std::map<std::string, TableItem>());


// state 1
tran.insert(std::make_pair("id", TableItem(1,2)));
_parseTable.insert(std::make_pair(1,tran));
tran.swap(std::map<std::string, TableItem>());


// state 2
tran.insert(std::make_pair("$", TableItem(5,0)));
_parseTable.insert(std::make_pair(2,tran));
tran.swap(std::map<std::string, TableItem>());


}
#endif //_TABLE_YACC_H
