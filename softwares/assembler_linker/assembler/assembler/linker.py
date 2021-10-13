from assembler import Assembler

class Section:
    header = 0
    length = 0
    name = ""
    type = ""
    def __init__(self,header,length,name,type):
        self.header = header
        self.length = length
        self.name = name
        self.type = type
class Section_table:
    header = 0
    num = 0
    modules = dict()
    def __init__(self):
        self.header = 0
        self.num = 0
        self.modules  = dict()
    def add(self,length,name,type):
        sec = Section(self.header,length,name,type)
        self.header+=length
        self.modules[name] = sec

class Linker:
    main_file = ""
    linked_file=""
    U=[]
    D=[]
    E=[]
    data_section_table = Section_table()
    code_sectopn_table = Section_table()
    linkable=False
    def __init__(self,file_name_1,file_name_2):
        self.main_file=file_name_1
        self.linked_file = file_name_2
        self.ass1 = Assembler(file_name_1)
        self.ass2 = Assembler(file_name_2)
    def pre_check(self):
        self.E.append(self.main_file)
        self.ass1.pre_ass()
        self.ass1.ass()
        if len(self.ass1.find_unsolved_symbol()) == 0:
            self.ass1.output()
            print("无需链接，直接汇编生成可执行文件")
            self.linkable=True
            return
        for item in self.ass1.find_unsolved_symbol():
            self.U.append(item)
        for item in self.ass1.solved_symbol_table:
            self.D.append(item)
        self.E.append(self.linked_file)
        if len(self.ass2.find_unsolved_symbol()) !=0:
            print("链接文件中出现未定义的项,不符合约定,链接失败")
            return
        for item in self.ass2.solved_symbol_table:
            self.D.append(item)
        for item in self.U:
            if item not in self.D:
                print("链接过程中发现没有定义的全局变量,链接失败")
                return
        print("符号解析结束,未发现未定义符号,可以进行链接")
        self.linkable = True
    def linkE(self):
        if self.linkable == False:
            print("需要进行符号解析")
        w = open("mid.ast","w")
        w.write(".data\n")
        data = 0
        text = 0
        datas = []
        codes = []
        for i in range(len(self.ass1.codes)):
            if ".data" in self.ass1.codes[i]:
                data = i
            if ".code" in self.ass1.codes[i]:
                code = i
        for j in range(data+1,code):
            datas.append(self.ass1.codes[j])
        for j in range(code+1,len(self.ass1.codes)):
            codes.append(self.ass1.codes[j])
        for i in range(len(self.ass2.codes)):
            if ".data" in self.ass2.codes[i]:
                data = i
            if ".code" in self.ass2.codes[i]:
                code = i
        for j in range(data+1,code):
            datas.append(self.ass2.codes[j])
        for j in range(code+1,len(self.ass2.codes)):
            codes.append(self.ass2.codes[j])
        for item in datas:
            w.write(item+"\n")
        w.write(".text\n")
        for item in codes:
            w.write(item+"\n")
        w.close()
        result = Assembler("mid.ast")
        result.pre_ass()
        result.ass()
        result.output()
        print("代码生成结束")
    def linkH(self):
        if self.linkable == False:
            print("需要进行符号解析")
        code = 0
        data = 0
        for i in range(len(self.ass1.codes)):
            if ".data" in self.ass1.codes[i]:
                data = i
            if ".code" in self.ass1.codes[i]:
                code = i
        self.data_section_table.add(len(self.ass1.data_smooth()),"ass1.data","data")
        self.code_sectopn_table.add((len(self.ass1.codes)-code-1)*4,"ass1.code","code")
        for i in range(len(self.ass2.codes)):
            if ".data" in self.ass2.codes[i]:
                data = i
            if ".code" in self.ass2.codes[i]:
                code = i
        self.data_section_table.add(len(self.ass2.data_smooth()), "ass2.data", "data")
        self.code_sectopn_table.add((len(self.ass2.codes)-code-1)*4, "ass2.code", "code")
def main():
    l = Linker("test1.asm","test2.asm")
    l.pre_check()
main()
