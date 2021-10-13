/*
	*last_modified_time:2021/01/04T21/44
*/
#pragma once
#include "seuYacc.h"

// read_grammar_file() �����﷨�ļ������м򵥵Ĵ��� 
// input:�﷨�ļ���
bool SeuYacc::read_grammar_file(string input_file) {
	source_file.open(input_file, ios::in);
	if (source_file.fail()) { cout << "[seuYacc:read_file.cpp]read_grammar_file: open file failed!" << endl; return false; }

	_buffer = new char[100];//����һ��������
	_indexSymbol = 0;//��Ź�0

	if (!read_priority_rule()) { cout << "[seuYacc:read_file.cpp]read_grammar_file: read priority rules failed!" << endl; return false; }
	if (!read_production()) { cout << "[seuYacc:read_file.cpp]read_grammar_file: read productions failed!" << endl; return false; }
	if (!translate_action()) { cout << "[seuYacc:read_file.cpp]read_grammar_file: translate actions failed!" << endl; return false; }
	else { output_action(input_file); }

	source_file.close();
	_terminalTable.insert(make_pair("$", _indexSymbol));
	_word.push_back("$");
	_indexSymbol++;
	if (_buffer != nullptr) delete[] _buffer;
	return true;
}

// ��ȡ���ȼ�����
bool SeuYacc::read_priority_rule() {
	string current_word = ""; unsigned int current_priotity = 0;
	read_one_char();
	while (true) {
		if (_peek != '%') { retract_one_char(); return true; }
		current_priotity++;
		read_one_char();
		if (_peek == 'l') { //���������
			read_one_char(); if (_peek != 'e') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'f') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 't') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char();
			while (_peek != '%') {
				if (_peek == '\'') {
					current_word = "";
					read_one_char();
					while (_peek != '\'') { current_word.operator+=(_peek); read_one_char(); }//��ȡ��ǰ���
					_terminalTable.insert(make_pair(current_word, _indexSymbol));//����ǰ������뵽�ս������
					_priority.insert(make_pair(_indexSymbol, current_priotity));//����ǰ������뵽���ȼ�����
					_leftAssociative.insert(make_pair(_indexSymbol, true));//����ǰ������뵽��Ϲ�����в����Ϊ����
					_word.push_back(current_word);//������ֱ��м���������
					_indexSymbol++;
				}
				read_one_char();
			}
		}
		else if (_peek == 'r') { //������ҽ��
			read_one_char(); if (_peek != 'i') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'g') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'h') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 't') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char();
			while (_peek != '%') {
				if (_peek == '\'') {
					current_word = "";
					read_one_char();
					while (_peek != '\'') { current_word.operator+=(_peek); read_one_char(); }//��ȡ��ǰ���
					_terminalTable.insert(make_pair(current_word, _indexSymbol));//����ǰ������뵽�ս������
					_priority.insert(make_pair(_indexSymbol, current_priotity));//����ǰ������뵽���ȼ�����
					_leftAssociative.insert(make_pair(_indexSymbol, false));//����ǰ������뵽��Ϲ�����в����Ϊ�ҽ��
					_word.push_back(current_word);//������ֱ��м���������
					_indexSymbol++;
				}
				read_one_char();
			}
		}
		else if (_peek == '%') { return true; }//���ȼ������ȡ���
	}
}

