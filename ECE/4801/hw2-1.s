# $a0 = &a[0], $a1 = n
# $s1 = sum, $s2 = i
sum:
	addi $sp, $sp, -8		# create space in stack
	sw $s0, 0($sp)			# save $s0 per convention
	sw $s1, 0($sp) 			# . $s1 . .
	add $s0, $zero, $zero 	# $s0 = sum = 0
	add $s1, $zero, $zero 	# $s1 = i = 0
loop:
	slt $t1, $s1, $a1 		# check if i < n
	beq $t1, $zero, end 	# if i >= n, exit loop
	add $t0, $s1, $s1 		# $t0 = 2i
	add $t0, $t0, $t0 		# $t0 = 4i
	add $t2, $t0, $a0 		# $t2 = &a[i]
	lw $t3, 0($t2) 			# $t3 = a[i]
	add $s0, $s0, $t3 		# sum = sum + a[i]
	addi $s1, $s1, 1 		# i = i + 1
	j loop
end:	
	add $v0, $s0, $zero 	# set sum to be returned
	lw $s1, 0($sp)			# restore $s1
	lw $s0, 0($sp) 			# restore $s2
	add $sp, $sp, $8 		# restore sp to previous location
	jr $ra 					# return to previous location