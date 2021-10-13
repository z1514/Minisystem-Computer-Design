.data 0x0DFC
LEDDATE .word0

.text 0000
start:j 0x0C00
nop

#初始化模块
.text 0xC00
addiu $sp,$zero,0x0FFF#初始$sp寄存器的值0x0FFF
addiu $t0,$zero,0
addiu $t1,$zero,0x1000#修改为64K对应的十六进制
sll $t1,$t1,4#左移一个十六进制位，也就是四个二进制位
lui $t2,0xAABB#t2寄存器的值0xAABB0000

#自检模，检查RAM 键盘和LED数码管
CHKRAM: 
lw $t8,0($t0)#Memory[$t0+0]   $t8=Memory[(rs)+sign(offset)]将存储器M[0]中的值放入t8寄存器中
sw $t2,0($t0)#将t2寄存器的值AABB0000放入M[0]中
lw $t4,0($t0)#将M[0]的值AABB0000H放入t4寄存器中
bne $t4,$t2,Error#判断t4寄存器中的值和t2寄存器中的值是否相等，如果不相等则跳转去Error
nop
sw $t8,0($t0)
beq $t0,$t1,CHKKEY #全部检查完，如果t0寄存器的值0000H和t1寄存器的值1000H是否相等，如果不相等向下执行，如果相等则检查完RAM的读写功能
nop
addiu $t0,$t0,4  #如果上面的指令相加不相等，则t0的值变为0004H,到下一个检查的内存地址M[4],直到检查的内存地址为M[1000H],也就是检查完1024个内存块，64KB大小的RAM
j CHKRAM
nop
###自检查键盘
CHKKEY:
addiu $s1,$zero,0x0DC #key错误码
lw $t0,0xFC12($zero) #读键盘的状态：M[FC12H]的值放入t0寄存器中
andi $t0,$t0,1#如果有按键则t0寄存器的值为1，若无按键则t0寄存器的值为0
bne $t0,$zero,Error  #没按键的时候有按键信息，出错
nop
###自检查数码管，直接低四位显示0000
CHKLED:
addiu $s0,$zero,0
sw $s0,0xFC04($zero)
addiu $s0,$zero,0xFFFF
sw $s0,0xFC00($zero)
j 0x0008 #跳转到用户程序
nop
Error:
sw $s1,0xFC00($zero)#将错误码显示在数码管上
LP: 
sw $t9,0xFC50($zero)  #复位看门狗
j LP
nop
####功能调用，封装七段八位数码管
.text 0x0CB4
sw $s0,0($sp)
addi $sp,$sp,-4
sw $s1,0($sp)
addi $sp,$sp,-4
sw $a0,0xFC04($zero)#将特殊状态寄存器赋值          
#高八位表示是否显示数字
andi  $a0,$a0,0xF000
beq $a0,$zero,NUM1#只用1个数码管就能完成显示
NUM2:
add $s1,$a1,$zero
andi $a1,$a1,0xFFFF#a1寄存器中存放低四位的数码管
sw $a1,0xFC00($zero)
sub $s1,$s1,$a1#$s1寄存器中存放高四位的数码管
sw $s1,0xFC02($zero)
NUM1:
sw $a1,0xFC00($zero)
LEDEXIT:
addi $sp,$sp,4  #恢复s1的值
lw $s1,0($sp)
addi $sp,$sp,4     #恢复s0的值
lw $s0,0($sp) 
jr $ra  #子程序返回
#功能调用，返回键盘值在$v0寄存器中
.text 0x0DE8
sw $s0,0($sp)    #将s0寄存器的内容压栈
addi $sp,$sp,-4
sw $s1,0($sp)    #将s1寄存器的内容压栈
addi $sp,$sp,-4  
KLOP: 
lw $s1,0xFC12($zero)   #读键状态
andi $s1,$s1,1
beq $s1,$zero,KLOP #第0位为1表示有键，0表示无键,如果此时无键按下则一直循环等待
nop
lw $s1,0xFC10($zero)      #读键值
addi $v0,$s1,$zero
KEYEXIT: 
addi $sp,$sp,4  #恢复s1的值
lw $s1,0($sp)
addi $sp,$sp,4     #恢复s0的值
lw $s0,0($sp) 
jr $ra  #子程序返回

