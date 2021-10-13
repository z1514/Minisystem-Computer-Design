names = ["zero","at","v0","v1","a0","a1","a2","a3","t0","t1","t2","t3","t4","t5","t6","t7",
         "s0","s1","s2","s3","s4","s5","s6","s7","t8","t9","k0","k1","gp","sp","fps8","ra"]
def initRegister(num,names=[]):
    registers = dict()
    for i in range(len(names)):
        if names[i] == "fps8":
            registers["$fp"]=30
            registers["$s8"]=30
            continue
        registers["$"+names[i]] = i
    for i in range(32):
        registers["$"+str(i)] = i
    return registers

#op = initRegister(32,names)
#print(op)
