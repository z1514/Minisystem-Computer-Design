#include"REtoNFA.h"
const string CODE("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^");

//��ʼ�淶��������ʽ
//��������
void handle_quote(string& pattern)
{
	//cout << "�����patternΪ" << pattern << endl;
	//������ʽΪ"""�����
	if (pattern == "\"\"\"")
	{
		pattern = "\"";
	}
	//�Ƴ�pattern�ַ��������е����ţ�Ҫ��������������Ϊ��������erase����"void"
	//��һ����������remove�������أ�ɾ��ָ��Ԫ�أ�Ȼ�󽫸�Ԫ�غ����Ԫ���Ƶ�ǰ��void"
	//remove��������ָ���ַ��������һ����ЧԪ�صĺ���λ�� d�����λ��
	//�ڶ������������ַ���ԭʼ״̬�Ľ�����������������������ָ����Χ��Ԫ�ػᱻɾ��
	//Ҳ����˵removeɾ����һ��" eraseɾ���ڶ���"
	else
	{
		//cout << remove(pattern.begin(), pattern.end(), '"') << endl;
		pattern.erase(remove(pattern.begin(), pattern.end(), '"'), pattern.end());
	}
}

//�滻{X}������{letter}����[a-zA-Z]
void replace_brace(string& pattern, map<string, string>& head)
{
	string name;//������ʽ����
	string newPattern;//�淶����ı��ʽ
	if (pattern.length() == 1)
	{
		return;
	}

	for (int i = 0; i < pattern.length(); i++)
	{
		if (pattern[i] == '{')
		{
			//��ȡ���ʽ����{number}
			//�ӵ�i+1��λ�ÿ�ʼ��}
			//}��λ����x����ô}ǰ���λ��Ϊx-1����һ����Ҫ��Ԫ�ظ���Ϊ��x-1��-��i+1��+1=x-i-1
			int x = pattern.find_first_of('}', i + 1);//�ҵ�}λ��
			name = pattern.substr(i + 1, x - i - 1);//�洢������ʽ������
			//�ڸ�����������ҵ�����Ҫ�ı��ʽ
			auto find = head.find(name);//�������ҵ��������ҵ���Ӧ��head
			//�����淶��������ʽ
			newPattern += find->second;
			i = pattern.find_first_of('}', i + 1);//������һ��{}���޸�i��λ��
		}
		else
		{
			//����û�д����ŵı��ʽ
			newPattern += pattern[i];
		}
	}
	pattern = newPattern;
}

//�滻[X]������[a-zA-Z]->��a|b|c|d...|Z��
void replace_square_brackets(string& pattern)
{
	string newPattern;//�淶����ı��ʽ
	if (pattern.length() == 1)
	{
		return;
	}

	for (int i = 0; i < pattern.length(); i++)
	{
		//����[a-zA-Z]
		if (pattern[i] == '[' && pattern[i + 1] == 'a')
		{
			//�����ʽ��չ��������
			newPattern += '(';
			for (int j = CODE.find_first_of('a'); j < CODE.find_first_of('Z'); j++)
			{//��a-Y���
				newPattern += CODE[j];
				newPattern += '|';//���һ����һ��|
			}
			newPattern += "Z)";
			i = pattern.find_first_of(']', i + 1);//������һ��[]
		}

		//����[0-9]
		else if (pattern[i] == '[' && pattern[i + 1] == '0')
		{
			newPattern += '(';
			for (int j = CODE.find_first_of('0'); j < CODE.find_first_of('9'); j++)
			{//��0-8����
				newPattern += CODE[j];
				newPattern += '|';
			}
			newPattern += "9)";
			i = pattern.find_first_of(']', i + 1);//������һ��[]
		}

		else if (pattern[i] == '[' && pattern[i + 1] == '1')
		{
			newPattern += '(';
			for (int j = CODE.find_first_of('1'); j < CODE.find_first_of('9'); j++)
			{//��0-8����
				newPattern += CODE[j];
				newPattern += '|';
			}
			newPattern += "9)";
			i = pattern.find_first_of(']', i + 1);//������һ��[]
		}

		//����[+-]
		else if (pattern[i] == '[' && pattern[i + 1] == '+')
		{
			newPattern += "(+|-)";
			i = pattern.find_first_of(']', i + 1);//������һ��[]
		}
		else
		{
			newPattern += pattern[i];
		}
	}
	pattern = newPattern;
}

