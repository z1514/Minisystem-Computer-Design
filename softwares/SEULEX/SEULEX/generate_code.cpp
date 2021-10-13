#include"generate_code.h"
const string CODE("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\"#%'()*+,-./:;<=>?[\\]^{|} \n\t\v\f~&$^");

void generate_code(string filename, vector<string>& supDef, DFA final_dfa,
	vector <Rules> rules, vector<string> functions)
{
	vector<vector<int>> dfaTable;
	//构建dfaTable，行代表状态号，列代表能否通过某一字符（CODE中）进入下一状态，-1表示不能
	for (int t = 0; t < final_dfa.statesVec.size(); ++t)//遍历dfa状态
	{
		vector<int> temp;
		for (int t1 = 0; t1 < CODE.size(); ++t1)
		{
			temp.push_back(-1);//全部存入-1，表示无下一状态
		}
		for (auto p : final_dfa.statesVec[t].exEdgesMap)//遍历该状态下，下一状态标号和边上键值
		{
			temp[CODE.find_first_of(p.first)] = p.second;//在CODE中找到该键值位置，作为数组序号，存入下一个状态标号
		}
		dfaTable.push_back(temp);//将该状态存入dfaTable
	}

	vector<int> sva;//终态数组，序号为状态号，所存内容为动作序号
	for (int t = 0; t < final_dfa.statesVec.size(); t++)//遍历dfa状态
	{
		sva.push_back(-1);
	}
	for (auto p : final_dfa.endStatesMap)//遍历dfa终态
	{
		sva[p.first] = p.second;//终态序号为数组标号，存入对于动作标号
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
	//输出dfaTable
	out << "int dfaTable [" << dfaTable.size() << "][" << CODE.size() << "]={" << endl;
	for (int i = 0; i < dfaTable.size(); i++)
	{
		//out << "[";
		for (int j = 0; j < CODE.size(); j++)
		{
			out << dfaTable[i][j] << ',';//输出该状态下，下一状态标号，-1表示无下一状态
		}
		out <<endl;
	}
	out << "};" << endl;
	//输出终态标号及其对应动作
	out << "int endS[" << final_dfa.statesVec.size() << "]={";
	for (int t = 0; t < sva.size(); t++)
	{
		out << sva[t] << ',';
	}
	out << "};" << endl;
	out << "const string CODE(\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!\\\"#%'()*+,-./:;<=>\?[\\\\]^{|} \\n\\t\\v\\f~&$^\"); " << endl;
	//输出动作
	out << "string act(int p)" << endl;
	out << "{" << endl;
	out << "\tswitch(p)" << endl;
	out << "\t{" << endl;
	for (int t = 0; t < rules.size(); ++t)//遍历规则
	{
		out << "\t\tcase " << t << ':' << endl;
		for (int i = 0; i < rules[t].actions.size(); ++i)
		{
			out << "\t\t" << rules[t].actions[i] << endl;//具体动作
		}
		out << "\t\tbreak;" << endl;
	}
	out << "\t}" << endl;
	out << "\treturn\"\";" << endl;
	out << "}" << endl;

	//分析函数，逐个字符分析
	out << "string analysis(char& current,char& next,int& state)" << endl;
	out << "{" << endl;
	out << "\tif (current == ' ')" << endl;//空格，输出为空
	out << "\t{" << endl;
	out << "\t\treturn \"\";" << endl;
	out << "\t}" << endl;
	out << "\tstate1=dfaTable[state][CODE.find_first_of(current)];" << endl;//根据当前字符，在dfaTable中找到对应下一状态
	out << "\tif(state1!=-1)" << endl;
	out << "\t{" << endl;//有下一状态的话
	out << "\t\tstate2=dfaTable[state1][CODE.find_first_of(next)];" << endl;//根据下一个字符判断是否有下一状态
	out << "\t\tif(state2==-1)" << endl;
	out << "\t\t{" << endl;//下一状态为-1表示终态
	out << "\t\t\tstate=" << final_dfa.startState << ";" << endl;//改为开始状态
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
	out << "\t\tstate=state1;" << endl;//不为终态，
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
	out << "\t\tout<<current;" << endl;//输出该字符
	out << "\t\treturn\"\";" << endl;//返回空
	out << "\t}" << endl;
	out << "\telse return\"#fffffff\";" << endl;//错误
	out << "}" << endl;
	//主函数
	out << "" << endl;
	out << "int main(int argc, char* argv[])" << endl;
	out << "{" << endl;
	out << "\tchar temp;" << endl;
	out << "\tint hang = 1;" << endl;//行数
	out << "\tint postion = 1;" << endl;//该词在这一行中的位置
	out << "\tint huanhang = 0;" << endl;//换行次数
	out << "\tout.open(\"tokens.txt\",ios::out);" << endl;
	out << "\tin.open(argv[1],ios::in);" << endl;//读入代解析的源代码的文件名
	out << "\tif(!in.good())" << endl;
	out << "\t\tcout<<\"无法打开文件\"<<endl;" << endl;
	out << "\twhile ((temp = in.get()) != EOF)" << endl;
	out << "\t{" << endl;
	out << "\t\tc_save = c_save + temp;" << endl;
	out << "\t}" << endl;
	out << "\tint state=" << final_dfa.startState << ";" << endl;//取得初始状态

	out << "\tchar next,current;" << endl;//读入第一个字符
	out << "\tcurrent = c_save[pos];" << endl;

	out << "\tpos++;" << endl;
	out << "\twhile(pos<c_save.size())" << endl;//遍历所有字符
	out << "\t{" << endl;
	out << "\t\tc = c_save[pos];" << endl;
	out << "\t\tpos++;" << endl;
	out << "\t\tnext=c;" << endl;
	out << "\t\tif (current == \'\\n\'&&next!=\'\\t\')" << endl;//换行符
	out << "\t\t{" << endl;
	out << "\t\t\thuanhang++;" << endl;//行数+1
	//out << "\t\t\tcontinue;" << endl;//跳过
	out << "\t\t}" << endl;
	out << "\t\tif(c==\'\\t\') continue;" << endl;
	out << "\t\tstring t=analysis(current,next,state);" << endl;
	out << "\t\tif(t!=\"\") " << endl;
	out << "\t\t{" << endl;
	out << "\t\t\tif (huanhang != 0)" << endl;//换行次数不为0，发生换行
	out << "\t\t\t\tpostion = 0;" << endl;//位置变为0
	out << "\t\t\thang += huanhang;" << endl;//行数+换行次数
	out << "\t\t\thuanhang= 0;" << endl;//换行次数变为0
	out << "\t\t\tif (current != \'\\n\')" << endl;
	out << "\t\t\t\tout << t << \"#\" << hang << \"#\" << postion << \"#\"<< endl;" << endl;//输出动作行号位置号
	out << "\t\t\tpostion++;" << endl;//位置号+1
	out << "\t\t}" << endl;
	out << "\t\tcurrent=c;" << endl;
	out << "\t}" << endl;
	out << "\tchar ee=0;" << endl;//以到最后一个字符，则下一个字符设为0
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