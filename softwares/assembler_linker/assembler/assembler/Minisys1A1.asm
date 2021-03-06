.data 84
buf: .word 0x00000055,0x00000AA
buf2: .word 0x00000000
DELAY: .word 0x3F9409
LED: .word 0x0AAAAAAAA
MASK: .word 0x0FFFFFFFF
.text
start:
ori $at,$zero,1
ori $v0,$zero,2
ori $v1,$zero,3
ori $a0,$zero,4
ori $a1,$zero,5
ori $a2,$zero,6
ori $a3,$zero,7
ori $t0,$zero,8
ori $t1,$zero,9
ori $t2,$zero,10
ori $t3,$zero,11
ori $t4,$zero,12
ori $t5,$zero,13
ori $t6,$zero,14
ori $t7,$zero,15
ori $s0,$zero,16
ori $s1,$zero,17
ori $s2,$zero,18
ori $s3,$zero,19
ori $s4,$zero,20
ori $s5,$zero,21
ori $s6,$zero,22
ori $s7,$zero,23
ori $t8,$zero,24
ori $t9,$zero,25
ori $i0,$zero,26
ori $i1,$zero,27
ori $s9,$zero,28
ori $sp,$zero,29
ori $s8,$zero,30
ori $ra,$zero,31

lw $v0,buf($zero)
lw $v1,buf($a0)
add $at,$v0,$v1
sw $at,8($zero)
subu $a0,$v1,$v0
slt $a0,$v0,$at
and $at,$v1,$a3
or $a2,$v0,$at
xor $a3,$v0,$v1
nor $a2,$a1,$at

lop: beq $v1,$v0,lop

lop1: sub $v0,$v0,$a1
bne $a1,$v0,lop1
beq $at,$at,lop2
lop2: jal subp
j next
subp: jr $ra

next: addi $v0,$zero,0x99
ori $v1,$zero,0x77
sll $v1,$v0,4
srl $v1,$v0,4
srlv $v1,$v0,$at
lui $a2,0x9988
sra $a3,$a2,4
addi $v0,$zero,0
addi $v1,$zero,2
sub $at,$v0,$v1

lb $7,buf($zero)
lbu $7,buf($3)
lh $7,buf($3)
lhu $7,buf($zero)

lop3: sub $8,$8,$8#$8=0
bltz $8,lop3 #不跳转
bgtz $1,lop3#不跳转
bgez $8,multdiv#跳转
blez $1,lop3#不跳转

multdiv: mult $3,$6
mfhi $8
mflo $9
div $6,$3
mfhi $8
mflo $9
mthi $1
mfhi $8
mtlo $3
mflo $9

disp:lui $28,0xFFFF
ori $28,$28,0xF000
lw $3,LED($zero)
srl $4,$3,16
sw $3,0x0C60($28)
sw $4,0x0C62($28)
lw $5,MASK($zero)
xor $3,$3,$5
sw $3,LED($zero)
jal dely
dely: lw $29,DELAY($zero)
dlop: addi $29,$29,-1
bne $29,$0,dlop
jr $31