//�滻����+��0|1|2|..|9��+��.��0|1|2|..|9��+������E��+|-������0|1|2|..|9��+����
void replace_question_add(string& pattern)
{
	string newPattern;
	vector<int> left;//�洢������λ��
	for (int i = 0; i < pattern.length(); i++)
	{
		newPattern += pattern[i];
		if (pattern[i] == '(')
		{
			//���������ţ�����λ��
			left.push_back(newPattern.length() - 1);
		}
		else if (pattern[i] == ')' && i + 1 < pattern.length() && pattern[i + 1] == '?')
		{
			//����x? �ʺŲ�������ʾ����������0�λ�һ��
			//�滻��ʽΪx? -> (@|x)
			//@��ʾepsilon
			//��.��0|1|2|..|9��+����->��.��0|1|2|..|9����0|1|2|..|9��*��?->��@|��.��0|1|2|..|9����0|1|2|..|9��*����
			string temp;
			temp += "(@|";
			//��ԭ�����ʽ�д����һ�������ſ�ʼ�ı��ʽ���ݼ�¼������������������
			temp += newPattern.substr(left.back());
			temp += ')';
			//��ԭ�����ʽ�����һ�������ſ�ʼ�ı��ʽȫ��ɾ��
			newPattern.erase(left.back(), 100);
			//�滻���µı��ʽ
			newPattern += temp;
			//�������һ��������λ��
			left.pop_back();
			i = i + 1;
		}
		else if (pattern[i] == ')' && i + 1 < pattern.length() && pattern[i + 1] == '+')
		{
			//����x+ �滻��xx*
			//��0|1|2|..|9��+ -> ��0|1|2|..|9����0|1|2|..|9��*
			string temp;
			//�����ʽ�д����һ�������ſ�ʼ�ı��ʽ���ݼ�¼������������������
			temp += newPattern.substr(left.back());
			temp += newPattern.substr(left.back());
			temp += '*';
			//��ԭ�����ʽ�����һ�������ſ�ʼ�ı��ʽȫ��ɾ��
			newPattern.erase(left.back(), 100);
			//�滻���µı��ʽ
			newPattern += temp;
			//�������һ��������λ��
			left.pop_back();
			i = i + 1;
		}
	}
	pattern = newPattern;
	//(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*(@|(.(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*))(@|(E(@|(+|-))(0|1|2|3|4|5|6|7|8|9)(0|1|2|3|4|5|6|7|8|9)*))
}

//��#�����void ����v#o#i#d,�ָ��ַ���������ת����NFA
void add_dot(string& pattern)
{
	string newPattern;
	for (int i = 0; i < pattern.length(); i++)
	{
		newPattern += pattern[i];
		if (i == pattern.length() - 1)
			continue;//���һ���ַ�������
		else if (pattern[i] == '(')
			continue;//��ǰ�ַ�Ϊ��������
		else if (i + 1 < pattern.length() && pattern[i] == '|' && pattern[i + 1] == '|')
			newPattern += '#';//||�����Ҫ��
		else if (i + 1 < pattern.length() && pattern[i] == '|' && pattern[i + 1] != '|')
			continue;//�ַ�Ϊ|��������||,����
		else if (i + 1 < pattern.length() && pattern[i] == '/' && pattern[i + 1] == '*')
			newPattern += '#';// /*�����Ҫ��
		else if (i + 1 < pattern.length() && pattern[i] == '*' && pattern[i + 1] == '*')
			newPattern += '#';// /*�����Ҫ��
		else if (i + 1 < pattern.length() && (pattern[i + 1] == '|' || pattern[i + 1] == ')' || pattern[i + 1] == '*'))
			continue; //���಻���������һ���ַ�Ϊ��������������1|2|3  ))  )*
		else
			newPattern += '#';//��
	}

	pattern = newPattern;
}

