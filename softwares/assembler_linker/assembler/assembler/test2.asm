.data
.text
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
