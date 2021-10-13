import re
import basic_data_sturcture as bs
import numpy as np
# result = re.search(r'^(?P<label>[a-zA-Z][a-zA-Z0-9]*:)?\s*(?P<ins>\S+)\s+(?P<op_1>\S+)\s*',"addiu $t2,$t8,0")
# print(result)
# print(result.group(1))
# print(result.group(2))
# print(result.group(3))

# a = 100
# b = bin(a).replace("0b","")
# print(b)
# c = np.uint16(int(-1))
# print(c)
# print(type(int(c)))
# print(type(int("-123")))
"bne的机器码问题"

a = hex(int("00010000",2)).replace('0x','')
print(a)
s = re.search(bs.re_patterns["section"],".text 4",re.I) is not None
print(s)

a = 20&0b1111
print(a)