//����head��value ����rules
void re_standardize(vector<Rules>& Rules, map<string, string>& head)
{
	//�ȴ���������map����Ҳ�
	for (auto& map : head)
	{
		//�滻������
		replace_brace(map.second, head);
		//�滻������
		replace_square_brackets(map.second);
		//�����ʺźͼӺ�
		replace_question_add(map.second);
	}

	//�ٴ�����ʽvector�����
	for (auto& rule : Rules)
	{
		//��������
		handle_quote(rule.pattern);
		//�滻�����ţ�����{}�ڵĲ���ȥ����map���ң���ʱ��map��������ѱ��滻
		replace_brace(rule.pattern, head);
		//��#
		add_dot(rule.pattern);
	}
}
//�淶��������ʽ����

//��ʼ���淶��������ʽת��׺���ʽ �õ���׺���ʽ����
void re_to_postfix(vector<Rules>& rules)
{
	for (auto& rule : rules)
	{
		string pattern = rule.pattern;//��pattern���в���
		string temp;//������ʱװ����ȷpattern
		queue<char> result;//������ȷ�Ķ���
		stack<char> s;//������ջ
		cout << "��ǰ�����patternΪ" << pattern << endl;
		if (pattern.length() == 1)
		{
			cout << "�����ַ�����������" << endl;
			continue;
		}
		for (int i = 0; i < pattern.length(); i++)
		{
			char current = pattern[i];//ȡ��ǰ�ַ�
			cout << "��ǰ�����ַ�Ϊ" << current << endl;
			//���Ϊ�����ţ��������ջ��
			if (current == '(')
			{
				cout << "����������ѹջ" << endl;
				s.push(current);
			}
			
			//���Ϊ�����ţ���ջ��Ԫ�ص������������Ĳ��������ֱ��������Ϊֹ
			//ע�⣬������ֻ���������
			else if (current == ')')
			{
				cout << "����������" << endl;
				while (!s.empty() && s.top() != '(')
				{
					cout << "ջ��Ԫ��Ϊ" << s.top() << " �������������" << endl;
					result.push(s.top());
					s.pop();
					cout << "������ջ��Ԫ��Ϊ" << s.top() << endl;
				}
				s.pop();//����������
				//cout << "������ջ��Ԫ��Ϊ" << s.top() << endl;
			}
			else if (current == '|')//��ǰ�ַ�Ϊ|
			{
				//cout << "����|" << endl;
				//�����|#|�������Ϊ������ѹջ��������Ϊ||#
				if (pattern[i + 1] == '#' && pattern[i + 2] == '|')
				{
					cout << "����|#|" << endl;
					s.push('#');
					s.push('|');
					s.push('|');
					i = i + 2;
					continue;
				}

				//��������κ������Ĳ���������ջ�е���Ԫ��ֱ���������ָ������ȼ���Ԫ��(����ջΪ��)Ϊֹ
				//��������ЩԪ�غ󣬲Ž������Ĳ�����ѹ�뵽ջ��
				//���ȼ�˳��*>#>|
				while (!s.empty() && (s.top() == '#' || s.top() == '|' || s.top() == '*'))
				{
					cout << "ջ��Ԫ��Ϊ" << s.top() << " �������������" << endl;
					result.push(s.top());
					s.pop();
					//cout << "������ջ��Ԫ��Ϊ" << s.top() << endl;
				}
				cout << "|ѹջ" << endl;
				s.push(current);
			}
			else if (current == '#')
			{
				//cout << "����#" << endl;
				//ջ�����������ȼ������ڵ�ǰ���������ȼ�����ջ�е�����ЩԪ�أ��ٽ���ǰ������ѹջ��*>#>|
				while (!s.empty() && (s.top() == '#' || s.top() == '*'))
				{
					cout << "ջ��Ԫ��Ϊ" << s.top() << " �������������" << endl;
					result.push(s.top());
					s.pop();
					//cout << "������ջ��Ԫ��Ϊ" << s.top() << endl;
				}
				cout << "#ѹջ" << endl;
				s.push(current);
			}
			else
			{
				cout << "����������" << current << " ֱ�Ӽ������" << endl;
				//���������������ֱ�����
				result.push(current);
			}

			cout << "-----------------------------------" << endl;
		}

		//ջ�л��в�������ֱ�ӳ�ջ
		while (!s.empty())
		{
			cout << "ջ�л��в�������ջ��Ԫ��Ϊ" << s.top() << " �������������" << endl;
			result.push(s.top());
			s.pop();
		}
		while (!result.empty())
		{//������Ԫ�ؼ��뵽temp��
			temp += result.front();
			result.pop();
		}
		cout << "���Ϊ" << temp << endl << "----------------------------------------------" << endl << endl;
		rule.pattern = temp;
	}
}

