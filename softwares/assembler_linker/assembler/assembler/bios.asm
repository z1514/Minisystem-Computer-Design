.data 0x0DFC
LEDDATE .word 0

.text 0000
start:j 0x0C00
.text 0xC00
addiu $sp,$zero,0x0FFF
addiu $t0,$zero,0
addiu $t1,$zero,0x1000
sll $t1,$t1,4
lui $t2,0xAABB

CHKRAM: 
lw $t8,0($t0)
sw $t2,0($t0)
lw $t4,0($t0)
bne $t4,$t2,Error

sw $t8,0($t0)
beq $t0,$t1,CHKKEY

addiu $t0,$t0,4
j CHKRAM
CHKKEY:
addiu $s1,$zero,0x0DC
lw $t0,0xFC12($zero)
andi $t0,$t0,1
bne $t0,$zero,Error

CHKLED:
addiu $s0,$zero,0
sw $s0,0xFC04($zero)
addiu $s0,$zero,0xFFFF
sw $s0,0xFC00($zero)
j 0x0008
Error:
sw $s1,0xFC00($zero)
LP: 
sw $t9,0xFC50($zero)
j LP
.text 0x0CB4
sw $s0,0($sp)
addi $sp,$sp,-4
sw $s1,0($sp)
addi $sp,$sp,-4
sw $a0,0xFC04($zero)
andi  $a0,$a0,0xF000
beq $a0,$zero,NUM1
NUM2:
add $s1,$a1,$zero
andi $a1,$a1,0xFFFF
sw $a1,0xFC00($zero)
sub $s1,$s1,$a1
sw $s1,0xFC02($zero)
NUM1:
sw $a1,0xFC00($zero)
LEDEXIT:
addi $sp,$sp,4
lw $s1,0($sp)
addi $sp,$sp,4
lw $s0,0($sp) 
jr $ra
.text 0x0DE8
sw $s0,0($sp)
addi $sp,$sp,-4
sw $s1,0($sp)
addi $sp,$sp,-4  
KLOP: 
lw $s1,0xFC12($zero)
andi $s1,$s1,1
beq $s1,$zero,KLOP
lw $s1,0xFC10($zero)
addi $v0,$s1,$zero
KEYEXIT: 
addi $sp,$sp,4
lw $s1,0($sp)
addi $sp,$sp,4
lw $s0,0($sp) 
jr $ra

