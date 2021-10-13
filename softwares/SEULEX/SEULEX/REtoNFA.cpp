#include"REtoNFA.h"
const string CODE("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^");

//开始规范化正则表达式
//处理引号
void handle_quote(string& pattern)
{
	//cout << "处理的pattern为" << pattern << endl;
	//处理表达式为"""的情况
	if (pattern == "\"\"\"")
	{
		pattern = "\"";
	}
	//移除pattern字符串中所有的引号，要用两个迭代器作为参数调用erase（）"void"
	//第一个迭代器由remove（）返回，删除指定元素，然后将该元素后面的元素移到前面void"
	//remove（）返回指向字符串的最后一个有效元素的后面位置 d后面的位置
	//第二个迭代器是字符串原始状态的结束迭代器。这两个迭代器指定范围的元素会被删除
	//也就是说remove删除第一个" erase删除第二个"
	else
	{
		//cout << remove(pattern.begin(), pattern.end(), '"') << endl;
		pattern.erase(remove(pattern.begin(), pattern.end(), '"'), pattern.end());
	}
}

//替换{X}，比如{letter}—》[a-zA-Z]
void replace_brace(string& pattern, map<string, string>& head)
{
	string name;//正则表达式名字
	string newPattern;//规范化后的表达式
	if (pattern.length() == 1)
	{
		return;
	}

	for (int i = 0; i < pattern.length(); i++)
	{
		if (pattern[i] == '{')
		{
			//提取表达式名字{number}
			//从第i+1个位置开始找}
			//}的位置是x，那么}前面的位置为x-1，则一共需要的元素个数为（x-1）-（i+1）+1=x-i-1
			int x = pattern.find_first_of('}', i + 1);//找到}位置
			name = pattern.substr(i + 1, x - i - 1);//存储正则表达式的名字
			//在辅助定义表中找到所需要的表达式
			auto find = head.find(name);//将根据找到的名字找到对应的head
			//构建规范化正则表达式
			newPattern += find->second;
			i = pattern.find_first_of('}', i + 1);//处理完一组{}，修改i的位置
		}
		else
		{
			//处理没有大括号的表达式
			newPattern += pattern[i];
		}
	}
	pattern = newPattern;
}

//替换[X]，比如[a-zA-Z]->（a|b|c|d...|Z）
void replace_square_brackets(string& pattern)
{
	string newPattern;//规范化后的表达式
	if (pattern.length() == 1)
	{
		return;
	}

	for (int i = 0; i < pattern.length(); i++)
	{
		//处理[a-zA-Z]
		if (pattern[i] == '[' && pattern[i + 1] == 'a')
		{
			//将表达式扩展成完整的
			newPattern += '(';
			for (int j = CODE.find_first_of('a'); j < CODE.find_first_of('Z'); j++)
			{//把a-Y添加
				newPattern += CODE[j];
				newPattern += '|';//添加一个加一个|
			}
			newPattern += "Z)";
			i = pattern.find_first_of(']', i + 1);//处理完一组[]
		}

		//处理[0-9]
		else if (pattern[i] == '[' && pattern[i + 1] == '0')
		{
			newPattern += '(';
			for (int j = CODE.find_first_of('0'); j < CODE.find_first_of('9'); j++)
			{//把0-8加入
				newPattern += CODE[j];
				newPattern += '|';
			}
			newPattern += "9)";
			i = pattern.find_first_of(']', i + 1);//处理完一组[]
		}

		else if (pattern[i] == '[' && pattern[i + 1] == '1')
		{
			newPattern += '(';
			for (int j = CODE.find_first_of('1'); j < CODE.find_first_of('9'); j++)
			{//把0-8加入
				newPattern += CODE[j];
				newPattern += '|';
			}
			newPattern += "9)";
			i = pattern.find_first_of(']', i + 1);//处理完一组[]
		}

		//处理[+-]
		else if (pattern[i] == '[' && pattern[i + 1] == '+')
		{
			newPattern += "(+|-)";
			i = pattern.find_first_of(']', i + 1);//处理完一组[]
		}
		else
		{
			newPattern += pattern[i];
		}
	}
	pattern = newPattern;
}

