##
## template for your assembly programs
##
##

#################################################
#                                               #
#                 text segment                  #
#                                               #
#################################################

        .text
  main:
        # execution starts here

        # printing an ascii string on the screen
        la $a0,prompt
        li $v0,4
        syscall

        # read an integer from the command line
        li $v0, 5
        syscall

        # move entered value to t0 register
        add $t0, $zero, $v0

        # printing an ascii string on the screen
        la $a0,verify
        li $v0,4
        syscall

        # print entered value on the screen
        add $a0, $zero, $t0
        li $v0, 1
        syscall

        la $a0,endl
        li $v0,4
        syscall

        # exit call
        li $v0,10
        syscall         # au revoir...


#################################################
#                                               #
#               data segment                    #
#                                               #
#################################################

        .data
endl:   .asciiz "\n\nexiting ..."
prompt: .asciiz "enter a number: "
verify: .asciiz "you've entered: "

##
## end of files