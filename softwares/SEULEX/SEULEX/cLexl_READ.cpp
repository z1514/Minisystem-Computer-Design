#include"cLexl_READ.h"

//分割函数
vector<string> separate(const string& a, const string& s)
{//a要划分的行，s划分的符号
	vector<string> RE;
	if (a == "")
	{
		return RE;
	}

	string::size_type postion1 = 0, postion2 = a.find(s);//第二个位置为找到第一个分隔符
	while (postion2 != string::npos)
	{
		RE.push_back(a.substr(postion1, postion2 - postion1));//取出从postion1开始长度为postion2-postion1的字符串
		postion1 = a.find_first_not_of(s, postion2);//找到postion2后面第一个不为分隔符的符号
		postion2 = a.find(s, postion1);//从postion1开始找到分隔符
	}
	if (postion1 != a.length());//后面还有  直接存入
	{
		RE.push_back(a.substr(postion1));
	}
	return RE;
}

//去掉无用字符
void clean(string& a)
{
	if (a.empty()) return;
	a.erase(0, a.find_first_not_of(' '));
	a.erase(0, a.find_first_not_of('\t'));
	a.erase(a.find_last_not_of(' ') + 1);
	a.erase(a.find_last_not_of('\r') + 1);
	a.erase(a.find_last_not_of('\n') + 1);
	a.erase(a.find_last_not_of('\t') + 1);
}


void cLexl_read(string filename,
	vector<string>& supDef, map<string, string>& head,
	vector<Rules>& rules, vector<string>& functions)
{
	ifstream in;
	in.open(filename.c_str(), ios::in);
	if (!in)
	{
		cout << "cLexl_read:cLex.l打开失败！！！" << endl;
		exit(1);
	}

	string currentline;//存储当前行
	int state = 0;//表示当前处于的cLex.l文件的部份
				  //-1表示cLex.l文件不符合规范，0为打开文件状态，1为辅助定义部份，
				  //2为正则表达式部份,3为识别规则部份,4为子程序部分
	vector<string> separateRE;//存储分割后的head键值对，或者存储action组
	string leaf, right;
	int count = 0;

	while (!in.eof() && state != -1)
	{

		//cout << "开始处理" << endl;
		getline(in, currentline);//获取每一行存储到currentline
		if (currentline.empty()) continue;//为空，继续
		switch (state) {
		case 0:
			if (currentline.find("%{") != string::npos)
			{
				state = 1;//文件已被正确打开，跳转到辅助定义部分
			}
			else
			{
				state = -1;//文件不符合规范
			}
			break;
		case 1:
			if (currentline.find("%}") != string::npos)
			{
				state = 2;//辅助定义部分结束，跳转到正则表达式部分
			}
			else
			{
				supDef.push_back(currentline);//直接存储，每行存储一个
			}
			break;
		case 2:
			if (currentline.find("%%") != string::npos)
			{
				state = 3;//正则表达式部分结束，跳转到识别规则部分
			}
			else 
			{
				separateRE = separate(currentline, " ");//分割
				//cout << separateRE[0] << endl;
				//cout << separateRE[1] << endl;
				if (separateRE.size() == 2) 
				{
					head.insert(pair<string, string>(separateRE[0], separateRE[1]));//存入到map
					separateRE.clear();
				}
				else
				{
					state = -1;
				}
			}
			break;
		case 3:
			if (currentline.find("%%") != string::npos)
			{
				state = 4;//识别规则部分结束，跳转到子程序部分
			}
			else 
			{
				if (currentline[0] == '"') 
				{
					int p = 1;
					while (currentline[p] != '"') ++p;
					if (p == 1) ++p;//针对"""的情况
					leaf = currentline.substr(0, p + 1);//取出双引号中的内容
					right = currentline.substr(p + 1);//取出后面内容
					clean(right);

					if (right[0] == '{') 
					{
						separateRE.push_back(right.substr(1, right.find_first_of(' ')));//取出{后到第一个空格的字符串
						separateRE.push_back(right.substr(right.find_first_of(' ') + 1,
							right.size() - right.find_first_of(' ') - 2));//取出剩余的
					}
					else
					{
						separateRE.push_back(right);//首字符不是{，直接存储
					}
				}
				else if (currentline[0] == '{') 
				{
					int p = 1;
					while (currentline[p] != '}') ++p;
					leaf = currentline.substr(0, p + 1);//取出花括号中的内容
					right = currentline.substr(p + 1);
					clean(right);
					separateRE.push_back(right);
				}
				Rules r;
				r.pattern = leaf;
				r.actions = separateRE;
				rules.push_back(r);
				separateRE.clear();
			}
			break;
		case 4:
			functions.push_back(currentline);
			break;
		}
	}

	return;
}