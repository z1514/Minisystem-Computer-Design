#include"generate_code.h"
const string CODE("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^");

void generate_code(string filename, vector<string>& supDef, DFA final_dfa,
	vector <Rules> rules, vector<string> functions)
{
	vector<vector<int>> dfaTable;
	//����dfaTable���д���״̬�ţ��д����ܷ�ͨ��ĳһ�ַ���CODE�У�������һ״̬��-1��ʾ����
	for (int t = 0; t < final_dfa.statesVec.size(); ++t)//����dfa״̬
	{
		vector<int> temp;
		for (int t1 = 0; t1 < CODE.size(); ++t1)
		{
			temp.push_back(-1);//ȫ������-1����ʾ����һ״̬
		}
		for (auto p : final_dfa.statesVec[t].exEdgesMap)//������״̬�£���һ״̬��źͱ��ϼ�ֵ
		{
			temp[CODE.find_first_of(p.first)] = p.second;//��CODE���ҵ��ü�ֵλ�ã���Ϊ������ţ�������һ��״̬���
		}
		dfaTable.push_back(temp);//����״̬����dfaTable
	}

	vector<int> sva;//��̬���飬���Ϊ״̬�ţ���������Ϊ�������
	for (int t = 0; t < final_dfa.statesVec.size(); t++)//����dfa״̬
	{
		sva.push_back(-1);
	}
	for (auto p : final_dfa.endStatesMap)//����dfa��̬
	{
		sva[p.first] = p.second;//��̬���Ϊ�����ţ�������ڶ������
	}

	ofstream out;
	out.open(filename, ios::out);
	out << "#include<iostream>" << endl;
	out << "#include<fstream>" << endl;
	out << "#include<string>" << endl;
	for (int t = 0; t < supDef.size(); t++)
	{
		out << supDef[t] << endl;
	}
	out << "using namespace std;" << endl;
	out << "ofstream out;" << endl;
	out << "ifstream in;" << endl;
	out << "char c;" << endl;
	out << "int state1;"<<endl;
	out << "int state2;" << endl;
	out << "int pos = 0;" << endl;
	out << "string c_save;" << endl;
	//���dfaTable
	out << "int dfaTable [" << dfaTable.size() << "][" << CODE.size() << "]={" << endl;
	for (int i = 0; i < dfaTable.size(); i++)
	{
		//out << "[";
		for (int j = 0; j < CODE.size(); j++)
		{
			out << dfaTable[i][j] << ',';//�����״̬�£���һ״̬��ţ�-1��ʾ����һ״̬
		}
		out <<endl;
	}
	out << "};" << endl;
	//�����̬��ż����Ӧ����
	out << "int endS[" << final_dfa.statesVec.size() << "]={";
	for (int t = 0; t < sva.size(); t++)
	{
		out << sva[t] << ',';
	}
	out << "};" << endl;
	out << "const string CODE(\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\\\"#%'()*+,-./:;<=>\?[\\\\]^{|} \\n\\t\\v\\f~&$^\"); " << endl;
	//�������
	out << "string act(int p)" << endl;
	out << "{" << endl;
	out << "\tswitch(p)" << endl;
	out << "\t{" << endl;
	for (int t = 0; t < rules.size(); ++t)//��������
	{
		out << "\t\tcase " << t << ':' << endl;
		for (int i = 0; i < rules[t].actions.size(); ++i)
		{
			out << "\t\t" << rules[t].actions[i] << endl;//���嶯��
		}
		out << "\t\tbreak;" << endl;
	}
	out << "\t}" << endl;
	out << "\treturn\"\";" << endl;
	out << "}" << endl;

	//��������������ַ�����
	out << "string analysis(char& current,char& next,int& state)" << endl;
	out << "{" << endl;
	out << "\tif (current == ' ')" << endl;//�ո����Ϊ��
	out << "\t{" << endl;
	out << "\t\treturn \"\";" << endl;
	out << "\t}" << endl;
	out << "\tstate1=dfaTable[state][CODE.find_first_of(current)];" << endl;//���ݵ�ǰ�ַ�����dfaTable���ҵ���Ӧ��һ״̬
	out << "\tif(state1!=-1)" << endl;
	out << "\t{" << endl;//����һ״̬�Ļ�
	out << "\t\tstate2=dfaTable[state1][CODE.find_first_of(next)];" << endl;//������һ���ַ��ж��Ƿ�����һ״̬
	out << "\t\tif(state2==-1)" << endl;
	out << "\t\t{" << endl;//��һ״̬Ϊ-1��ʾ��̬
	out << "\t\t\tstate=" << final_dfa.startState << ";" << endl;//��Ϊ��ʼ״̬
	out << "\t\t\tif (act(endS[state1]) == \"num\" && (pos + 1 < c_save.size()) && (CODE.find_first_of(c_save[pos - 1]) < 53))" << endl;
	out << "\t\t\t{" << endl;
	out << "\t\t\t\tout << current;" << endl;
	out << "\t\t\t\tint i = pos - 1;" << endl;
	out << "\t\t\t\twhile (CODE.find_first_of(c_save[i]) < 63)" << endl;
	out << "\t\t\t\t{" << endl;
	out << "\t\t\t\t\tout << c_save[i];" << endl;
	out << "\t\t\t\t\ti = pos;" << endl;
	out << "\t\t\t\t\tpos++;" << endl;
	out << "\t\t\t\t}" << endl;
	out << "\t\t\t\tpos--;" << endl;
	out << "\t\t\t\tc = c_save[pos];" << endl;
	out << "\t\t\t\tcurrent = c;" << endl;
	out << "\t\t\t\tpos++;" << endl;
	out << "\t\t\t\tnext = c_save[pos];" << endl;
	out << "\t\t\t\tout << \"#\";" << endl;
	out << "\t\t\t\treturn\"fffffff\";" << endl;
	out << "\t\t\t}" << endl;
	out << "\t\t\telse" << endl;
	out << "\t\t\t{" << endl;
	out << "\t\t\t\tout << current << \"#\";" << endl;
	out << "\t\t\t\treturn(act(endS[state1]));" << endl;
	out << "\t\t\t}" << endl;
	out << "\t\t}" << endl;
	out << "\t\tstate=state1;" << endl;//��Ϊ��̬��
	out << "\t\tif (current == '/' && next == '/')" << endl;
	out << "\t\t{" << endl;
	out << "\t\t\t	flag = 1;" << endl;
	out << "\t\t\t	return"";" << endl;
	out << "\t\t}" << endl;
	out << "\t\tif (current == '/' && flag == 1)" << endl;
	out << "\t\t{" << endl;
		//out << "**************" << next<<endl;
	out << "\t\t\t	flag = 0;" << endl;
	out << "\t\t\t	return"";" << endl;
    out << "\t\t}" << endl;
	out << "\t\tout<<current;" << endl;//������ַ�
	out << "\t\treturn\"\";" << endl;//���ؿ�
	out << "\t}" << endl;
	out << "\telse return\"#fffffff\";" << endl;//����
	out << "}" << endl;
	//������
	out << "" << endl;
	out << "int main(int argc, char* argv[])" << endl;
	out << "{" << endl;
	out << "\tchar temp;" << endl;
	out << "\tint hang = 1;" << endl;//����
	out << "\tint postion = 1;" << endl;//�ô�����һ���е�λ��
	out << "\tint huanhang = 0;" << endl;//���д���
	out << "\tout.open(\"tokens.txt\",ios::out);" << endl;
	out << "\tin.open(argv[1],ios::in);" << endl;//�����������Դ������ļ���
	out << "\tif(!in.good())" << endl;
	out << "\t\tcout<<\"�޷����ļ�\"<<endl;" << endl;
	out << "\twhile ((temp = in.get()) != EOF)" << endl;
	out << "\t{" << endl;
	out << "\t\tc_save = c_save + temp;" << endl;
	out << "\t}" << endl;
	out << "\tint state=" << final_dfa.startState << ";" << endl;//ȡ�ó�ʼ״̬

	out << "\tchar next,current;" << endl;//�����һ���ַ�
	out << "\tcurrent = c_save[pos];" << endl;

	out << "\tpos++;" << endl;
	out << "\twhile(pos<c_save.size())" << endl;//���������ַ�
	out << "\t{" << endl;
	out << "\t\tc = c_save[pos];" << endl;
	out << "\t\tpos++;" << endl;
	out << "\t\tnext=c;" << endl;
	out << "\t\tif (current == \'\\n\'&&next!=\'\\t\')" << endl;//���з�
	out << "\t\t{" << endl;
	out << "\t\t\thuanhang++;" << endl;//����+1
	//out << "\t\t\tcontinue;" << endl;//����
	out << "\t\t}" << endl;
	out << "\t\tif(c==\'\\t\') continue;" << endl;
	out << "\t\tstring t=analysis(current,next,state);" << endl;
	out << "\t\tif(t!=\"\") " << endl;
	out << "\t\t{" << endl;
	out << "\t\t\tif (huanhang != 0)" << endl;//���д�����Ϊ0����������
	out << "\t\t\t\tpostion = 0;" << endl;//λ�ñ�Ϊ0
	out << "\t\t\thang += huanhang;" << endl;//����+���д���
	out << "\t\t\thuanhang= 0;" << endl;//���д�����Ϊ0
	out << "\t\t\tif (current != \'\\n\')" << endl;
	out << "\t\t\t\tout << t << \"#\" << hang << \"#\" << postion << \"#\"<< endl;" << endl;//��������к�λ�ú�
	out << "\t\t\tpostion++;" << endl;//λ�ú�+1
	out << "\t\t}" << endl;
	out << "\t\tcurrent=c;" << endl;
	out << "\t}" << endl;
	out << "\tchar ee=0;" << endl;//�Ե����һ���ַ�������һ���ַ���Ϊ0
	out << "\tstring t=analysis(current,ee,state);" << endl;
	out << "\tif(t!=\"\") out<<t << \"#\" << hang << \"#\" << postion << \"#\"<< endl;" << endl;
	out << "\tout.close();" << endl;
	out << "}" << endl;

	for (int t = 0; t < functions.size(); t++)
	{
		out << functions[t] << endl;
	}
	out << "" << endl;
	out.close();
	return;
}