R_Instruction = ["add","addu","sub","subu","and","mult","multu","div","divu","mfhi","mflo","mthi","mtlo","mfc0","mtc0","or","xor",
                 "nor","slt","sltu","sll","srl","sra","sllv","srlv","srav","jr","jalr","break","syscall","eret"]
I_Instruction = ["addi","addiu","andi","ori","xori","lui","lb","lbu","lh","lhu","sb","sh","lw","sw","beq","bne","bgez","bgtz","blez","bltz",
                 "bgezal","bltzal","slti","sltiu"]
J_Instruction = ["j","jal"]
Macro_Instruction = ["push","pop","jle","jl","jg","jge"]
Op_three_Instruction=["add","addu","sub","subu","and","mfc0","mtc0","or","xor",
                 "nor","slt","sltu","sll","srl","sra","sllv","srlv","srav","addi","addiu","andi","ori","xori","beq","bne","slti","sltiu","jg","jle","jl","jge"]
Op_two_Instruction=["mult","multu","div","divu","jalr","lui","lb","lbu","lh","lhu","sb","sh","lw","sw","bgez","bgtz","blez","bltz",
                 "bgezal","bltzal"]
Op_one_Instruction=["j","jal","jr","mfhi","mflo","mthi","mtlo","push","pop"]
Op_no_Instruction=["break","syscall","eret"]

# op_dict = dict()
# funct_dict=dict()