//����׺���ʽת��Ϊnfa
int num = 0;
stack<NFA> postfix_to_nfa(vector<Rules>& postfixRules)
{//��׺���ʽ���� ����Ҫ�õ���NFA
	stack<NFA> NFAstack;//�洢NFA��ջ
	for (int i = 0; i < postfixRules.size(); i++)
	{
		string pattern = postfixRules[i].pattern;
		cout << "��ǰ�����patternΪ" << pattern << endl;
		int tempActionInt = -1;
		for (int j = 0; j < pattern.length(); j++)
		{
			NFA up, down;
			NFAstate start, end;
			char current = pattern[j];
			cout << "��ǰ����Ĳ�����Ϊ" << current << endl;
			if (current == '|' && j != 0 && j != 1)
			{
				cout << "����|�����в�������" << endl;
				//�ǻ�|��������������||'������ʽ
				//ȡ���������NFA���в���
				up = NFAstack.top();
				NFAstack.pop();
				down = NFAstack.top();
				NFAstack.pop();
				//�½�����״̬
				start.number = num;//״̬���
				++num;
				end.number = num;
				++num;//״̬�������
				//��down����̬��up����̬�����ӵ�end
				up.statesMap.find(up.endStatesMap.begin()->first//�õ���̬���
				)->second//�õ���̬
					//��up�ı�Ŷ�Ӧ״̬�������̬����ҵ���̬���õ���״̬���ڲ�״̬
					//��ѹ������ģ�Ҳ���Ǹ�ǰ��ģ�NFA��@��end��������
					.exEdgesMultiMap.insert(pair<char, int>('@', end.number));//���ӵ�end״̬
				down.statesMap.find(down.endStatesMap.begin()->first)->second
					.exEdgesMultiMap.insert(pair<char, int>('@', end.number));//ͬ��
				//��start���ӵ�down��up�ĳ�̬
				start.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				start.exEdgesMultiMap.insert(pair<char, int>('@', down.startState));
				//����̬����̬��stateMap����down
				down.statesMap.insert(pair<int, NFAstate>(start.number, start));
				down.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//��up��stateMap������down��
				down.statesMap.insert(up.statesMap.begin(), up.statesMap.end());//ȫ��
				//�޸�down�ĳ�̬
				down.startState = start.number;
				//�޸�down����̬
				down.endStatesMap.clear();
				down.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//Start->up->end start->down->end
				NFAstack.push(down);
			}
			else if (j - 1 > 0 && j + 1 < pattern.length() && current == '*' && pattern.length() != 1 && pattern[j - 1] != '/' && pattern[j + 1] != '=')//�հ�����
			{
				//ȡ���������NFA���в���
				up = NFAstack.top();
				NFAstack.pop();
				//�½�����״̬
				start.number = num;
				++num;
				end.number = num;
				++num;
				//��start��up��̬����
				start.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				//��start��end����
				start.exEdgesMultiMap.insert(pair<char, int>('@', end.number));
				//��up����̬�ͳ�̬����
				up.statesMap.find(up.endStatesMap.begin()->first)->second.//�õ���̬
					exEdgesMultiMap.insert(pair<char, int>('@', up.startState));
				//up��̬��end����
				up.statesMap.find(up.endStatesMap.begin()->first)->second.//�õ���̬
					exEdgesMultiMap.insert(pair<char, int>('@', end.number));
				//���ĳ�̬
				up.startState = start.number;
				//���ӹ�ϵ����ú����statesMap
				up.statesMap.insert(pair<int, NFAstate>(start.number, start));
				up.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//������̬
				up.endStatesMap.clear();
				up.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//start->up->end->start  start->end
				NFAstack.push(up);
			}
			else if (current == '#')
			{
				cout << "����#���ţ���������nfa�Ĵ������" << endl;
				//���磺0-v-1 2-o-3 ����#������NFA����
				//��up��Ϊ2-0-3 down��Ϊ0-v-1 
				//ȡ��0-v-1����̬��������̬����һ��״̬����Ϊ2-o-3����̬��Ҳ����0-v-1-@-2-o-3���ٽ�0-v-1����̬ɾ������Ϊ2-o-3����̬
				//�ַ��ָ����ȡ��ջ������NFA������NFA����
				//ȡ��ջ��������NFA
				up = NFAstack.top();
				NFAstack.pop();
				down = NFAstack.top();
				NFAstack.pop();
				//ȡ��down����̬
				down.statesMap.find(down.endStatesMap.begin()->first)->second //�õ���̬
					//��ѹ������ģ�Ҳ���Ǹ�ǰ��ģ�NFA��@�����Ľ�������
					.exEdgesMultiMap.insert(pair<char, int>('@', up.startState));//��up�ĳ�̬����
				//������̬
				down.endStatesMap.clear();
				down.endStatesMap = up.endStatesMap;
				//��up��״̬map������down�У�
				down.statesMap.insert(up.statesMap.begin(), up.statesMap.end());
				//start->down->up->end
				NFAstack.push(down);
			}
			else
			{
				cout << "�����ַ���ֱ�ӹ���һ��NFA" << endl;
				//�����ַ�������һ��NFA��ѹջ
				NFA push; //����ѹջ��NFA
				//�½�һ����ʼ״̬
				start.number = num;
				//���ĳ�̬
				push.startState = start.number;
				++num;
				//�½�һ����ֹ״̬
				end.number = num;
				++num;
				//����ʼ״̬����ֹ״̬����
				start.exEdgesMultiMap.insert(pair<char, int>(current, end.number));//keyΪ���ϵ��ַ���valueΪ��һ��״̬�����
				//���ӹ�ϵ����ú����map
				push.statesMap.insert(pair<int, NFAstate>(start.number, start));
				push.statesMap.insert(pair<int, NFAstate>(end.number, end));
				//��ʶ��ǰ��̬������ȴ����vector��
				push.endStatesMap.insert(pair<int, int>(end.number, tempActionInt));
				//ѹջ
				NFAstack.push(push);
			}
		}
		//��action����ջ����NFA����̬
		NFAstack.top().endStatesMap.begin()->second = i;//��̬�洢���������ݴ洢��rules����ţ���rules������Ѱ����Ӧ�Ķ���
	}
	return NFAstack;
}
//����׺���ʽת��ΪNFA����

