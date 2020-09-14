.text
main:   sub   $sp, 4      # make space on stack for return address
        sw    $ra, 0($sp) # save return address

 # printing an ascii string on the screen
la $a0,prompt
li $v0,4
syscall

# read an integer from the command line
li $v0, 5
syscall

add $a0, $zero, $v0   #argument 7 is taken to a0

jal Factorial         #calls the procedure Factorial
move $a0,$v0
li $v0, 1
syscall               #prints factorial of input number

la $a0, endl
li $v0,4
syscall               #prints space

li $v0,10
syscall             #exits the program

#------------------------------------------------
## Factorial Procedure
# calculates the factorial of a small number
# a0 has the input number n
#------------------------------------------------

Factorial:
sub $sp, $sp, 8   # we adjust the stack for saving return address and argument
sw  $ra, 4($sp)   # stores the return address in stack
sw  $a0, 0($sp)   # stores the argument n is stack


slt $t0, $zero, $a0
bne $t0, $zero, Calculate      #jumps to calculate if n>0
addi $v0, $zero, 1             #else returns 1
addi $sp, $sp, 8               # pops 2 items off the stack
jr $ra                         #returns back to the caller program

Calculate:
sub $a0, $a0, 1                #finds n-1
jal Factorial                  #jumps to factorial with argument being n-1

lw $a0, 0($sp)                 #restores n
lw $ra, 4($sp)                 #restores return address
addi $sp, $sp, 8               #pops the stack off 2 items
mul $v0, $a0, $v0              #returns the result of multiplication
jr $ra                         #returns back to caller program

####################### data segment #################################

.data
prompt: .asciiz "enter a number: "
endl: .asciiz "\n"
##
## end of file