// ��ȡ����ʽ���򲢽��д���
bool SeuYacc::read_production()
{
	//�ȶ����еĲ���ʽ��������Զ���
	unsigned int state = 0;//��ȡ״̬���
	unsigned int procHead = 9999;//��ǵ�ǰ����ʽ���ı��
	unsigned int numOfProd = 0;//��ǵ�ǰ����ʽ�ı��
	unsigned int braceMatch = 0;//������嶯���Ļ�����ƥ��
	bool endFlag = false;//��ȡ�����ķ���
	string current_word = "";//��ǰ�����ĵ���
	list<unsigned int> list;//�洢��ǰһ������ʽ�Ҳ�
	std::list<unsigned int> empty_list;//�������lsit�Ŀ�list
	while (!endFlag){
		switch (state) {
		case 0://������ʽ��
			if (!read_one_char()) endFlag = true;
			else if (isLegalLetter(_peek)) { current_word.operator+=(_peek); state = 0; }//���ڶ�һ������
			else if (_peek == ':') {//��������ʽ�м�ķֽ��ð��
				// �ڷ��ս������Ѱ�Ҳ���ʽ�󲿵ķ���
				auto found = _nonterminalTable.find(current_word);
				if (found != _nonterminalTable.end()) {// ������ս�������Ѿ�����������ŵĻ�
					procHead = found->second;//��procHead��Ϊ�÷��ս���ı��
				}
				else {// ��������ڵĻ����½�һ�������ȥ
					_nonterminalTable.insert(make_pair(current_word, _indexSymbol));
					_nonterminalNullable.insert(make_pair(_indexSymbol, false));
					_word.push_back(current_word);//��������в��뵱ǰ���ս��
					procHead = _indexSymbol;//��procHead��Ϊ�÷��ս���ı��
					++_indexSymbol;
				}
				current_word = "";//��յ�ǰ����
				state = 1;
			}
			break;
		case 1://������ʽ�Ҳ�
			read_one_char();
			if (isLegalLetter(_peek)) { current_word.operator+=(_peek); state = 1; }//���ڶ�һ������
			else if (_peek == ' ' || _peek == '\t' || _peek == '\n'){//�����ո� �Ʊ� ����ʱ
				if (!current_word.empty()) {// �ڷ��ս������Ѱ�Ҳ���ʽ�󲿵ķ���
					auto found = _nonterminalTable.find(current_word);
					if (found != _nonterminalTable.end()) {
						// ������ս�������Ѿ�����������ŵĻ�
						// �ڵ�ǰ����ʽ�Ҳ��м����������
						list.push_back(found->second);
					}
					else {// ��������ڵĻ����½�һ�������ȥ
						_nonterminalTable.insert(make_pair(current_word, _indexSymbol));
						_nonterminalNullable.insert(make_pair(_indexSymbol, false));
						_word.push_back(current_word);
						// ���ڵ�ǰ����ʽ�Ҳ��м����������
						list.push_back(_indexSymbol);
						++_indexSymbol;
					}
				}
				current_word = "";
				state = 1;
			}
			else if (_peek == '|') {// ����ǡ�|���Ļ�����ζ��һ���ұ��Ѿ����꣬���Զ�����͵�ǰ����ʽ��һ���Ĳ���ʽ�Ҳ�
				_productionVector.push_back(ProductionItem(procHead, list, list.size(), numOfProd++));//�ѵ�ǰ����ʽ���뵽����ʽ�б���
				if (list.empty()) {
					_nonterminalNullable.find(procHead)->second = true;//����ǿղ���ʽ�����һ��
				}
				list.swap(empty_list);
				empty_list.clear();
				current_word = "";//��յ�ǰ���ʺ͵�ǰlist
			}
			else if (_peek == '\'' || _peek == ';' || _peek == '{'){// ���� ' ; { ����������ʱ����ζ�ŵ�ǰ״̬��Ҫ�ı䣬�ֱ���
				//�ȴ���һ��ǰ������ĵ���
				if (!current_word.empty()) {
					auto found = _nonterminalTable.find(current_word);
					if (found != _nonterminalTable.end()) {
						list.push_back(found->second);
					}
					else {
						_nonterminalTable.insert(std::make_pair(current_word, _indexSymbol));
						_nonterminalNullable.insert(std::make_pair(_indexSymbol, false));
						_word.push_back(current_word);
						list.push_back(_indexSymbol);
						++_indexSymbol;
					}
				}
				current_word = "";//��յ�ǰ����
				if (_peek == '\'') state = 2;//ת�������ս��
				else if (_peek == ';') state = 3;//��ǰ����ʽ�Ѿ���ɣ���Ҫ��ӵ�����ʽ�б���
				else if (_peek == '{') { state = 4; braceMatch++; }//ת���������嶯�� ������ƥ����δƥ���һ
			}
			break;
		case 2://���ս��
			read_one_char();
			if (_peek == '\'') {//��ǰ���ս��������
				auto found = _terminalTable.find(current_word);
				//���ս������Ѱ�ҵ�ǰ�ս�������������
				if (found != _terminalTable.end()) {
					list.push_back(found->second);//�ڵ�ǰ����ʽ�м��뵱ǰ���ս��
				}
				else {
					_terminalTable.insert(make_pair(current_word, _indexSymbol));
					_word.push_back(current_word);
					list.push_back(_indexSymbol);//�ڵ�ǰ����ʽ�м��뵱ǰ���ս��
					_indexSymbol++;
				}
				current_word = "";//��յ�ǰ����
				state = 1;//�ص�������ʽ�Ҳ�״̬
			}
			else { current_word.operator+=(_peek); }//��ǰ���ս��û�ж���
			break;
		case 3://����һ������ʽ�����굱ǰ�󲿵����һ������ʽ��
			_productionVector.push_back(ProductionItem(procHead, list, list.size(), numOfProd++));
			if (list.empty()) {//����ǿղ���ʽ�����һ��
				_nonterminalNullable.find(procHead)->second = true;}
			list.swap(empty_list);//��յ�ǰlist
			empty_list.clear();
			current_word = "";//��յ�ǰ����
			state = 0;//�ص�������ʽ��״̬
			break;
		case 4://��ȡ���嶯��
			read_one_char();
			if (_peek == '}' && braceMatch == 1) {//�����ǰ���嶯���Ѿ�������
				braceMatch--;
				_productionAction.insert(make_pair(numOfProd, current_word));//������ʽ�Ŵ洢���嶯��
				current_word = "";//��յ�ǰ����
				state = 1;//�ص�������ʽ�Ҳ�״̬
			}
			else {//û�ж���
				current_word.operator+=(_peek);
				//������ػ�����
				if (_peek == '{') { braceMatch++; }
				else if (_peek == '}') {braceMatch--;}
			}
			break;
		default:cout << "[seuYacc:read_file.cpp]read_production: unreachable state!" << endl;return false;break;
		}
	}
	// ������пղ���ʽ����չ
	// ������ս�����õ����п��ܵĿղ���ʽ��
	bool continueFlag = true;//��ǵ�ǰѭ���Ƿ����µĿղ���ʽ����
	while (continueFlag) {
		continueFlag = false;
		for (auto& X : _nonterminalNullable) {//�������ս����
			if (X.second == true) continue;//����Ը��ս��Ϊ�󲿵Ĳ���ʽ�����ǿղ���ʽ������
			else {
				// ����鿴�����Ե�ǰ���ս��Ϊ�󲿵Ĳ���ʽ
				for (auto& prod : _productionVector) {
					if (prod._head == X.first) {
						// check X->ABC..., where A,B,C,.. are all nullable
						auto start = prod._bodyList.begin(), end = prod._bodyList.end();
						auto temp_end = _nonterminalNullable.end();
						for (; start != end; ++start) {
							auto found = _nonterminalNullable.find(*start);
							if (found == temp_end || found->second == false) break;
						}
						if (start == end) {
							X.second = true;
							continueFlag = true;
						}
					}
				} 
			}
		} 
	}

	return true;
}

