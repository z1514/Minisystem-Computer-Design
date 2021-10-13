#include"cLexl_READ.h"

//�ָ��
vector<string> separate(const string& a, const string& s)
{//aҪ���ֵ��У�s���ֵķ���
	vector<string> RE;
	if (a == "")
	{
		return RE;
	}

	string::size_type postion1 = 0, postion2 = a.find(s);//�ڶ���λ��Ϊ�ҵ���һ���ָ���
	while (postion2 != string::npos)
	{
		RE.push_back(a.substr(postion1, postion2 - postion1));//ȡ����postion1��ʼ����Ϊpostion2-postion1���ַ���
		postion1 = a.find_first_not_of(s, postion2);//�ҵ�postion2�����һ����Ϊ�ָ����ķ���
		postion2 = a.find(s, postion1);//��postion1��ʼ�ҵ��ָ���
	}
	if (postion1 != a.length());//���滹��  ֱ�Ӵ���
	{
		RE.push_back(a.substr(postion1));
	}
	return RE;
}

//ȥ�������ַ�
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
		cout << "cLexl_read:cLex.l��ʧ�ܣ�����" << endl;
		exit(1);
	}

	string currentline;//�洢��ǰ��
	int state = 0;//��ʾ��ǰ���ڵ�cLex.l�ļ��Ĳ���
				  //-1��ʾcLex.l�ļ������Ϲ淶��0Ϊ���ļ�״̬��1Ϊ�������岿�ݣ�
				  //2Ϊ������ʽ����,3Ϊʶ����򲿷�,4Ϊ�ӳ��򲿷�
	vector<string> separateRE;//�洢�ָ���head��ֵ�ԣ����ߴ洢action��
	string leaf, right;
	int count = 0;

	while (!in.eof() && state != -1)
	{

		//cout << "��ʼ����" << endl;
		getline(in, currentline);//��ȡÿһ�д洢��currentline
		if (currentline.empty()) continue;//Ϊ�գ�����
		switch (state) {
		case 0:
			if (currentline.find("%{") != string::npos)
			{
				state = 1;//�ļ��ѱ���ȷ�򿪣���ת���������岿��
			}
			else
			{
				state = -1;//�ļ������Ϲ淶
			}
			break;
		case 1:
			if (currentline.find("%}") != string::npos)
			{
				state = 2;//�������岿�ֽ�������ת��������ʽ����
			}
			else
			{
				supDef.push_back(currentline);//ֱ�Ӵ洢��ÿ�д洢һ��
			}
			break;
		case 2:
			if (currentline.find("%%") != string::npos)
			{
				state = 3;//������ʽ���ֽ�������ת��ʶ����򲿷�
			}
			else 
			{
				separateRE = separate(currentline, " ");//�ָ�
				//cout << separateRE[0] << endl;
				//cout << separateRE[1] << endl;
				if (separateRE.size() == 2) 
				{
					head.insert(pair<string, string>(separateRE[0], separateRE[1]));//���뵽map
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
				state = 4;//ʶ����򲿷ֽ�������ת���ӳ��򲿷�
			}
			else 
			{
				if (currentline[0] == '"') 
				{
					int p = 1;
					while (currentline[p] != '"') ++p;
					if (p == 1) ++p;//���"""�����
					leaf = currentline.substr(0, p + 1);//ȡ��˫�����е�����
					right = currentline.substr(p + 1);//ȡ����������
					clean(right);

					if (right[0] == '{') 
					{
						separateRE.push_back(right.substr(1, right.find_first_of(' ')));//ȡ��{�󵽵�һ���ո���ַ���
						separateRE.push_back(right.substr(right.find_first_of(' ') + 1,
							right.size() - right.find_first_of(' ') - 2));//ȡ��ʣ���
					}
					else
					{
						separateRE.push_back(right);//���ַ�����{��ֱ�Ӵ洢
					}
				}
				else if (currentline[0] == '{') 
				{
					int p = 1;
					while (currentline[p] != '}') ++p;
					leaf = currentline.substr(0, p + 1);//ȡ���������е�����
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