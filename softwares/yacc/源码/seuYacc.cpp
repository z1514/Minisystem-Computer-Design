#pragma once
#include "seuYacc.h"

SeuYacc::SeuYacc(const string grammerFile, const string parsingFile) {
	if (!read_grammar_file(grammerFile)) {cout << "[seuYacc:seuYacc.cpp]SeuYacc: read grammar file failed!" << endl; }
	else {
		if (!init_lr1_dfa()) {cout << "[seuYacc:seuYacc.cpp]SeuYacc: init transtion failed!" << endl;}
		else {
			construct_lr1_table();
			output_table();
			cout << "........." << endl;
		}
	}
}