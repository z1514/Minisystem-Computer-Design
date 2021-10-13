#include<iostream>
#include<ctime>
#include"cLexl_READ.h"
#include"REtoNFA.h"
#include"NFAtoDFA.h"
#include"generate_code.h"
#include"SEULEX_structs.h"
using namespace std;

int main() {
	vector<Rules> rules;//用于存储识别规则
	map<string, string> head;//用于存储正则表达式
	vector<string> supdef;//存储辅助定义
	vector<string> functions;//用于存储子程序部分

	stack<NFA> nfa;//用于存储每条规则转化的nfa
	NFA final_nfa;
	DFA dfa, final_dfa;

	string filename = "lex.l";

	cLexl_read(filename, supdef, head, rules, functions);//读取
	
	re_standardize(rules, head);//规范化正则表达式 
	re_to_postfix(rules);//前缀表达式转后缀表达式

	nfa = postfix_to_nfa(rules);	//后缀表达式转换成NFA
	nfa_combination(nfa, final_nfa);//合并NFA

	nfa_to_dfa(final_nfa, dfa);//NFA转化为DFA
	dfa_mini(dfa, final_dfa);//DFA最小化

	string output_filename = "lex.cpp";
	generate_code(output_filename, supdef, final_dfa, rules, functions);	//输出代码到结果
	return 0;
}