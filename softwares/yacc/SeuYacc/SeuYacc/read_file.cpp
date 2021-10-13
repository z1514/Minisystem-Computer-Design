/*
	*last_modified_time:2021/01/04T21/44
*/
#pragma once
#include "seuYacc.h"

// read_grammar_file() 读入语法文件并进行简单的处理 
// input:语法文件名
bool SeuYacc::read_grammar_file(string input_file) {
	source_file.open(input_file, ios::in);
	if (source_file.fail()) { cout << "[seuYacc:read_file.cpp]read_grammar_file: open file failed!" << endl; return false; }

	_buffer = new char[100];//定义一个缓冲区
	_indexSymbol = 0;//标号归0

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

// 读取优先级规则
bool SeuYacc::read_priority_rule() {
	string current_word = ""; unsigned int current_priotity = 0;
	read_one_char();
	while (true) {
		if (_peek != '%') { retract_one_char(); return true; }
		current_priotity++;
		read_one_char();
		if (_peek == 'l') { //如果是左结合
			read_one_char(); if (_peek != 'e') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'f') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 't') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char();
			while (_peek != '%') {
				if (_peek == '\'') {
					current_word = "";
					read_one_char();
					while (_peek != '\'') { current_word.operator+=(_peek); read_one_char(); }//读取当前算符
					_terminalTable.insert(make_pair(current_word, _indexSymbol));//将当前算符插入到终结符表中
					_priority.insert(make_pair(_indexSymbol, current_priotity));//将当前算符插入到优先级表中
					_leftAssociative.insert(make_pair(_indexSymbol, true));//将当前算符插入到结合规则表中并标记为左结合
					_word.push_back(current_word);//向输出字表中加入这个算符
					_indexSymbol++;
				}
				read_one_char();
			}
		}
		else if (_peek == 'r') { //如果是右结合
			read_one_char(); if (_peek != 'i') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'g') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 'h') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char(); if (_peek != 't') { cout << "[seuYacc:read_file.cpp] read_priority_rule: read rule failed!" << endl; return false; }
			read_one_char();
			while (_peek != '%') {
				if (_peek == '\'') {
					current_word = "";
					read_one_char();
					while (_peek != '\'') { current_word.operator+=(_peek); read_one_char(); }//读取当前算符
					_terminalTable.insert(make_pair(current_word, _indexSymbol));//将当前算符插入到终结符表中
					_priority.insert(make_pair(_indexSymbol, current_priotity));//将当前算符插入到优先级表中
					_leftAssociative.insert(make_pair(_indexSymbol, false));//将当前算符插入到结合规则表中并标记为右结合
					_word.push_back(current_word);//向输出字表中加入这个算符
					_indexSymbol++;
				}
				read_one_char();
			}
		}
		else if (_peek == '%') { return true; }//优先级规则读取完成
	}
}

