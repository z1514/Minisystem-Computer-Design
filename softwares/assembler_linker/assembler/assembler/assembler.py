import instruction_set as Is
import basic_data_sturcture as bs
import re
from dataOp import *
import sys
class Assembler:
    R = Is.R_Instruction
    I = Is.I_Instruction
    J = Is.J_Instruction
    Macro = Is.Macro_Instruction
    Registers = bs.registers
    Op = bs.op
    Funct = bs.funct
    vars = dict()
    labels = dict()
    sourceFile = ""
    code_targetFile = ""
    data_targetFile = ""
    codes = []
    solved_symbol_table=dict()
    unsolved_symbol_table = dict()
    solved_symbol_type=dict()
    sectionType = "init"
    lineNum = 0
    dataAddr = 0
    codeAddr = 0
    re_patterns = dict()
    error_list=[]
    data_list=[]
    code_list=[]
    data_result=[]
    code_result=[]
    def __init__(self,sourceFile,code_targetFile="",data_targetFile=""):
        if sourceFile == "":
            print("wrong")
        else:
            self.sourceFile = sourceFile
        if code_targetFile=="":
            self.code_targetFile="ram"
        if data_targetFile == "":
            self.data_targetFile="rom"
        w = open(sourceFile,"r",encoding="utf-8")
        self.codes = w.readlines()
        self.re_patterns = bs.re_patterns
    def pre_ass(self):
        for i in range(len(self.codes)):
            self.codes[i] = self.codes[i].lstrip().rstrip("\n").lower()
            if '#' in self.codes[i]:
                self.codes[i] = self.codes[i].split('#')[0].rstrip(' ')
        while "" in self.codes:
            self.codes.remove("")
        for i in range(len(self.codes)):
            self.codes[i] = ' '.join(self.codes[i].split())
            print(i)
        print("pre_ass finished")

    def ass(self):#
        print("ass测试开始")
        self.lineNum=0
        for line in self.codes:
            self.lineNum+=1
            print(line)
            print(self.lineNum,end=" ")
            if self.sectionType=='init':
                print("init",end=" ")
                print(line)
                if re.search(self.re_patterns["section"], line, re.I) is not None:
                    self.deal_section(line)
                else:
                    print("There is no section in ass")
                    return
            elif self.sectionType=='data':
                print("data",end=" ")
                print(line)
                #print(self.re_patterns["section"])
                #print(re.search(self.re_patterns["section"],line, re.I) is not None,end=" ")
                if re.search(self.re_patterns["section"], line, re.I) is not None:
                    r = re.search(self.re_patterns["section"], line, re.I)
                    sec = r.group("sec")
                    #print(sec," ")
                    if sec is None or (sec!="text" and sec!="data"):
                        print("sec change is wrong in data section in ass")
                    else:
                        self.deal_section(line)
                elif re.search(self.re_patterns["data"], line, re.I) is not None:
                    self.deal_data(line)
            elif self.sectionType=='text':
                print("text",end=" ")
                print(line)
                if re.search(self.re_patterns["section"], line, re.I):
                    r = re.search(self.re_patterns["section"], line, re.I)
                    sec = r.group("sec")
                    if sec is None or sec!="text":
                        print("sec change is wrong in data section in ass")
                    else:
                        self.deal_section(line)
                elif re.search(self.re_patterns["only_label"], line, re.I) is not None:
                    result = re.search(self.re_patterns["only_label"], line, re.I)
                    label = result.group("label")
                    #print(label)
                    #print("only label")
                    if label is None:#print("label is none in ass")
                        pass
                    else:
                        print("has a label "+label)
                        if label[:-1] in self.solved_symbol_table:
                            print("The label in the code is defined in ass")
                            return
                        else:
                            self.solved_symbol_table[label[:-1]]=self.codeAddr
                            self.solved_symbol_type[label[:-1]] = "text"
                elif re.search(self.re_patterns["three_op"], line, re.I) is not None:
                    self.deal_three_op(line)
                elif re.search(self.re_patterns["two_op"], line, re.I) is not None:
                    self.deal_two_op(line)
                elif re.search(self.re_patterns["one_op"], line, re.I) is not None:
                    self.deal_one_op(line)
                elif re.search(self.re_patterns["no_op"], line, re.I) is not None:
                    self.deal_no_op(line)
            else:
                print("Outside the possible sections in ass")
                return
        self.deal_unsolved_symbol()
        print("ass测试结束")

    def output(self):
        w1 = open("ins.t","w")
        w2 = open("data.t","w")#16384
        m = 0
        code = []
        for i in self.code_list:
            if 'all' in i.code:
                print(str(i.line))
                print(str(i.code['all']))
                #w1.write(str(i.code['all'])+'\n')
                code.append(str(i.code['all']))
                if(len(str(i.code['all']))!=32):
                    print(i.lineNum)
                    print(i.line)
            else:
                print("error")
                print(i.line)
                # print(i.line)
                # print(i.code)
                # print(i.lineNum)
                # print("是空的")
        codes = self.div_seg(code)
        s = 0
        for i in range(4):
            s=0
            w = open("prgmip32_"+str(i)+".coe","w")
            w.write("memory_initialization_radix = 16;\n")
            s+=1
            w.write("memory_initialization_vector =\n")
            s+=1
            r = codes[i]
            if len(r)>16382:
                print("Too long a file is ")
                return
            for j in r:
                w.write(bdataToHex(j)+','+"\n")
                s+=1
            while s<16383:
                w.write("00,\n")
                s+=1
            w.write("00")
            w.close()

        #print(self.data_result)
        #print("#################")
        for i in self.data_list:
            print(i.data)
            for j in i.data:
                self.data_result.append(j)
                #print(i.data)
        print(self.data_result,"data_result")
        m = 0
        #print(len(self.data_list))
        #print("code")
        data1 = []
        data2 = []
        data3 = []
        data4 = []
        for i in range(len(self.data_result)):
            if i%4==0:
                data1.append(hdataToHex(self.data_result[i]))
            elif i%4==1:
                data2.append(hdataToHex(self.data_result[i]))
            elif i%4==2:
                data3.append(hdataToHex(self.data_result[i]))
            elif i%4==3:
                data4.append(hdataToHex(self.data_result[i]))
        while len(data1) < 16382:
            data1.append("00")
        while len(data2) < 16382:
            data2.append("00")
        while len(data3) < 16382:
            data3.append("00")
        while len(data4) < 16382:
            data4.append("00")
        datas = []
        datas.append(data1)
        datas.append(data2)
        datas.append(data3)
        datas.append(data4)
        for i in range(len(datas)):
            w = open("dmem32_" + str(i) + ".coe", "w")
            w.write("memory_initialization_radix = 16;\n")
            w.write("memory_initialization_vector =\n")
            r = datas[i]
            for j in range(len(r)-1):
                w.write(r[j]+",\n")
            w.write("00,")
            w.close()

    def deal_section(self,line):
        result = re.search(self.re_patterns["section"], line, re.I)
        section = result.group("sec")
        addr = result.group("addr")
        if section=='data':
            self.sectionType='data'
            if addr is not None:
                if isDataAddr(addr):
                    if addr.startswith("0x") or addr.startswith("0X"):
                        d_addr = int(addr,16)
                    else:
                        d_addr = int(addr)
                    data = bs.Data()
                    for i in range(d_addr-self.dataAddr):#此处的修改不知道是否ok#self.data_result.append("00")
                        data.data.append("0x00")
                    self.data_list.append(data)
                    new_data = bs.Data()
                    new_data.lineNum=self.lineNum
                    new_data.line=line
                    new_data.address=d_addr
                    print("new_data",new_data.data)
                    self.data_list.append(new_data)
                    self.dataAddr = d_addr
                    print(self.dataAddr)
                else:
                    print("The dataAddr is not right in deal_section")
                    return
            else:
                new_data = bs.Data()
                new_data.lineNum = self.lineNum
                new_data.line = line
                new_data.address = 0
                print("new_data", new_data.data)
                self.data_list.append(new_data)
        elif section=='text':
            self.sectionType='text'
            if addr is not None:
                if isCodeAddr(addr):
                    if addr.startswith("0x") or addr.startswith("0X"):
                        c_addr = int(addr,16)
                    else:
                        c_addr = int(addr)
                    for i in range((c_addr-self.codeAddr)//4):#此处的修改存在疑问，希望不要出问题
                        #self.code_result.append("00000000")
                        code = bs.Code()
                        code.code["all"] = "00000000000000000000000000000000"
                        self.code_list.append(code)
                    new_code = bs.Code()
                    new_code.lineNum=self.lineNum
                    new_code.line=line
                    new_code.address = c_addr
                    new_code.code=[]
                    self.codeAddr = c_addr
                    self.code_list.append(new_code)
                else:
                    print("The codeAddr is not right in deal_section")
                    return
            else:
                new_code = bs.Code()
                new_code.lineNum = self.lineNum
                new_code.line = line
                new_code.address = 0
                new_code.code=[]
                self.code_list.append(new_code)
        else:
            print("Unknwon section in deal_section")
            return

    def deal_data(self,line):
        result = re.search(self.re_patterns["data"], line, re.I)
        var = result.group("var")
        type = result.group("type")
        content = result.group("content")
        content = content.replace(" ","")
        data_list = content.split(',')
        print(data_list,end=" ")
        print(type,end=" ")
        print(var)
        if type is None or content is None:
            print("data loss in deal_data")
            return
        elif var is not None:
            data = bs.Data()
            data.line = line
            data.lineNum = self.lineNum
            data.address = self.dataAddr
            offset = 0
            if var[:-1] in self.solved_symbol_table:
                print("redifined symbol"+ var[:-1] +"in deal data")
                return
            else:
                self.solved_symbol_table[var[:-1]] = self.dataAddr
            if type not in ["byte", "half", "word"]:
                print("Type information is lost in deal_data")
                return
            self.solved_symbol_type[var[:-1]] = type
            for item in data_list:
                if ":" in item:
                    deal_part = item.split(":")
                    if isData(deal_part[0]) and deal_part[1].isdigit():
                        for i in range(int(deal_part[1])):
                            if type == 'byte':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                offset += 1
                            elif type == 'half':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 8) & 0b11111111))
                                offset += 2
                            elif type == 'word':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 8) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 16) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 24) & 0b11111111))
                                offset += 4
                    else:
                        print("data format : is wrong in deal_data")
                        return
                else:
                    deal_part = item
                    if isData(deal_part):
                        if type == 'byte':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            offset += 1
                        elif type=='half':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part)>>8)&0b11111111))
                            offset += 2
                        elif type=='word':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 8) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 16) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 24) & 0b11111111))
                            offset += 4
                    else:
                        print("data format : is wrong in deal_data")
                        return
            self.data_list.append(data)
            print("data", data.data)
        else:
            data = bs.Data()
            data.line=line
            data.lineNum=self.lineNum
            data.address = self.dataAddr
            offset = 0
            if type not in ["byte", "half", "word"]:
                print("Type information is lost in deal_data")
                return
            for item in data_list:
                if ":" in item:
                    deal_part = item.split(":")
                    if isData(deal_part[0]) and deal_part[1].isdigit():
                        for i in range(int(deal_part[1])):
                            if type == 'byte':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                offset += 1
                            elif type == 'half':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 8) & 0b11111111))
                                offset += 2
                            elif type == 'word':
                                data.data.append(hex(dataToNumT(deal_part[0]) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 8) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 16) & 0b11111111))
                                data.data.append(hex((dataToNumT(deal_part[0]) >> 24) & 0b11111111))
                                offset += 4
                    else:
                        print("data format : is wrong in deal_data")
                        return
                else:
                    deal_part = item
                    if isData(deal_part):
                        if type == 'byte':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            offset += 1
                        elif type == 'half':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 8) & 0b11111111))
                            offset += 2
                        elif type == 'word':
                            data.data.append(hex(dataToNumT(deal_part) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 8) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 16) & 0b11111111))
                            data.data.append(hex((dataToNumT(deal_part) >> 24) & 0b11111111))
                            offset += 4
                    else:
                        print("data format : is wrong in deal_data")
                        return
            self.data_list.append(data)
            print("data", data.data)
        self.dataAddr+=offset
    def deal_macro(self,line,result,num):
        codes=[]
        if num==3:
            ins = result.group("ins")
            op_1 = result.group("op_1")
            op_2 = result.group("op_2")
            op_3 = result.group("op_3")
            if ins == "jg":
                codes.append("slt $1,"+op_2+','+op_1)
                codes.append("bne $1,$0,"+op_3)
            elif ins =='jle':
                codes.append("slt $1,"+op_2+','+op_1)
                codes.append("beq $1,$0," + op_3)
            elif ins=='jl':
                codes.append("slt $1,"+op_1+','+op_2)
                codes.append("bne $1,$0,"+op_3)
            elif ins=='jge':
                codes.append("slt $1,"+op_1+','+op_2)
                codes.append("beq $1,$0," + op_3)
            else:
                print("The oprands are wrong number in macro")
                return
            for item in codes:
                self.deal_three_op(item)
        elif num==1:
            ins = result.group("ins")
            op_1 = result.group("op_1")
            if ins =='push':
                codes.append("addi $sp,$sp,-4")
                codes.append("sw "+op_1+",0($sp)")
                self.deal_three_op(codes[0])
                self.deal_two_op(codes[1])
            elif ins=='pop':
                codes.append("lw "+op_1+",0($sp)")
                codes.append("addi $sp,$sp,4")
                self.deal_two_op(codes[0])
                self.deal_three_op(codes[1])
            else:
                print("The oprands are wrong number in macro")
                return
            # for item in codes:
            #     self.deal_one_op(item)
        else:
            print("The oprands are wrong number in macro")
            return
        print("处理结束")
    #三操作数的处理:
    """R型:
    ADD rd, rs, rt 类的结构 
    SLL rd, rt, shamt类的结构 三个
    SLLV rd, rt, rs类的结构
    MTC0 rt, rd, sel的结构
    I型:
    ADDI rt, rs, immediate
    SLTIU rt, rs, immediate
    BNE rt, rs, immediate
    J型:无
    """
    def deal_three_op(self,line):
        result = re.search(self.re_patterns["three_op"], line, re.I)
        label = result.group("label")
        ins = result.group("ins")
        op_1 = result.group("op_1")
        op_2 = result.group("op_2")
        op_3 = result.group("op_3")
        if label is None:
            pass
        else:
            print(label)
            if label[:-1] in self.solved_symbol_table:
                print("The label in the code is defined in ass")
                return
            else:
                self.solved_symbol_table[label[:-1]] = self.codeAddr
                self.solved_symbol_type[label[:-1]] = "text"
        if ins is None or op_1 is None or op_2 is None or op_3 is None:
            print("The insturction is lost in deal_three_op")
            return
        elif ins not in Is.Op_three_Instruction:
            print(ins+" doesn't have three op")
            return
        elif ins in Is.Macro_Instruction:
            self.deal_macro(line,result,3)
        elif ins in Is.R_Instruction:
            code = bs.Code()
            code.line=line
            code.lineNum=self.lineNum
            code.address=self.codeAddr
            code.code["op"]=(bs.op[ins])
            if ins not in ["mtc0","mfc0"]:
                code.code["funct"] = self.Funct[ins]
            if ins in ["sll","srl","sra"]:
                code.code["rs"] = "00000"
                if op_2 in self.Registers and op_1 in self.Registers:
                    code.code["rt"] = self.Registers[op_2]
                    code.code["rd"] = self.Registers[op_1]
                else:
                    print("Unknown register in 3 op part")
                    return
                if isShamt(op_3):
                    op_3 = str(dataToNumT(op_3) & 0b11111)  # da = str(data & 0b11111)
                    r = dataToShat(op_3)
                    code.code["shamt"] = r
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                                   code.code["shamt"] + code.code["funct"]
                else:
                    code.code["shamt"] = "00000"
                    if op_3 not in self.unsolved_symbol_table:
                        self.unsolved_symbol_table[op_3]=[]
                    self.unsolved_symbol_table[op_3].append([self.lineNum,self.codeAddr,len(self.code_list),"shamt"])
                self.code_list.append(code)
                self.codeAddr+=4
            elif ins in ["mtc0","mfc0"]:
                if op_2 in self.Registers and op_1 in self.Registers:
                    code.code["rt"] = self.Registers[op_1]
                    code.code["rd"] = self.Registers[op_2]
                    code.code["shamt"] = "00000"
                    if ins =="mfc0":
                        code.code["rs"]="00000"
                    else:
                        code.code["rs"] = "00100"
                else:
                    print("Unknown register in 3 op part")
                    return
                if isSel(op_3):
                    num = dataToSel(op_3)
                    code.code["funct"] = "000"+num
                else:
                    print("sel is not right in 3 op")
                    return
                code.code["all"] = code.code["op"]+code.code["rs"]+code.code["rt"]+code.code["rd"]+code.code["shamt"]+code.code["funct"]
                self.code_list.append(code)
                self.codeAddr+=4
            else:
                if ins in ["sllv","srlv","srav"]:#SLLV rd, rt, rs
                    code.code["rt"] = self.Registers[op_2]
                    code.code["rd"] = self.Registers[op_1]
                    code.code["rs"] = self.Registers[op_3]
                    code.code["shamt"] = "00000"
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                                       code.code["shamt"] + code.code["funct"]
                    self.code_list.append(code)
                    self.codeAddr += 4
                else:#ADD rd, rs, rt
                    code.code["rs"] = self.Registers[op_2]
                    code.code["rd"] = self.Registers[op_1]
                    code.code["rt"] = self.Registers[op_3]
                    code.code["shamt"] = "00000"
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                                       code.code["shamt"] + code.code["funct"]
                    self.code_list.append(code)
                    self.codeAddr += 4
        elif ins in Is.I_Instruction:
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])#ADDIU rt, rs, immediate
            if op_1 in self.Registers and op_2 in self.Registers:
                if ins in ["bne","beq"]:
                    code.code["rt"] = self.Registers[op_2]
                    code.code["rs"] = self.Registers[op_1]
                    if isBOffset(op_3):
                        op_3 = str(
                            dataToNumT(op_3) & 0b111111111111111111)  # da = str((data-i[1]-4)&0b111111111111111111)
                        code.code["offset"] = dataToBOffset(op_3)
                        code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["offset"]
                    else:
                        code.code["offset"] = "0000000000000000"
                        if op_3 not in self.unsolved_symbol_table:
                            self.unsolved_symbol_table[op_3] = []
                        self.unsolved_symbol_table[op_3].append([self.lineNum, self.codeAddr, len(self.code_list),"BOffset"])
                else:
                    code.code["rt"] = self.Registers[op_1]
                    code.code["rs"] = self.Registers[op_2]
                    if isImmediate(op_3):
                        op_3 = str(dataToNumT(op_3) & 0b1111111111111111)  # da = str(data & 0b1111111111111111)
                        code.code["immediate"] = dataToImmediate(op_3)
                        code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] +code.code["immediate"]
                    else:
                        code.code["immediate"] = "0000000000000000"
                        if op_3 not in self.unsolved_symbol_table:
                            self.unsolved_symbol_table[op_3]=[]
                        self.unsolved_symbol_table[op_3].append([self.lineNum,self.codeAddr,len(self.code_list),"immediate"])
                self.code_list.append(code)
                self.codeAddr += 4
        elif ins in Is.J_Instruction:
            print("No such a insturction in IS in deal_three_op")
            return
        else:
            print("No such a insturction in IS in deal_three_op")
        print("处理结束")

    def deal_two_op(self,line):
        result = re.search(self.re_patterns["two_op"], line, re.I)
        label = result.group("label")
        ins = result.group("ins")
        op_1 = result.group("op_1")
        op_2 = result.group("op_2")
        if label is None:
            pass#print("label is none in ass in 3")
        else:
            print(label)
            if label[:-1] in self.solved_symbol_table:
                print("The label in the code is defined in ass")
                return
            else:
                self.solved_symbol_table[label[:-1]] = self.codeAddr
                self.solved_symbol_type[label[:-1]] = "text"
        if ins is None or op_1 is None or op_2 is None:
            print("The insturction is lost in deal_two_op")
            return
        elif ins not in Is.Op_two_Instruction:
            print(ins + " doesn't have two op")
            return
        elif ins in Is.Macro_Instruction:
            print("No macro ins has two ops in deal_two_op")
            return
        elif ins in Is.R_Instruction:
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])
            #JALR rd,rs MULT rs, rt
            if op_1 in self.Registers and op_2 in self.Registers:
                if ins =='jalr':
                    code.code["rd"] = self.Registers[op_1]
                    code.code["rs"] = self.Registers[op_2]
                    code.code["rt"] = "00000"
                    code.code["shamt"] = "00000"
                    code.code["funct"] = self.Funct[ins]
                else:
                    code.code["rs"] = self.Registers[op_1]
                    code.code["rt"]  =self.Registers[op_2]
                    code.code["rd"] = "00000"
                    code.code["shamt"] = "00000"
                    code.code["funct"] = self.Funct[ins]
                code.code["all"] = code.code["op"]+code.code["rs"]+code.code["rt"]+code.code["rd"]+code.code["shamt"]+code.code["funct"]
                self.code_list.append(code)
                self.codeAddr+=4
            else:
                print("Outside the registers in deal_two_op")
                return
        elif ins in Is.I_Instruction:
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])
            if ins in ["lb","lbu","lh","lhu","sb","sh","lw","sw"]:
                ops = op_2.split("(")
                if len(ops) != 2:
                    print("offset(re) is not right in two ops")
                    return
                else:
                    op_2 = ops[1][:-1].lstrip()
                    op_3 = ops[0]
                #LW rt, offset(rs)
                if op_1 in self.Registers and op_2 in self.Registers:
                    code.code["rt"] = self.Registers[op_1]
                    code.code["rs"] = self.Registers[op_2]
                else:
                    print("Unknwo registers in two op")
                    return
                if isOffset(op_3):
                    op_3 = str(dataToNumT(op_3) & 0b1111111111111111)
                    code.code["offset"] = dataToOffset(op_3)
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["offset"]
                else:
                    code.code["offset"] = "0000000000000000"
                    if op_3 not in self.unsolved_symbol_table:
                        self.unsolved_symbol_table[op_3]=[]
                    self.unsolved_symbol_table[op_3].append([self.lineNum, self.codeAddr, len(self.code_list),"offset"])
                self.code_list.append(code)
                self.codeAddr += 4
            elif ins=='lui':#LUI rt, immediate
                if op_1 in self.Registers:
                    code.code["rt"] = self.Registers[op_1]
                    code.code["rs"]="00000"
                else:
                    print("No such register in two_op")
                    return
                if isOffset(op_2):
                    op_2 = str(dataToNumT(op_2) & 0b1111111111111111)  # da = str(data & 0b1111111111111111)
                    code.code["offset"] = dataToOffset(op_2)
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["offset"]
                else:
                    code.code["offset"] = "0000000000000000"
                    self.unsolved_symbol_table[op_2].append([self.lineNum, self.codeAddr, len(self.code_list),"offset"])
                self.code_list.append(code)
                self.codeAddr += 4
            else:#BGEZ rs, immediate
                m = {"bgez":"00001",
                     "bgtz":"00000",
                     "blez":"00000",
                     "bltz":"00000",
                     "bgezal":"10001",
                     "bltzal":"10000"}
                if op_1 in self.Registers:
                    code.code["rs"] = self.Registers[op_1]
                    code.code["rt"] = m[ins]
                else:
                    print("No such register in two_op")
                    return
                if isBOffset(op_2):
                    op_2 = str(dataToNumT(op_2) & 0b111111111111111111)
                    code.code["offset"] = dataToBOffset(op_2)
                    code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["offset"]
                else:
                    code.code["offset"] = "0000000000000000"
                    if op_2 not in self.unsolved_symbol_table:
                        self.unsolved_symbol_table[op_2]=[]
                    self.unsolved_symbol_table[op_2].append([self.lineNum, self.codeAddr, len(self.code_list),"BOffset"])
                self.code_list.append(code)
                self.codeAddr += 4
        elif ins in Is.J_Instruction:
            print("No such a insturction in IS in deal_two_op")
            return
        else:
            print("No such a insturction in IS in deal_two_op")
        print("处理结束")
    def data_smooth(self):
        data = []
        # for i in self.data_result:
        #     data.append("0x00")
        for i in self.data_list:
            for j in i.data:
                #print(j)
                data.append(j)
        return data
    def deal_one_op(self,line):
        result = re.search(self.re_patterns["one_op"], line, re.I)
        label = result.group("label")
        ins = result.group("ins")
        op_1 = result.group("op_1")
        if label is None:
            pass#print("label is none in ass in 1")
        else:
            print(label)
            if label[:-1] in self.solved_symbol_table:
                print("The label in the code is defined in ass")
                return
            else:
                self.solved_symbol_table[label[:-1]] = self.codeAddr
                self.solved_symbol_type[label[:-1]] = "text"
        if ins is None or op_1 is None:
            print("The insturction is lost in deal_one_op")
            return
        elif ins not in Is.Op_one_Instruction:
            print(ins + " doesn't have one op")
            return
        elif ins in Is.Macro_Instruction:
            self.deal_macro(line,result,1)
        elif ins in Is.R_Instruction:#JR rs MFHI rd
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])
            code.code["funct"] = self.Funct[ins]
            code.code["shamt"] = "00000"
            if op_1 not in self.Registers:
                print("Not find op_1 register in deal_one_op")
                return
            if ins in ["mfhi","mflo"]:
                code.code["rd"] = self.Registers[op_1]
                code.code["rs"] = "00000"
                code.code["rt"] = "00000"
            else:
                code.code["rs"] = self.Registers[op_1]
                code.code["rd"] = "00000"
                code.code["rt"]="00000"
            code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                               code.code["shamt"] + code.code["funct"]
            self.code_list.append(code)
            self.codeAddr+=4
        elif ins in Is.I_Instruction:
            print("There is no such a ins in I_instruction in deal_one_op")
            return
        elif ins in Is.J_Instruction:#str = "{:b}".format(-10 & 0b11111)
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])
            if isAddr(op_1):
                op_1 = str(dataToNumT(
                    op_1) & 0b1111111111111111111111111111)  # da = str(data & 0b1111111111111111111111111111)
                code.code["address"] = dataToAddr(op_1)
                code.code["all"] = code.code["op"]+code.code["address"]
            else:
                code.code["address"] = "00000000000000000000000000"
                if op_1 not in self.unsolved_symbol_table:
                    self.unsolved_symbol_table[op_1] = []
                self.unsolved_symbol_table[op_1].append([self.lineNum, self.codeAddr, len(self.code_list),"address"])
            self.code_list.append(code)
            self.codeAddr += 4
        else:
            print("No such a insturction in IS in deal_no_op")
        print("处理结束")
    def deal_no_op(self,line):
        result = re.search(self.re_patterns["no_op"], line, re.I)
        label = result.group("label")
        ins = result.group("ins")
        if label is None:
            pass#print("label is none in ass in no")
        else:
            print(label)
            if label[:-1] in self.solved_symbol_table:
                print("The label in the code is defined in ass")
                return
            else:
                self.solved_symbol_table[label[:-1]] = self.codeAddr
                self.solved_symbol_type[label[:-1]] = "text"
        if ins is None:
            print("The insturction is lost in deal_no_op")
            return
        elif ins not in Is.Op_no_Instruction:
            print(ins + " doesn't have op")
            return
        elif ins in Is.Macro_Instruction:
            print("No macro ins has no ops in deal_no_op")
            return
        elif ins in Is.R_Instruction:
            code = bs.Code()
            code.line = line
            code.lineNum = self.lineNum
            code.address = self.codeAddr
            code.code["op"] = (bs.op[ins])
            code.code["funct"] = self.Funct[ins]
            if ins == "eret":
                code.code["code"] = "10000000000000000000"
                code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                                   code.code["shamt"] + code.code["funct"]
            else:
                code.code["code"] = "code"
                code.code["all"] = code.code["op"] + code.code["rs"] + code.code["rt"] + code.code["rd"] + \
                                   code.code["shamt"] + code.code["funct"]
            self.code_list.append(code)
            self.codeAddr+=4
        elif ins in Is.I_Instruction:
            print("No such a insturction in IS in deal_no_op")
            return
        elif ins in Is.J_Instruction:
            print("No such a insturction in IS in deal_no_op")
            return
        else:
            print("No such a insturction in IS in deal_no_op")
        print("处理结束")
    def div_seg(self,list):
        code1=[]
        code2=[]
        code3 = []
        code4 = []
        for i in list:
            code1.append(i[0:8])
            code2.append(i[8:16])
            code3.append(i[16:24])
            code4.append(i[24:32])
        codes = []
        codes.append(code1)
        codes.append(code2)
        codes.append(code3)
        codes.append(code4)
        return codes
    def find_unsolved_symbol(self):
        undifined = []
        for item in self.unsolved_symbol_table:
            if item not in self.solved_symbol_type:
                undifined.append(item)
                print(item)
        return undifined

    def deal_unsolved_symbol(self):#2 code addr 3 code_list
        print("Unsolved处理开始")
        for item in self.unsolved_symbol_table:#shamt BOffset offset immediate address
            if item not in self.solved_symbol_table:
                print(item)
                print("No such a symbol in deal_unsolved_table")
                #return
            else:
                addr = int(str(self.solved_symbol_table[item]))
                type = self.solved_symbol_type[item]
                datas = self.data_smooth()
                if type == 'byte':
                    print(item+" "+datas[addr])
                    data = dataToNumT(datas[addr])
                elif type=='half':
                    print(item+" "+datas[addr]+" "+datas[addr+1])
                    data = dataToNumT(datas[addr]) + (dataToNumT(datas[addr+1])<<8)
                elif type=="word":
                    print(item + " " + datas[addr] + " " + datas[addr+1] + " " + datas[addr+2] + " " + datas[addr+3])
                    data=dataToNumT(datas[addr]) + (dataToNumT(datas[addr+1])<<8)+(dataToNumT(datas[addr+2])<<16) + (dataToNumT(datas[addr+3])<<24)
                elif type=='text':
                    data = addr
                print(self.unsolved_symbol_table[item])
            for i in self.unsolved_symbol_table[item]:
                print(i)
                if i[3] == "shamt":
                    da = str(data & 0b11111)
                    if isShamt(da):
                        self.code_list[i[2]].code["shamt"] = dataToShat(da)
                        self.code_list[i[2]].code['all'] =self.code_list[i[2]].code["op"] + self.code_list[i[2]].code["rs"] + self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["rd"] + self.code_list[i[2]].code["shamt"] +self.code_list[i[2]].code["funct"]
                    else:
                        print("Shamt is not possibel here in unsolved")
                        return
                elif i[3] == "BOffset":
                    da = str((data-i[1]-4)&0b111111111111111111)
                    if isBOffset(da):
                        self.code_list[i[2]].code["offset"] = dataToBOffset(da)
                        self.code_list[i[2]].code['all'] =self.code_list[i[2]].code["op"] + self.code_list[i[2]].code["rs"] + self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["offset"]
                    else:
                        print("BOffset is not possibel here in unsolved")
                        return
                elif i[3] == "offset":
                    da = str(data & 0b1111111111111111)
                    if isOffset(da):
                        self.code_list[i[2]].code["offset"] = dataToOffset(da)
                        self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code["rs"] + \
                                                      self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["offset"]
                    else:
                        print("Offset is not possibel here in unsolved")
                        return
                elif i[3] == "immediate":
                    da = str(data & 0b1111111111111111)
                    if isImmediate(da):
                        self.code_list[i[2]].code["immediate"] = dataToImmediate(da)
                        self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code["rs"] + \
                                                      self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["immediate"]
                    else:
                        print("immediate is not possibel here in unsolved")
                        return
                elif i[3] == "address":
                    da = str(data & 0b1111111111111111111111111111)
                    if isAddr(da):
                        self.code_list[i[2]].code["address"] = dataToAddr(da)
                        self.code_list[i[2]].code["all"] = self.code_list[i[2]].code["op"]+self.code_list[i[2]].code["address"]
                    else:
                        print("address is not possibel here in unsolved")
                        return
                else:
                    print("Can't solve in deal_unsolved")
                    return