//替换？和+（0|1|2|..|9）+（.（0|1|2|..|9）+）？（E（+|-）？（0|1|2|..|9）+）？
void replace_question_add(string& pattern)
{
	string newPattern;
	vector<int> left;//存储左括号位置
	for (int i = 0; i < pattern.length(); i++)
	{
		newPattern += pattern[i];
		if (pattern[i] == '(')
		{
			//读到左括号，保存位置
			left.push_back(newPattern.length() - 1);
		}
		else if (pattern[i] == ')' && i + 1 < pattern.length() && pattern[i + 1] == '?')
		{
			//处理x? 问号操作符表示操作数出现0次或一次
			//替换形式为x? -> (@|x)
			//@表示epsilon
			//（.（0|1|2|..|9）+）？->（.（0|1|2|..|9）（0|1|2|..|9）*）?->（@|（.（0|1|2|..|9）（0|1|2|..|9）*））
			string temp;
			temp += "(@|";
			//将原来表达式中从最后一个左括号开始的表达式内容记录下来，包括左右括号
			temp += newPattern.substr(left.back());
			temp += ')';
			//将原来表达式内最后一个左括号开始的表达式全部删除
			newPattern.erase(left.back(), 100);
			//替换成新的表达式
			newPattern += temp;
			//弹出最后一个左括号位置
			left.pop_back();
			i = i + 1;
		}
		else if (pattern[i] == ')' && i + 1 < pattern.length() && pattern[i + 1] == '+')
		{
			//处理x+ 替换成xx*
			//（0|1|2|..|9）+ -> （0|1|2|..|9）（0|1|2|..|9）*
			string temp;
			//将表达式中从最后一个左括号开始的表达式内容记录下来，包括左右括号
			temp += newPattern.substr(left.back());
			temp += newPattern.substr(left.back());
			temp += '*';
			//将原来表达式内最后一个左括号开始的表达式全部删除
			newPattern.erase(left.back(), 100);
			//替换成新的表达式
			newPattern += temp;
			//弹出最后一个左括号位置
			left.pop_back();
			i = i + 1;
		}
	}
	pattern = newPattern;
	//(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*(@|(.(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*))(@|(E(@|(+|-))(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*))
}

//加#，如果void 则变成v#o#i#d,分割字符串，便于转换成NFA
void add_dot(string& pattern)
{
	string newPattern;
	for (int i = 0; i < pattern.length(); i++)
	{
		newPattern += pattern[i];
		if (i == pattern.length() - 1)
			continue;//最后一个字符，不加
		else if (pattern[i] == '(')
			continue;//当前字符为（，不加
		else if (i + 1 < pattern.length() && pattern[i] == '|' && pattern[i + 1] == '|')
			newPattern += '#';//||情况需要加
		else if (i + 1 < pattern.length() && pattern[i] == '|' && pattern[i + 1] != '|')
			continue;//字符为|，而不是||,不加
		else if (i + 1 < pattern.length() && pattern[i] == '/' && pattern[i + 1] == '*')
			newPattern += '#';// /*情况需要加
		else if (i + 1 < pattern.length() && pattern[i] == '*' && pattern[i + 1] == '*')
			newPattern += '#';// /*情况需要加
		else if (i + 1 < pattern.length() && (pattern[i + 1] == '|' || pattern[i + 1] == ')' || pattern[i + 1] == '*'))
			continue; //其余不加情况，下一个字符为操作符或右括号1|2|3  ))  )*
		else
			newPattern += '#';//加
	}

	pattern = newPattern;
}

//处理head的value 处理rules
void re_standardize(vector<Rules>& Rules, map<string, string>& head)
{
	//先处理辅助定义map里的右部
	for (auto& map : head)
	{
		//替换大括号
		replace_brace(map.second, head);
		//替换中括号
		replace_square_brackets(map.second);
		//处理问号和加号
		replace_question_add(map.second);
	}

	//再处理表达式vector里的左部
	for (auto& rule : Rules)
	{
		//处理引号
		handle_quote(rule.pattern);
		//替换大括号，利用{}内的部分去定义map里找，此时该map里的内容已被替换
		replace_brace(rule.pattern, head);
		//加#
		add_dot(rule.pattern);
	}
}
//规范化正则表达式结束

