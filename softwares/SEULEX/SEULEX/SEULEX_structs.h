#pragma once
#include<vector>
#include<string>
#include<map>
#include<unordered_map>
#include<unordered_set>
#include<set>
using namespace std;

//������ʽ�Ͷ�Ӧ�����Ľṹ��
typedef struct {
	string pattern;//RE
	vector<string> actions;//��Ӧ��������䣩
}Rules;

//�洢NFA״̬�Ľṹ��
typedef struct {
	int number = 0;//״̬���
	unordered_multimap<char, int> exEdgesMultiMap;//�����ߣ���Ϊ���ϵ�ֵ��ֵΪ��һ��״̬��ţ�һ�Զ�
}NFAstate;

//�洢NFA�Ľṹ��
typedef struct {
	int startState = 0;//��ʼ״̬���
	map<int, int> endStatesMap;//�洢��̬�Ͷ�Ӧ�Ķ���
	unordered_map<int, NFAstate> statesMap;//�洢��źͶ�Ӧ״̬�����洢״̬��ţ�ֵ�洢��Ӧ��NFA״̬�ṹ��
}NFA;

//�洢DFA״̬�Ľṹ��
typedef struct {
	int number = 0;//״̬���
	unordered_set<int> identitySet;//���ֲ�ͬ״̬�õ�DFA״̬���ϣ�״̬��ţ���ͨ��ĳ�����ſ��Ե����NFA״̬�Ӽ�
	unordered_map<char, int> exEdgesMap;//�����ߣ���Ϊ���ϵ�ֵ��ֵΪ��һ��״̬���
}DFAstate;

//�洢DFA�Ľṹ��
typedef struct {
	unordered_map<int, int> endStatesMap;//��̬��źͶ�Ӧ�Ķ���
	int startState = 0;//��ʼ״̬���
	vector<DFAstate> statesVec;//�洢��Ŷ�Ӧ״̬
}DFA;