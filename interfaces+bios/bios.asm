.data 0x0DFC
LEDDATE .word0

.text 0000
start:j 0x0C00
nop

#��ʼ��ģ��
.text 0xC00
addiu $sp,$zero,0x0FFF#��ʼ$sp�Ĵ�����ֵ0x0FFF
addiu $t0,$zero,0
addiu $t1,$zero,0x1000#�޸�Ϊ64K��Ӧ��ʮ������
sll $t1,$t1,4#����һ��ʮ������λ��Ҳ�����ĸ�������λ
lui $t2,0xAABB#t2�Ĵ�����ֵ0xAABB0000

#�Լ�ģ�����RAM ���̺�LED�����
CHKRAM: 
lw $t8,0($t0)#Memory[$t0+0]   $t8=Memory[(rs)+sign(offset)]���洢��M[0]�е�ֵ����t8�Ĵ�����
sw $t2,0($t0)#��t2�Ĵ�����ֵAABB0000����M[0]��
lw $t4,0($t0)#��M[0]��ֵAABB0000H����t4�Ĵ�����
bne $t4,$t2,Error#�ж�t4�Ĵ����е�ֵ��t2�Ĵ����е�ֵ�Ƿ���ȣ�������������תȥError
nop
sw $t8,0($t0)
beq $t0,$t1,CHKKEY #ȫ������꣬���t0�Ĵ�����ֵ0000H��t1�Ĵ�����ֵ1000H�Ƿ���ȣ�������������ִ�У�������������RAM�Ķ�д����
nop
addiu $t0,$t0,4  #��������ָ����Ӳ���ȣ���t0��ֵ��Ϊ0004H,����һ�������ڴ��ַM[4],ֱ�������ڴ��ַΪM[1000H],Ҳ���Ǽ����1024���ڴ�飬64KB��С��RAM
j CHKRAM
nop
###�Լ�����
CHKKEY:
addiu $s1,$zero,0x0DC #key������
lw $t0,0xFC12($zero) #�����̵�״̬��M[FC12H]��ֵ����t0�Ĵ�����
andi $t0,$t0,1#����а�����t0�Ĵ�����ֵΪ1�����ް�����t0�Ĵ�����ֵΪ0
bne $t0,$zero,Error  #û������ʱ���а�����Ϣ������
nop
###�Լ������ܣ�ֱ�ӵ���λ��ʾ0000
CHKLED:
addiu $s0,$zero,0
sw $s0,0xFC04($zero)
addiu $s0,$zero,0xFFFF
sw $s0,0xFC00($zero)
j 0x0008 #��ת���û�����
nop
Error:
sw $s1,0xFC00($zero)#����������ʾ���������
LP: 
sw $t9,0xFC50($zero)  #��λ���Ź�
j LP
nop
####���ܵ��ã���װ�߶ΰ�λ�����
.text 0x0CB4
sw $s0,0($sp)
addi $sp,$sp,-4
sw $s1,0($sp)
addi $sp,$sp,-4
sw $a0,0xFC04($zero)#������״̬�Ĵ�����ֵ          
#�߰�λ��ʾ�Ƿ���ʾ����
andi  $a0,$a0,0xF000
beq $a0,$zero,NUM1#ֻ��1������ܾ��������ʾ
NUM2:
add $s1,$a1,$zero
andi $a1,$a1,0xFFFF#a1�Ĵ����д�ŵ���λ�������
sw $a1,0xFC00($zero)
sub $s1,$s1,$a1#$s1�Ĵ����д�Ÿ���λ�������
sw $s1,0xFC02($zero)
NUM1:
sw $a1,0xFC00($zero)
LEDEXIT:
addi $sp,$sp,4  #�ָ�s1��ֵ
lw $s1,0($sp)
addi $sp,$sp,4     #�ָ�s0��ֵ
lw $s0,0($sp) 
jr $ra  #�ӳ��򷵻�
#���ܵ��ã����ؼ���ֵ��$v0�Ĵ�����
.text 0x0DE8
sw $s0,0($sp)    #��s0�Ĵ���������ѹջ
addi $sp,$sp,-4
sw $s1,0($sp)    #��s1�Ĵ���������ѹջ
addi $sp,$sp,-4  
KLOP: 
lw $s1,0xFC12($zero)   #����״̬
andi $s1,$s1,1
beq $s1,$zero,KLOP #��0λΪ1��ʾ�м���0��ʾ�޼�,�����ʱ�޼�������һֱѭ���ȴ�
nop
lw $s1,0xFC10($zero)      #����ֵ
addi $v0,$s1,$zero
KEYEXIT: 
addi $sp,$sp,4  #�ָ�s1��ֵ
lw $s1,0($sp)
addi $sp,$sp,4     #�ָ�s0��ֵ
lw $s0,0($sp) 
jr $ra  #�ӳ��򷵻�

