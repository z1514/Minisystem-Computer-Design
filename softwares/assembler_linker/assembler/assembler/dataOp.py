import numpy as np

def isDataAddr(str_num):
    if str_num.startswith("0x") or str_num.startswith("0X"):
        for item in str_num[2:]:
            if item not in "0123456789abcdefANCDEF":
                print("Unknown string "+item+" in isDataAddr")
                return False
        return True
    elif str_num.isdigit():
        return True
    else:
        return False

def isData(str_num):
    if str_num.startswith("-"):
        return str_num[1:].isdigit()
    elif str_num.startswith("0x") or str_num.startswith("0X"):
        for item in str_num[2:]:
            if item not in "abcdefABCDEF1234567890":
                return False
        return True
    else:
        return str_num.isdigit()

def dataToNum(str_num):
    if isData(str_num):
        if str_num.startswith("0x") or str_num.startswith("0X"):
            return hex(int(str_num,16))
        else:
            return hex(int(str_num))
    else:
        print("It's not a data in dataToNum")
        return

def dataToNumT(str_num):
    if isData(str_num):
        if str_num.startswith("0x") or str_num.startswith("0X"):
            return int(str_num,16)
        else:
            return int(str_num)
    else:
        print("It's not a data in dataToNum")
        return

def isCodeAddr(str_num):
    if str_num.startswith("0x") or str_num.startswith("0X"):
        for item in str_num[2:]:
            if item not in "0123456789abcdefANCDEF":
                print("Unknown string "+item+" in isDataAddr")
                return False
        num = int(str_num,16)
        if num%4!=0:
            return False
        return True
    elif str_num.isdigit():
        num = int(str_num)
        if num % 4 != 0:
            return False
        return True
    else:
        return False
def isShamt(str_num):
    if str_num.startswith("-"):
        print("shamt < 0 wrong")
        return False
    elif isData(str_num):
        result = dataToNumT(str_num)
        if result >=32:
            print("shamt should be less than 32")
            return False
        else:
            #result = bin(result).replace("0b","")
            return True
    else:
        return False

def dataToShat(str_num):
    if isShamt(str_num):
        result = dataToNumT(str_num)
        result = bin(result).replace("0b","")
        while len(result) <5:
            result = '0'+result
        return result[-5:]
    else:
        return
def isSel(str_num):
    if str_num.startswith("-"):
        print("sel < 0 wrong")
        return False
    elif isData(str_num):
        result = dataToNumT(-str_num)
        if result >=8:
            print("sel should be less than 8")
            return False
        else:
            #result = bin(result).replace("0b","")
            return True
    else:
        return False
def dataToSel(str_num):
    if isSel(str_num):
        result = dataToNumT(str_num)
        result = bin(result).replace("0b","")
        while len(result) <3:
            result = '0'+result
        return result[-3:]
    else:
        return

def isImmediate(str_num):
    return isData(str_num)

def dataToImmediate(str_num=""):
    if isImmediate(str_num):
        result = dataToNumT(str_num)
        if result > 65535 or result < -32768:
            print("The im is too big for dataToImmediate")
        else:
            item = int(np.uint16(result))
            item = bin(item).replace("0b","")
            while len(item)<16:
                item="0"+item
            return item[-16:]
    else:
        print("It's not a data in dataToNum")
        return

def isOffset(str_num=""):
    return isData(str_num)

def dataToOffset(str_num):
    if isOffset(str_num):
        result = dataToNumT(str_num)
        if result > 65535 or result < -32768:
            print("The im is too big for dataToOffset")
        else:
            item = int(np.uint16(result))
            item = bin(item).replace("0b","")
            while len(item)<16:
                item="0"+item
            return item[-16:]
    else:
        print("It's not a data in dataToOffset")
        return
def isAddr(str_num):
    if isData(str_num):
        m = dataToNumT(str_num)
        if m%4!=0:
            print("The address must be 4 times in deal_one_addr")
            return
        else:
            return True
def dataToAddr(str_num):
    if isAddr(str_num):
        m = dataToNumT(str_num)
        m = m >>2
        if m>67108863 or m< -33554432:
            print("The addr is too large to show in dataToAddr")
        else:
            item = int(np.uint32(m))
            item = bin(item).replace("0b","")
            while len(item)<26:
                item="0"+item
            return item[-26:]

def isBOffset(str_num):
    if isData(str_num):
        m = dataToNumT(str_num)
        if m%4!=0:
            print("The offset must be 4 times in boffset")
            return
        else:
            return True

def dataToBOffset(str_num):
    if isAddr(str_num):
        m = dataToNumT(str_num)
        m = m >> 2
        if m > 65535 or m < -32768:
            print("The addr is too large to show in dataToBOffset")
        else:
            item = int(np.uint16(m))
            item = bin(item).replace("0b", "")
            while len(item) < 16:
                item = "0" + item
            return item[-16:]
def bdataToHex(str_num):
    a = hex(int(str_num,2)).replace("0x","")
    while len(a) < 2:
        a='0'+a
    return a
def hdataToHex(str_num):
    print(str_num)
    a = str_num.replace("0x","")
    print(a)
    while len(a) < 2:
        a='0'+a
    return a