//开始将规范化正则表达式转后缀表达式 得到后缀表达式规则
void re_to_postfix(vector<Rules>& rules)
{
	for (auto& rule : rules)
	{
		string pattern = rule.pattern;//对pattern进行操作
		string temp;//用于临时装载正确pattern
		queue<char> result;//最终正确的队列
		stack<char> s;//操作符栈
		cout << "当前处理的pattern为" << pattern << endl;
		if (pattern.length() == 1)
		{
			cout << "单个字符。不做处理" << endl;
			continue;
		}
		for (int i = 0; i < pattern.length(); i++)
		{
			char current = pattern[i];//取当前字符
			cout << "当前处理字符为" << current << endl;
			//如果为左括号，将其放入栈中
			if (current == '(')
			{
				cout << "遇到左括号压栈" << endl;
				s.push(current);
			}
			
			//如果为右括号，则将栈顶元素弹出，将弹出的操作符输出直到左括号为止
			//注意，左括号只弹出不输出
			else if (current == ')')
			{
				cout << "遇到右括号" << endl;
				while (!s.empty() && s.top() != '(')
				{
					cout << "栈顶元素为" << s.top() << " 弹出并加入队列" << endl;
					result.push(s.top());
					s.pop();
					cout << "弹出后栈顶元素为" << s.top() << endl;
				}
				s.pop();//弹出左括号
				//cout << "弹出后栈顶元素为" << s.top() << endl;
			}
			else if (current == '|')//当前字符为|
			{
				//cout << "遇到|" << endl;
				//如果是|#|情况，作为操作符压栈，弹出后为||#
				if (pattern[i + 1] == '#' && pattern[i + 2] == '|')
				{
					cout << "遇到|#|" << endl;
					s.push('#');
					s.push('|');
					s.push('|');
					i = i + 2;
					continue;
				}

				//如果遇到任何其他的操作符，从栈中弹出元素直到遇到发现更低优先级的元素(或者栈为空)为止
				//弹出完这些元素后，才将遇到的操作符压入到栈中
				//优先级顺序：*>#>|
				while (!s.empty() && (s.top() == '#' || s.top() == '|' || s.top() == '*'))
				{
					cout << "栈顶元素为" << s.top() << " 弹出并加入队列" << endl;
					result.push(s.top());
					s.pop();
					//cout << "弹出后栈顶元素为" << s.top() << endl;
				}
				cout << "|压栈" << endl;
				s.push(current);
			}
			else if (current == '#')
			{
				//cout << "遇到#" << endl;
				//栈顶操作符优先级不低于当前操作符优先级，从栈中弹出这些元素，再将当前操作符压栈。*>#>|
				while (!s.empty() && (s.top() == '#' || s.top() == '*'))
				{
					cout << "栈顶元素为" << s.top() << " 弹出并加入队列" << endl;
					result.push(s.top());
					s.pop();
					//cout << "弹出后栈顶元素为" << s.top() << endl;
				}
				cout << "#压栈" << endl;
				s.push(current);
			}
			else
			{
				cout << "遇到操作符" << current << " 直接加入队列" << endl;
				//如果遇到操作数，直接输出
				result.push(current);
			}

			cout << "-----------------------------------" << endl;
		}

		//栈中还有操作符，直接出栈
		while (!s.empty())
		{
			cout << "栈中还有操作符，栈顶元素为" << s.top() << " 弹出并加入队列" << endl;
			result.push(s.top());
			s.pop();
		}
		while (!result.empty())
		{//将队列元素加入到temp中
			temp += result.front();
			result.pop();
		}
		cout << "结果为" << temp << endl << "----------------------------------------------" << endl << endl;
		rule.pattern = temp;
	}
}

