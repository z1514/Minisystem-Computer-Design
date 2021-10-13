#pragma once
#include"SEULEX_structs.h"
using namespace std;

void nfa_to_dfa(NFA nfa, DFA& dfa);//NFA转化为DFA

void dfa_mini(DFA dfa, DFA& final_dfa);//DFA最小化