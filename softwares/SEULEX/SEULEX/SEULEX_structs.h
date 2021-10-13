#pragma once
#include<vector>
#include<string>
#include<map>
#include<unordered_map>
#include<unordered_set>
#include<set>
using namespace std;

//正则表达式和对应动作的结构体
typedef struct {
	string pattern;//RE
	vector<string> actions;//对应动作（语句）
}Rules;

//存储NFA状态的结构体
typedef struct {
	int number = 0;//状态标号
	unordered_multimap<char, int> exEdgesMultiMap;//发出边，键为边上的值，值为下一个状态标号，一对多
}NFAstate;

//存储NFA的结构体
typedef struct {
	int startState = 0;//开始状态标号
	map<int, int> endStatesMap;//存储终态和对应的动作
	unordered_map<int, NFAstate> statesMap;//存储标号和对应状态，键存储状态标号，值存储对应的NFA状态结构体
}NFA;

//存储DFA状态的结构体
typedef struct {
	int number = 0;//状态标号
	unordered_set<int> identitySet;//区分不同状态用的DFA状态集合，状态标号，即通过某个符号可以到达的NFA状态子集
	unordered_map<char, int> exEdgesMap;//发出边，键为边上的值，值为下一个状态标号
}DFAstate;

//存储DFA的结构体
typedef struct {
	unordered_map<int, int> endStatesMap;//终态序号和对应的动作
	int startState = 0;//开始状态标号
	vector<DFAstate> statesVec;//存储标号对应状态
}DFA;