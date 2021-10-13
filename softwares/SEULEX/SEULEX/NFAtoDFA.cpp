#include"NFAtoDFA.h"
#include<stack>
#include<queue>
#include<iostream>
const string CODE("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^");


//��NFA״̬����e-closure�հ�
void e_closure(unordered_set<int>& initStatesSet, NFA nfa)
{
	stack<int> stack;
	vector<bool> handledFlagVec(nfa.statesMap.size());//��¼״̬�Ƿ񱻴���

	//����ʼ����������״̬��ջ
	for (const auto& s: initStatesSet)
	{
		stack.push(s);
		handledFlagVec[s] = true;//��Ǹ�״̬�Ѿ������
	}

	while (!stack.empty())
	{
		//�ҵ�ջ��״̬ͨ��@��(�ձ�)���Ե��������״̬
		auto itsPair = nfa.statesMap.find(stack.top())//ͨ��״̬����ҵ���Ӧ״̬
			->second.exEdgesMultiMap.equal_range('@');//�ҵ�����������@��map
		stack.pop();//��ջ
		auto beginIt = itsPair.first;
		auto endIt = itsPair.second;
		while (beginIt != endIt)
		{
			int unhandledItem = (*beginIt).second;
			//����Ѿ��������״̬������
			if (handledFlagVec[unhandledItem])
			{
				continue;
			}
			//����ѹջ���������״̬������
			else
			{
				stack.push(unhandledItem);//ѹջ
				initStatesSet.emplace(unhandledItem);//����״̬������
				++beginIt;
			}
		}
	}
}

