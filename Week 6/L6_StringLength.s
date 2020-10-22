#Write a MIPS Program to compute the length of a string.
.data
string1: .asciiz "This is a random string"
msg1: .asciiz "The length is: "
.text

main:  
	la $s0, string1
	li $t2, 0#count

loop:
	lb $t1, 0($s0)
	beq $t1, $zero, exit
	addi $s0, $s0, 1
	addi $t2, $t2, 1
	j loop

exit:
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 

	move $a0, $t2

	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

	li $v0, 10      # 
    syscall         #