// �������嶯��
bool SeuYacc::translate_action()
{
	for (auto& current_action : _productionAction) {// �������嶯����
		string old_action = current_action.second;//ԭ�������嶯��
		string action_translated;//����õ����嶯��
		unsigned int cur_index = 0, index_end = old_action.length();
		while (cur_index != index_end) {//˳��鿴���嶯������ÿ���ַ�
			if ((old_action[cur_index] == '$'&& old_action[cur_index+1]=='$')||(old_action[cur_index] == '$'&& isdigit(old_action[cur_index+1]))) {//�������$��ͷ�Ļ�,��Ҫ�������滻
				cur_index++;
				if (old_action[cur_index] == '$') {// ����� $$�����ǲ���ʽͷ
					cur_index+=2; // skip dot
					string strAttr;
					while (isalpha(old_action[cur_index])) {
						strAttr += old_action[cur_index];
						cur_index++;
					}
					action_translated += "reduceHead[\"" + strAttr + "\"]";
				}
				else if (isdigit(old_action[cur_index])) {// ����ǡ�$1�����������͵Ļ�����ô���Ȱ�����n�浽pos�У�Ȼ��������
					int pos = old_action[cur_index] - '0';
					cur_index++;
					while (isdigit(old_action[cur_index])) {// ��ȡ������
						pos = pos * 10 + (old_action[cur_index] - '0');
						cur_index++;
					}
					cur_index++; // skip dot
					string strAttr;
					while (isalpha(old_action[cur_index])) {//�ҵ�����ֵ
						strAttr += old_action[cur_index];
						cur_index++;
					}
					if (strAttr == "width" || strAttr == "lexval") {// �������ֵΪ��width�����ߡ�lexval���Ļ�����Ҫ����һ�£�Ҫ���ַ���ת��Ϊint�͵ı���
						// atoi�������ַ���ת��Ϊint 
						// ջ�е� [ջ�Ĵ�С-����ʽ����+����n]��Ԫ��
						/*
						   * ��X->A+B {$$.lexval=$1.lexval+$2.lexval}
						   * ��ô����$1.lexvalʱ���������룺atoi(stack[stackSize-3+1].map["lexval"].c_str())
						*/
						action_translated += "atoi(Stack[stackSize - " + to_string(_productionVector[current_action.first]._bodyLength)+ " + " + to_string(pos) + "]._map[\"" + strAttr + "\"].c_str())";
					}
					else {// ��Ȼ�Ļ�ֱ�ӽ���ջ���д���// �ҵ�ջ�ж�Ӧ����������ֵ
						action_translated += "Stack[stackSize - " + to_string(_productionVector[current_action.first]._bodyLength) + " + " + to_string(pos) + "]._map[\"" + strAttr + "\"]";
					}
				}
				continue;
			}
			else if (old_action[cur_index] == ';') {//���з���
				action_translated += ";\n";
				cur_index++;
			}
			else if (old_action[cur_index] == '|'&& old_action[cur_index+1] == '|') {//�ѻ��ɼ�
				action_translated += " + ";
				cur_index+=2;
			}
			/*else if (old_action[cur_index] == '\n')
			{
				action_translated += ";\n";
				cur_index++;
			}*/
			else {//���跭���ֱ���������
				action_translated += old_action[cur_index];
				cur_index++;
			}
		}
		current_action.second = action_translated;
	}
	return true;
}