//�Ӽ����취NFAתDFA
void nfa_to_dfa(NFA nfa, DFA& dfa)
{
	string edgeSet(CODE);
	queue<int> un_possessed_dfa_num;//��������δ��ǵ�dfa״̬��
	DFAstate dfaState;//dfa״̬
	int dfa_num = 0;//dfa״̬�ĺ���

	dfaState.number = dfa_num;//�޸�״̬���
	dfa_num++;
	dfaState.identitySet.insert(nfa.startState);//dfa״̬�����м���nfa��ʼ״̬
	//cout << dfaState.num << endl;
	//��ʼ��dfaState����ʱ��dfaState��ֻ����nfa�Ŀ�ʼ״̬
	e_closure(dfaState.identitySet, nfa);
	//��e-closure��s0������ʱdfaState����e-closure��s0������Ϊ��ʼ״̬

	un_possessed_dfa_num.push(dfaState.number);//����δ��Ƕ���
	dfa.statesVec.push_back(dfaState);

	while (!un_possessed_dfa_num.empty())
		//��dfa״̬����δ���״̬ʱ
	{
		int temp_dfa_num = un_possessed_dfa_num.front();
		//ȡһ��δ��ǵ�dfa״̬,(ȡ�������һ��δ���״̬)
		un_possessed_dfa_num.pop();
		//�������ϱ��,����δ���״̬����ɾ������

		for (const char& a : edgeSet)
			//����ÿ������a�������ַ���
		{
			unordered_set<int> tempSet;//�½�һ��set���洢 move[temp_dfa,c]
			//ע��move(T,a):�ܹ���T��ĳ��NFA״̬s��ʼͨ�����aת�������NFA״̬�ļ���

			//�����ǰdfa״̬��Ӧ��nfa״̬���Ķ��������ַ�cû�бߵ�������״̬
			bool flag = false;
			//cout << temp_dfa_num << endl;

			for (const auto& state : dfa.statesVec[temp_dfa_num].identitySet)//����״̬����
			{
				//��NFA״̬�������ҵ����ж�Ӧedge�ַ��ı�
				auto itsPair = nfa.statesMap.find(state)//ͨ��״̬����ҵ���Ӧ״̬
					->second.exEdgesMultiMap.equal_range(a);
				auto beginIt = itsPair.first; //��Ϊ���ϵ�ֵ��ֵΪ��һ��״̬���
				auto endIt = itsPair.second;
				//�����״̬û�з���edge��������
				if (beginIt == endIt)
				{
					continue;//��ʱflagΪfalse
				}
				//����ָ���״̬��Ų��뵽�Ӽ���
				while (beginIt != endIt)
				{
					tempSet.insert(beginIt->second);
					++beginIt;
				}
				flag = true;
			}
			if (flag)
			{//���Ե�������״̬
				//����dfa״̬U=e-closure(move(temp_dfa,a))

				int toStateNum;
				//��״̬��dfa״̬���
				e_closure(tempSet, nfa);
				//��move[temp,c]����epsilon�հ�,��ʱtempSetΪe-closure��move��T��a����
				bool is_existed = false;
				//��Ǹ��Ӽ��Ƿ��Ѿ�����

				for (const auto& s : dfa.statesVec)//����dfa״̬
				{
					if (s.identitySet == tempSet)
					{
						//���Ӽ��Ѿ�����
						toStateNum = s.number; //ָ��vec�����е�״̬
						is_existed = true;
						break;
					}
				}

				//���U��ǰ���ѭ����û�����ɹ�����ô�½����dfa״̬�����뵽dfa�У������뵽δ����б���
				if (!is_existed)
				{
					DFAstate newState;//�½�һ��״̬
					newState.number = dfa_num++;  //�±��
					toStateNum = newState.number; //ָ���½������״̬
					newState.identitySet = tempSet;
					dfa.statesVec.push_back(newState); //�½�״̬����״̬��vec
					un_possessed_dfa_num.push(toStateNum);	//��״̬ѹ��δ����״̬ջ

					//�����dfa״̬����һ��nfa��̬����ζ������һ��dfa��̬����ô�ҳ����dfa��̬��Ӧ�Ķ�������������ӵ�dfa����̬����
					int actions;
					bool flag = false;

					decltype(nfa.endStatesMap.find(0)) endStateIt; //Ҫѡ�����̬
					bool find = false;

					//�����Ӽ������е�NFA״̬
					for (const auto& nfaState : newState.identitySet)
					{
						//�жϸ�NFA״̬�ǲ�����̬
						auto it = nfa.endStatesMap.find(nfaState);
						//����̬�Ļ�
						if (it != nfa.endStatesMap.end())
						{
							//�������̬��Ӧ�Ķ�����.l�ļ��и���ǰ���DFA״̬��Ӧ�Ķ�������Ϊ�ö���
							if (find)
							{
								if (endStateIt->first > it->first)
									endStateIt = it;
							}
							else
							{
								endStateIt = it;
								find = true;
							}
						}
					}

					if (find)
					{
						actions = endStateIt->second;//��ǰ����ΪҪ�ҵ���̬�Ķ���
						flag = true;
					}
					else
						flag = false;
					if (flag)
					{
						//�����dfa��̬��Ӧ�Ķ�����ӵ�dfa����̬����
						dfa.endStatesMap.insert(pair<int, int>(newState.number, actions));
					}
				}
				//����DFA��һ����(һ����temp_dfa��U��ֵΪa�ı�)
				dfa.statesVec[temp_dfa_num].exEdgesMap.insert(pair<char, int>(a, toStateNum));
				//*************************************************
			}
		}
		cout << "nfa_to_dfa: " << un_possessed_dfa_num.size() << endl;
	}
}

