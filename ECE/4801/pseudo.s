main:
# clear $t0 :: $t0 = 0
add $t0, $t0, $zero

# ble $t3, $t5, Label :: if($t3 <= $t5) goto Label
slt $at, $t5, $t3
beq $at, $zero, Label

# bgt $t4, $t5, Label :: if($t4 > $t5) goto Label
slt $at, $t5, $t4
beq $at, $zero, Label

# bge $t5, $t3, Label :: if($t5 >= $t3) goto Label
slt $at, $t3, $t5
beq $at, $zero, Label

# beq $t1, small, Label :: if($t1 == small) goto Label :: small < 2^16
addi $at, $zero, small
beq $t1, $at, Label

# beq $t2, big, Label :: if($t2 == big) goto Label :: big < 2^32
lui $at, big_hi
ori $at, $at, big_lo
beq $t2, $at, Label

# li $t1, small :: $t1 = small
addi $t1, $zero, small

# li $t2, big :: $t2 = big
lui $at, big_hi
ori $at, $at, big_lo
add $t2, $zero, $at

# addi $t0, $t2, big :: $t0 = $t2 + big
lui $at, big_hi
ori $at, $at, big_lo
add $t0, $t2, $at

# lw $t5, big($t2) :: $t5 = Memory[$t2 + big]
lui $at, big_hi
ori $at, $at, big_lo
add $at, $at, $t2
lw $t5, 0($at)