// ������������嶯�����ļ�
// input: �����ļ���
bool SeuYacc::output_action(string input_file) {
	ofstream out("actionYacc.cpp");
	out << "/* \n";
	out << "* actionYacc.h\n";
	out << "* auto generated by SeuYacc::output_action()\n";
	out << "* action source file: "<< input_file << "\n";
	out << "*/ \n";
	out << "\n";
	out << "#include \"DataStructureDefine.h\"\n";
	out << "#include \"generateHead.h\"\n";
	out << "using namespace std;\n";
	out << "\n";
	out << "\n";
	out << "string p;\n";
	out << "\n";
	out << "pair<unsigned int, string> performAction(unsigned int index, map<string, string>& reduceHead) {\n";
	out << "size_t stackSize = Stack.size() - 1;\n";
	out << "\n";
	out << "switch(index) {\n";
	for (unsigned int index = 0; index < _productionAction.size(); ++index) {//����ÿ������ʽ��Ӧ�����嶯���������
		out << "case " << index << " :";
		// output production for view
		out << "//" << _word.at(_productionVector[index]._head).c_str() << "->";
		for (auto& it3 : _productionVector[index]._bodyList) {
			out << _word.at(it3).c_str() << " ";
		}
		out << std::endl << _productionAction[index] << std::endl;
		out << "return pair<unsigned int, string>("
			<< _productionVector[index]._bodyLength << ",\""
			<< _word[_productionVector[index]._head] << "\");\n\n";
	}
	out << "default: return pair<unsigned int, string>(0,\"\");\n";
	out << "}\n";
	out << "}// end function\n";

	out << "string getProduction(unsigned int index) {\n";
	out << "switch(index) {\n";
	for (unsigned int index = 0; index < _productionAction.size(); ++index) {
		out << "case " << index << " :";
		out << "return \"" << _word.at(_productionVector[index]._head).c_str() << "->";
		for (auto& it3 : _productionVector[index]._bodyList) {
			out << _word.at(it3).c_str() << " ";
		}
		out << "\";\n";
	}
	out << "default: return \"\";\n";
	out << "}\n";
	out << "}\n";

	out << "\n";
	out.close();
	return true;
}



/* �ĸ����ļ��ĸ������� */
// read one char
bool SeuYacc::read_one_char() {
	if (_offset == -1) {
		if (!source_file.eof()) {
			source_file.getline(_buffer, 100);
			++_line;
		}
		else
			return false;
	}
	++_offset;
	if (_offset == strlen(_buffer)) {
		_offset = -1;
		read_one_char();
	}
	else {
		_peek = _buffer[_offset];
		//if (_peek == ' ' || _peek == '\t' || _peek == '\n') read();
		if (_peek == '\n') read_one_char();
	}
	return true;
}

// retract the char back to stream
void SeuYacc::retract_one_char() {
	//_sourcefile.putback(_peek);
	if (_offset == -1) _offset = strlen(_buffer);
	_offset -= 1;
}

bool SeuYacc::isLetterOrDigit(char ch) {
	return ('A' <= ch && ch <= 'Z')
		|| ('a' <= ch && ch <= 'z')
		|| ('0' <= ch && ch <= '9');
}

bool SeuYacc::isLegalLetter(char ch) {
	return (isLetterOrDigit(ch) || ch == '_');
}




