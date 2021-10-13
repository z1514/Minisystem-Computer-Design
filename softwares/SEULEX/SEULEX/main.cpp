#include<iostream>
#include<ctime>
#include"cLexl_READ.h"
#include"REtoNFA.h"
#include"NFAtoDFA.h"
#include"generate_code.h"
#include"SEULEX_structs.h"
using namespace std;

int main() {
	vector<Rules> rules;//���ڴ洢ʶ�����
	map<string, string> head;//���ڴ洢������ʽ
	vector<string> supdef;//�洢��������
	vector<string> functions;//���ڴ洢�ӳ��򲿷�

	stack<NFA> nfa;//���ڴ洢ÿ������ת����nfa
	NFA final_nfa;
	DFA dfa, final_dfa;

	string filename = "lex.l";

	cLexl_read(filename, supdef, head, rules, functions);//��ȡ
	
	re_standardize(rules, head);//�淶��������ʽ 
	re_to_postfix(rules);//ǰ׺���ʽת��׺���ʽ

	nfa = postfix_to_nfa(rules);	//��׺���ʽת����NFA
	nfa_combination(nfa, final_nfa);//�ϲ�NFA

	nfa_to_dfa(final_nfa, dfa);//NFAת��ΪDFA
	dfa_mini(dfa, final_dfa);//DFA��С��

	string output_filename = "lex.cpp";
	generate_code(output_filename, supdef, final_dfa, rules, functions);	//������뵽���
	return 0;
}