//dfa��С��
void dfa_mini(DFA dfa, DFA& final_dfa)
{
	int set_count = 0;//�����еļ�����

	//���컮��T
	vector<set<int>> statesSetVec;//�洢DFA��С�������е�״̬���ϣ�����T
	map<int, int> statesSetMap;//�洢miniDFA��״̬�źͼ��ϺŵĶ�Ӧ��ϵ

	//�����ʼ���֣�����dfa�е�������̬
	for (const auto& p : dfa.endStatesMap)
	{
		statesSetVec.push_back(set<int>{p.first});//��ÿ����̬��������һ�������У������뻮��T��
		statesSetMap.emplace(p.first, set_count++);//��Ӷ�Ӧ��ϵ
	}

	//���з���̬����ͬһ��������
	set<int> tempSet;
	for (const auto& e : dfa.statesVec)
	{
		if (dfa.endStatesMap.find(e.number) == dfa.endStatesMap.end())//δ����̬�������ҵ���״̬
		{
			tempSet.insert(e.number);
			statesSetMap.emplace(e.number, set_count);//��Ӷ�Ӧ��ϵ
		}
	}
	statesSetVec.push_back(tempSet);
	//���뵽������
	++set_count;

	//�������Ի��ֽ��в��ϵķָ�ֱ�������ٷָ�Ϊֹ
	//ÿ��ѭ��ֻ��һ�����Ϸָ����������ÿ�����ֻ�����������һ���¼���
	bool flag = true;//�Ƿ��м��ϱ���
	while (flag)
	{
		cout << "���л���" << endl;
		int splitSetNumber = 0;//����ֵļ��ϱ��
		set<int> newSet;//����ֳ����¼���

		//���ڻ����е�ÿ������
		for (int k = 0; k < statesSetVec.size();++k)
		{
			auto& s = statesSetVec[k];//��ǰ����Ϊs
			if (s.size() == 1)
				continue;//���������ֻ��һ��״̬������
			else
			{
				auto& standard = dfa.statesVec[*(s.begin())];//������һ��state��Ϊ��׼
				//������׼״̬�����б�
				for (const auto& c : CODE)
				{
					 //��鼯���е�ÿһ��״̬
					for (const auto& i : s)
					{
						const auto& state = dfa.statesVec[i];
						if (state.number == standard.number)
							continue;//�����Լ����Լ��Ƚ�
						auto findStateIt = state.exEdgesMap.find(c);//��state����c��
						auto findStandardIt = standard.exEdgesMap.find(c);//�ڻ�׼state����c��
						
					    //���ȼ�����1������һ��״̬��c�߶���һ����c��
						if (findStateIt == state.exEdgesMap.end() && findStandardIt != standard.exEdgesMap.end())
						{
							flag = true;
							newSet.insert(i);
						}
						else if ((findStateIt != state.exEdgesMap.end()) && (findStandardIt == standard.exEdgesMap.end()))
						{
							flag = true;
							newSet.insert(i);
						}

						//���ȼ�����2������c�ߣ���Ŀ��״̬��ͬ
						else if ((findStateIt != state.exEdgesMap.end()) && (findStandardIt != standard.exEdgesMap.end()))
						{
							if (*(statesSetMap.find(findStandardIt->second)) != *(statesSetMap.find(findStateIt->second)))
							{
								flag = true;
								newSet.insert(i);
							}
						}
						else flag = false;//δ���л���
					}
					if (flag)
						break;//ÿ��ֻ�ֳ���������
				}
				if (flag)
				{
					splitSetNumber = k;
					break;
				}
			}
		}

		//ɾ������ּ����еı����״̬
		//���ڱ���ֳ������¼����е�ÿ��״̬
		for (const auto& s : newSet)
		{
			statesSetVec[splitSetNumber].erase(s);//�ڲ�ֵļ�����ɾ�����״̬
			statesSetMap.insert_or_assign(s, set_count);//�����µĶ�Ӧ��ϵ
		}
		//���¼���ѹ�뻮��T��
		if (newSet.size() != 0)
			statesSetVec.push_back(newSet);
		//�����еļ�������һ
		++set_count;
	}
	//�������

	//��̬���=temp_dfa��̬���ڼ��ϱ��
	final_dfa.startState = statesSetMap.find(dfa.startState)->second;

	//��̬
	for (const auto& p : dfa.endStatesMap)
	{
		final_dfa.endStatesMap.emplace(statesSetMap.find(p.first)->second, p.second);
	}
	//�����ֺ��״̬���뵽final_dfa
	for (int k = 0; k < statesSetVec.size(); ++k)
	{
		auto& pivotState = dfa.statesVec[*statesSetVec[k].cbegin()];
		DFAstate newState;
		newState.number = k;
		for (const auto& p : pivotState.exEdgesMap)
		{
			newState.exEdgesMap.emplace(p.first, statesSetMap.find(p.second)->second);
		}
		final_dfa.statesVec.push_back(newState);
	}
	//dfa��С�����
	return;
}

