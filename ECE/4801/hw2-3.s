# clear $t0
add $t0, $zero, $zero

# ble $t3, $t5, Label
slt $at, $t3, $t5
beq $at, $zero, Label

# bgt $t4, $t5, Label
slt $at, $t5, $t4
bne $at, $zero, Label

# bge $t5, $t3, Label 	(if ($t5 >= $t3) goto Label)
slt $at, $t5, $t3
beq $at, $zero, Label

# beq $t1, small, Label (if($t1 == small) goto Label)
ori $at, $t1, small
beq $at, $t1, Label

# beq $t2, big, Label 	(if($t2 == big) goto Label)
lui $t1, big_hi
ori $t1, $t1, big_lo
beq $t2, $t1, Label

# li $t1, small 		($t1 = small)
addi $t1, $zero, small

# li $t2, big 			($t2 = big)
lui $t2, big_hi
ori $t2, $t2, big_lo

# addi $t0, $t2, big 	($t0 = $t2 + big)
lui $at, big_hi
ori $at, $at, big_low
add $t0, $t2, $at

# lw $t5, big($t2) 		($t5 = Memory[$t2 + big])
lui $at, big_hi
ori $at, $at, big_lo
add $t2, $t2, $at
lw $t5, 0($t2)