//将后缀表达式转换为nfa
int num = 0;
stack<NFA> postfix_to_nfa(vector<Rules>& postfixRules)
{//后缀表达式规则 最终要得到的NFA
	stack<NFA> NFAstack;//存储NFA的栈
	for (int i = 0; i < postfixRules.size(); i++)
	{
		string pattern = postfixRules[i].pattern;
		cout << "当前处理的pattern为" << pattern << endl;
		int tempActionInt = -1;
		for (int j = 0; j < pattern.length(); j++)
		{
			NFA up, down;
			NFAstate start, end;
			char current = pattern[j];
			cout << "当前处理的操作符为" << current << endl;
			if (current == '|' && j != 0 && j != 1)
			{
				cout << "遇到|，进行并联连接" << endl;
				//是或|操作，但不属于||'这个表达式
				//取出最上面的NFA进行操作
				up = NFAstack.top();
				NFAstack.pop();
				down = NFAstack.top();
				NFAstack.pop();
				//新建两个状态
				start.number = num;//状态标号
				++num;
				end.number = num;
				++num;//状态编号增加
				//将down的终态和up的终态都连接到end
				up.statesMap.find(up.endStatesMap.begin()->first//得到终态标号
				)->second//得到终态
					//在up的标号对应状态里，根据终态标号找到终态，得到该状态的内部状态
					//将压在下面的（也就是更前面的）NFA用@与end进行连接
					.exEdgesMultiMap.insert(pair<char, int>('@', end.number));//连接到end状态
				down.statesMap.find(down.endStatesMap.begin()->first)->second
					.exEdgesMultiMap.insert(pair<char, int>('@', end.number));//同上
				//将start连接到down和up的初态
				start.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				start.exEdgesMultiMap.insert(pair<char, int>('@', down.startState));
				//将初态和终态的stateMap存入down
				down.statesMap.insert(pair<int, NFAstate>(start.number, start));
				down.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//将up的stateMap拷贝到down中
				down.statesMap.insert(up.statesMap.begin(), up.statesMap.end());//全部
				//修改down的初态
				down.startState = start.number;
				//修改down的终态
				down.endStatesMap.clear();
				down.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//Start->up->end start->down->end
				NFAstack.push(down);
			}
			else if (j - 1 > 0 && j + 1 < pattern.length() && current == '*' && pattern.length() != 1 && pattern[j - 1] != '/' && pattern[j + 1] != '=')//闭包操作
			{
				//取出最上面的NFA进行操作
				up = NFAstack.top();
				NFAstack.pop();
				//新建两个状态
				start.number = num;
				++num;
				end.number = num;
				++num;
				//将start和up初态连接
				start.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				//将start和end连接
				start.exEdgesMultiMap.insert(pair<char, int>('@', end.number));
				//将up的终态和初态连接
				up.statesMap.find(up.endStatesMap.begin()->first)->second.//得到终态
					exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				//up终态和end相连
				up.statesMap.find(up.endStatesMap.begin()->first)->second.//得到终态
					exEdgesMultiMap.insert(pair<char, int>('@', end.number));
				//更改初态
				up.startState = start.number;
				//连接关系定义好后存入statesMap
				up.statesMap.insert(pair<int, NFAstate>(start.number, start));
				up.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//更改终态
				up.endStatesMap.clear();
				up.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//start->up->end->start  start->end
				NFAstack.push(up);
			}
			else if (current == '#')
			{
				cout << "遇到#符号，进行两个nfa的串联组合" << endl;
				//例如：0-v-1 2-o-3 遇到#将两个NFA相连
				//则up中为2-0-3 down中为0-v-1 
				//取出0-v-1的终态，将他终态的下一个状态设置为2-o-3的终态，也就是0-v-1-@-2-o-3，再将0-v-1的终态删除设置为2-o-3的终态
				//字符分割符，取出栈顶两个NFA将两个NFA相连
				//取出栈顶的两个NFA
				up = NFAstack.top();
				NFAstack.pop();
				down = NFAstack.top();
				NFAstack.pop();
				//取出down的终态
				down.statesMap.find(down.endStatesMap.begin()->first)->second //得到终态
					//将压在下面的（也就是更前面的）NFA用@与后面的进行连接
					.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));//与up的初态相连
				//更改终态
				down.endStatesMap.clear();
				down.endStatesMap = up.endStatesMap;
				//把up的状态map拷贝到down中，
				down.statesMap.insert(up.statesMap.begin(), up.statesMap.end());
				//start->down->up->end
				NFAstack.push(down);
			}
			else
			{
				cout << "遇到字符，直接构造一个NFA" << endl;
				//遇到字符，构造一个NFA，压栈
				NFA push; //用于压栈的NFA
				//新建一个起始状态
				start.number = num;
				//更改初态
				push.startState = start.number;
				++num;
				//新建一个终止状态
				end.number = num;
				++num;
				//将起始状态和终止状态连接
				start.exEdgesMultiMap.insert(pair<char, int>(current, end.number));//key为边上的字符，value为下一个状态的序号
				//连接关系定义好后存入map
				push.statesMap.insert(pair<int, NFAstate>(start.number, start));
				push.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//标识当前终态，因此先传入空vector。
				push.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//压栈
				NFAstack.push(push);
			}
		}
		//将action赋给栈顶的NFA的终态
		NFAstack.top().endStatesMap.begin()->second = i;//终态存储动作，根据存储的rules的序号，在rules数组中寻找相应的动作
	}
	return NFAstack;
}
//将后缀表达式转化为NFA结束

//将NFA组合成一个大的NFA
void nfa_combination(stack<NFA> NFAstack, NFA& finalNFA)
{
	//cout << "\n" << NFAstack.size() << endl;
	//得到NFA栈，开始合并
	finalNFA = NFAstack.top();
	NFA down;
	NFAstack.pop();
	while (!NFAstack.empty())
	{
		NFAstate start;
		//依次，把栈顶NFA与大NFA合并
		down = NFAstack.top();
		NFAstack.pop();
		//新建一个start状态
		start.number = num;
		num++;
		//将start连接到finalNFA和dowNFA的初态
		start.exEdgesMultiMap.insert(pair<char, int>('@', finalNFA.startState));
		start.exEdgesMultiMap.insert(pair<char, int>('@', down.startState));
		//修改finalNFA的起始状态
		finalNFA.startState = start.number;
		finalNFA.statesMap.insert(pair<int, NFAstate>(start.number, start));
		//添加finalNFA的终止状态
		finalNFA.endStatesMap.insert(down.endStatesMap.begin(), down.endStatesMap.end());
		//把down的状态map拷贝到finalNFA中
		finalNFA.statesMap.insert(down.statesMap.begin(), down.statesMap.end());
	}
}