def main():
    # fileName = str(sys.argv[1])
    # if fileName is not None:
    #     ass = Assembler(fileName)
    # else:
    ass = Assembler("compiles/ASMcode.txt")
    ass.pre_ass()
    ass.ass()
    ass.data_smooth()
    ass.output()
main()


# def deal_unsolved_symbol(self):  # 2 code addr 3 code_list
#     print("Unsolved处理开始")
#     for item in self.unsolved_symbol_table:  # shamt BOffset offset immediate address
#         if item not in self.solved_symbol_table:
#             print("No such a symbol in deal_unsolved_table")
#             return
#         else:
#             addr = str(self.solved_symbol_table[item])
#             type = self.solved_symbol_type[item]
#             print(self.unsolved_symbol_table[item])
#         for i in self.unsolved_symbol_table[item]:
#             print(i)
#             if i[3] == "shamt":
#                 if isShamt(addr):
#                     self.code_list[i[2]].code["shamt"] = dataToShat(addr)
#                     self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code[
#                         "rs"] + self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["rd"] + \
#                                                        self.code_list[i[2]].code["shamt"] + self.code_list[i[2]].code[
#                                                            "funct"]
#                 else:
#                     print("Shamt is not possibel here in unsolved")
#                     return
#             elif i[3] == "BOffset":
#                 if isBOffset(addr):
#                     self.code_list[i[2]].code["offset"] = dataToBOffset(addr)
#                     self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code[
#                         "rs"] + self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code["offset"]
#                 else:
#                     print("BOffset is not possibel here in unsolved")
#                     return
#             elif i[3] == "offset":
#                 if isOffset(addr):
#                     self.code_list[i[2]].code["offset"] = dataToOffset(addr)
#                     self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code[
#                         "rs"] + \
#                                                        self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code[
#                                                            "offset"]
#                 else:
#                     print("Offset is not possibel here in unsolved")
#                     return
#             elif i[3] == "immediate":
#                 if isImmediate(addr):
#                     self.code_list[i[2]].code["immediate"] = dataToImmediate(addr)
#                     self.code_list[i[2]].code['all'] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code[
#                         "rs"] + \
#                                                        self.code_list[i[2]].code["rt"] + self.code_list[i[2]].code[
#                                                            "immediate"]
#                 else:
#                     print("immediate is not possibel here in unsolved")
#                     return
#             elif i[3] == "address":
#                 if isAddr(addr):
#                     self.code_list[i[2]].code["address"] = dataToAddr(addr)
#                     self.code_list[i[2]].code["all"] = self.code_list[i[2]].code["op"] + self.code_list[i[2]].code[
#                         "address"]
#                 else:
#                     print("address is not possibel here in unsolved")
#                     return
#             else:
#                 print("Can't solve in deal_unsolved")
#                 return