// 读取产生式规则并进行处理
bool SeuYacc::read_production()
{
	//先读所有的产生式规则和语言动作
	unsigned int state = 0;//读取状态标记
	unsigned int procHead = 9999;//标记当前产生式左侧的标号
	unsigned int numOfProd = 0;//标记当前产生式的标号
	unsigned int braceMatch = 0;//标记语义动作的花括号匹配
	bool endFlag = false;//读取结束的符号
	string current_word = "";//当前读到的单词
	list<unsigned int> list;//存储当前一个产生式右部
	std::list<unsigned int> empty_list;//用来清空lsit的空list
	while (!endFlag){
		switch (state) {
		case 0://读产生式左部
			if (!read_one_char()) endFlag = true;
			else if (isLegalLetter(_peek)) { current_word.operator+=(_peek); state = 0; }//仍在读一个单词
			else if (_peek == ':') {//遇到产生式中间的分界符冒号
				// 在非终结符表中寻找产生式左部的符号
				auto found = _nonterminalTable.find(current_word);
				if (found != _nonterminalTable.end()) {// 如果非终结符表中已经存在这个符号的话
					procHead = found->second;//把procHead记为该非终结符的标号
				}
				else {// 如果不存在的话，新建一个插入进去
					_nonterminalTable.insert(make_pair(current_word, _indexSymbol));
					_nonterminalNullable.insert(make_pair(_indexSymbol, false));
					_word.push_back(current_word);//在输出表中插入当前非终结符
					procHead = _indexSymbol;//把procHead记为该非终结符的标号
					++_indexSymbol;
				}
				current_word = "";//清空当前单词
				state = 1;
			}
			break;
		case 1://读产生式右侧
			read_one_char();
			if (isLegalLetter(_peek)) { current_word.operator+=(_peek); state = 1; }//仍在读一个单词
			else if (_peek == ' ' || _peek == '\t' || _peek == '\n'){//读到空格 制表 换行时
				if (!current_word.empty()) {// 在非终结符表中寻找产生式左部的符号
					auto found = _nonterminalTable.find(current_word);
					if (found != _nonterminalTable.end()) {
						// 如果非终结符表中已经存在这个符号的话
						// 在当前产生式右部中加入这个符号
						list.push_back(found->second);
					}
					else {// 如果不存在的话，新建一个插入进去
						_nonterminalTable.insert(make_pair(current_word, _indexSymbol));
						_nonterminalNullable.insert(make_pair(_indexSymbol, false));
						_word.push_back(current_word);
						// 并在当前产生式右部中加入这个符号
						list.push_back(_indexSymbol);
						++_indexSymbol;
					}
				}
				current_word = "";
				state = 1;
			}
			else if (_peek == '|') {// 如果是“|”的话，意味着一个右边已经读完，可以读后面和当前产生式左部一样的产生式右部
				_productionVector.push_back(ProductionItem(procHead, list, list.size(), numOfProd++));//把当前产生式插入到产生式列表中
				if (list.empty()) {
					_nonterminalNullable.find(procHead)->second = true;//如果是空产生式，标记一下
				}
				list.swap(empty_list);
				empty_list.clear();
				current_word = "";//清空当前单词和当前list
			}
			else if (_peek == '\'' || _peek == ';' || _peek == '{'){// 读到 ' ; { 这三个符号时，意味着当前状态需要改变，分别处理
				//先处理一下前面读到的单词
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
				current_word = "";//清空当前单词
				if (_peek == '\'') state = 2;//转到处理终结符
				else if (_peek == ';') state = 3;//当前产生式已经完成，需要添加到产生式列表中
				else if (_peek == '{') { state = 4; braceMatch++; }//转到处理语义动作 把括号匹配标记未匹配加一
			}
			break;
		case 2://读终结符
			read_one_char();
			if (_peek == '\'') {//当前非终结符读完了
				auto found = _terminalTable.find(current_word);
				//在终结符表中寻找当前终结符，视情况处理
				if (found != _terminalTable.end()) {
					list.push_back(found->second);//在当前产生式中加入当前非终结符
				}
				else {
					_terminalTable.insert(make_pair(current_word, _indexSymbol));
					_word.push_back(current_word);
					list.push_back(_indexSymbol);//在当前产生式中加入当前非终结符
					_indexSymbol++;
				}
				current_word = "";//清空当前单词
				state = 1;//回到读产生式右部状态
			}
			else { current_word.operator+=(_peek); }//当前非终结符没有读完
			break;
		case 3://读完一个产生式（读完当前左部的最后一个产生式）
			_productionVector.push_back(ProductionItem(procHead, list, list.size(), numOfProd++));
			if (list.empty()) {//如果是空产生式，标记一下
				_nonterminalNullable.find(procHead)->second = true;}
			list.swap(empty_list);//清空当前list
			empty_list.clear();
			current_word = "";//清空当前单词
			state = 0;//回到读产生式左部状态
			break;
		case 4://读取语义动作
			read_one_char();
			if (_peek == '}' && braceMatch == 1) {//如果当前语义动作已经读完了
				braceMatch--;
				_productionAction.insert(make_pair(numOfProd, current_word));//按产生式号存储语义动作
				current_word = "";//清空当前单词
				state = 1;//回到读产生式右部状态
			}
			else {//没有读完
				current_word.operator+=(_peek);
				//处理多重花括号
				if (_peek == '{') { braceMatch++; }
				else if (_peek == '}') {braceMatch--;}
			}
			break;
		default:cout << "[seuYacc:read_file.cpp]read_production: unreachable state!" << endl;return false;break;
		}
	}
	// 下面进行空产生式的拓展
	// 处理非终结符表（得到所有可能的空产生式）
	bool continueFlag = true;//标记当前循环是否有新的空产生式产生
	while (continueFlag) {
		continueFlag = false;
		for (auto& X : _nonterminalNullable) {//遍历非终结符表
			if (X.second == true) continue;//如果以该终结符为左部的产生式可以是空产生式，跳过
			else {
				// 否则查看所有以当前非终结符为左部的产生式
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

// 翻译语义动作
bool SeuYacc::translate_action()
{
	for (auto& current_action : _productionAction) {// 遍历语义动作表
		string old_action = current_action.second;//原来的语义动作
		string action_translated;//翻译好的语义动作
		unsigned int cur_index = 0, index_end = old_action.length();
		while (cur_index != index_end) {//顺序查看语义动作里面每个字符
			if ((old_action[cur_index] == '$'&& old_action[cur_index+1]=='$')||(old_action[cur_index] == '$'&& isdigit(old_action[cur_index+1]))) {//如果是以$开头的话,需要做变量替换
				cur_index++;
				if (old_action[cur_index] == '$') {// 如果是 $$，则是产生式头
					cur_index+=2; // skip dot
					string strAttr;
					while (isalpha(old_action[cur_index])) {
						strAttr += old_action[cur_index];
						cur_index++;
					}
					action_translated += "reduceHead[\"" + strAttr + "\"]";
				}
				else if (isdigit(old_action[cur_index])) {// 如果是“$1”这样的类型的话，那么首先把数字n存到pos中，然后跳过点
					int pos = old_action[cur_index] - '0';
					cur_index++;
					while (isdigit(old_action[cur_index])) {// 读取变量名
						pos = pos * 10 + (old_action[cur_index] - '0');
						cur_index++;
					}
					cur_index++; // skip dot
					string strAttr;
					while (isalpha(old_action[cur_index])) {//找到属性值
						strAttr += old_action[cur_index];
						cur_index++;
					}
					if (strAttr == "width" || strAttr == "lexval") {// 如果属性值为“width”或者“lexval”的话，需要处理一下，要把字符串转化为int型的变量
						// atoi（）将字符串转化为int 
						// 栈中第 [栈的大小-产生式长度+数字n]个元素
						/*
						   * 如X->A+B {$$.lexval=$1.lexval+$2.lexval}
						   * 那么读到$1.lexval时，这样翻译：atoi(stack[stackSize-3+1].map["lexval"].c_str())
						*/
						action_translated += "atoi(Stack[stackSize - " + to_string(_productionVector[current_action.first]._bodyLength)+ " + " + to_string(pos) + "]._map[\"" + strAttr + "\"].c_str())";
					}
					else {// 不然的话直接借助栈进行处理// 找到栈中对应变量的属性值
						action_translated += "Stack[stackSize - " + to_string(_productionVector[current_action.first]._bodyLength) + " + " + to_string(pos) + "]._map[\"" + strAttr + "\"]";
					}
				}
				continue;
			}
			else if (old_action[cur_index] == ';') {//按行翻译
				action_translated += ";\n";
				cur_index++;
			}
			else if (old_action[cur_index] == '|'&& old_action[cur_index+1] == '|') {//把或变成加
				action_translated += " + ";
				cur_index+=2;
			}
			/*else if (old_action[cur_index] == '\n')
			{
				action_translated += ";\n";
				cur_index++;
			}*/
			else {//不需翻译的直接输出即可
				action_translated += old_action[cur_index];
				cur_index++;
			}
		}
		current_action.second = action_translated;
	}
	return true;
}

// 输出翻译后的语义动作到文件
// input: 输入文件名
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
	for (unsigned int index = 0; index < _productionAction.size(); ++index) {//遍历每个产生式对应的语义动作进行输出
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



/* 四个读文件的辅助函数 */
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