/*
����e-closure��T��
��T������״̬ѹ��stack��
while��stack�ǿգ�
{
��ջ��Ԫ��t����ջ�У�
for��ÿ����������������u����t������һ�����Ϊ�գ�@����ת������״̬u��
{
if��u����e-closure��T���У�
 ��u���뵽e-closure��T���У�
 ��uѹ��ջ��
}
}
*****************nfa to dfa �㷨******************************************
* �Ӽ����취��
* ���룺һ��NFA nfa(s0��nfa�Ŀ�ʼ״̬)
* �����һ��DFA dfa
* ��ʼ״̬��e - closure(s0)
* ����״̬���������ٰ�����nfa��һ������״̬��״̬��
* ������
* һ��ʼDstate��ֻ��e - closure(s0)������δ���
* while (Dstate����δ���״̬T)
* {
	*��T���ϱ�ǣ�
		* for��ÿ���������a��
		* {
		*U = e - closure��move��T��a������
		* if��U����Dstate�У�
		* {
		*��U����Dstate�У��Ҳ����
		*      }
		*Dtran[T,a] = U;//Dtran[T,a]��Dstate��dfa��ת���������൱�ڹ���һ���ߣ�
		* }
		*
}
*********************ע******************************************************
NFA״̬���ϵĲ�����
e - closure(s) :�ܹ���NFA��ĳ��״̬s��ʼֻͨ��@ת������NFA��״̬����
e - closure(T) : �ܹ���T��ĳ��NFA״̬s���Ͽ�ʼֻͨ��@�����NFA״̬����
move(T, a) : �ܹ���T��ĳ��NFA״̬����T��ʼͨ�����aת�������NFA״̬�ļ���

* ********************dfa��С���㷨 * ****************************************
*ԭ������ǰdfa��״̬���Ϸֻ��ɶ���飬ÿ����ĸ���״̬֮���໥�������֣�
* Ȼ���ÿ�����е�״̬�ϲ���ͬһ��״̬
* ������
* ��dfa���ֳɽ���״̬�ͷֽ���״̬������;
*          //��dfa��״̬����ΪS����ʼ״̬s0������״̬��ΪF
*          //(����ʼ����T������ ����״̬��ΪF,�ǽ���״̬��ΪS-F
*while (Tnew != T)
* {
	*Tnew = T;
	*for (T�е�ÿ����G)
		* {
		*��G���ֳɸ�С���飬ʹ������״̬s��t��
		* ͬһС���е��ҽ��������е��������a��
		* ״̬s��t��a�ϵ�ת��������T�е�ͬһ���飻
		* ��Tnew�а�G�滻����G�ֻ��õ���С��
		*
	}
	*
}
*Tfinal = T��
* Tfinal��ÿ������ѡ��һ��״̬��Ϊ����Ĵ�������minDFA��״̬���ϣ�
* minDFA�Ŀ�ʼ״̬����Щ������dfa�Ŀ�ʼ״̬��Ĵ���
* minDFA�Ľ���״̬�ǰ�����dfa����״̬����Ĵ���
* Ȼ����minDFA�ıߣ�
*       //����s��Tfinal��ĳ����Ĵ�������dfa��������a���뿪s��ת������t��
*��rΪt������H�Ĵ�����ô��minDFA��һ������һ����s��r������a��
* ��ת����
* ������״̬��
* ��ɣ�
* ***********************************ע * *****************************************
1��ʵ�����ڴʷ��������У������㷨�ĳ�ʼ�ֻ�Ӧ�ð�ʶ��ĳ���ض��Ĵ˷���Ԫ������
״̬�ŵ���Ӧ�˴ʷ���Ԫ��һ�����У�ͬʱ�Ѳ�ʶ���κδʷ���Ԫ��״̬�ŵ���һ����
*/