import instruction_set as IS
I_op = ["001000","001001","001100","001101","001110","001111","100000","100100","100001","100101","101000","101001","100011","101011","000100","000101","000001","000111","000110","000001","000001","000001","001010","001011"]
J_op = ["000010","000011"]
R_funct = ["100000","100001","100010","100011","100100","011000","011001","011010","011011","010000","010010","010001","010011","000sel","000sel","100101","100110","100111","101010","101011","000000","000010","000011","000100","000110","000111","001000","001001","001101","001100","011000"]
def opGen(I_op,J_op):
    op = dict()
    for item in IS.R_Instruction:
        if item in ["mfc0","mtc0","eret"]:
            op[item] = "010000"
        else:
            op[item]="000000"
    for i in range(len(IS.I_Instruction)):
        op[IS.I_Instruction[i]] = I_op[i]
    for i in range(len(IS.J_Instruction)):
        op[IS.J_Instruction[i]] = J_op[i]
    return op

def functGen(R_funct):
    funct = dict()
    for i in range(len(IS.R_Instruction)):
        if IS.R_Instruction[i] in ["mfc0","mtc0"]:
            continue
        else:
            funct[IS.R_Instruction[i]] = R_funct[i]
    return funct

# op = opGen(I_op,J_op)
# print(op)
funct = functGen(R_funct)
print(funct)