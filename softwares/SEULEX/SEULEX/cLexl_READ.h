#pragma once
#include<string>
#include<iostream>
#include<fstream>
#include"SEULEX_structs.h"
using namespace std;

vector<string> separate(const string& a, const string& s);
void clean(string& a);
void cLexl_read(string filename,
	vector<string>& supDef, map<string, string>& head,
	vector<Rules>& rules, vector<string>& functions);