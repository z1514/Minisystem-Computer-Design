#pragma once
#include <iostream>
#include "seuYacc.h"
#include <string>
using namespace std;

int main()
{
	string yacc_file = "Cminus.y";
	cout << "testing..." << endl;
	SeuYacc yacc("Cminus.y", "yacc.cpp");
	
	return 0;
}