//��NFA��ϳ�һ�����NFA
void nfa_combination(stack<NFA> NFAstack, NFA& finalNFA)
{
	//cout << "\n" << NFAstack.size() << endl;
	//�õ�NFAջ����ʼ�ϲ�
	finalNFA = NFAstack.top();
	NFA down;
	NFAstack.pop();
	while (!NFAstack.empty())
	{
		NFAstate start;
		//���Σ���ջ��NFA���NFA�ϲ�
		down = NFAstack.top();
		NFAstack.pop();
		//�½�һ��start״̬
		start.number = num;
		num++;
		//��start���ӵ�finalNFA��dowNFA�ĳ�̬
		start.exEdgesMultiMap.insert(pair<char, int>('@', finalNFA.startState));
		start.exEdgesMultiMap.insert(pair<char, int>('@', down.startState));
		//�޸�finalNFA����ʼ״̬
		finalNFA.startState = start.number;
		finalNFA.statesMap.insert(pair<int, NFAstate>(start.number, start));
		//���finalNFA����ֹ״̬
		finalNFA.endStatesMap.insert(down.endStatesMap.begin(), down.endStatesMap.end());
		//��down��״̬map������finalNFA��
		finalNFA.statesMap.insert(down.statesMap.begin(), down.statesMap.end());
	}
}