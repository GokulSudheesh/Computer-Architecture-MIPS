#Write an MIPS program to count the no.of evena nd odd numbers in an array.
.data 
array: .word 1, 2, 3, 4, 5
length: .word 5
msg1: .asciiz "Even numbers: "
msg2: .asciiz "Odd numbers: "
newLine: .asciiz "\n"
.text

main:
	li $t1, 0 #i=0
	li $t2, 0 #i*4
	lw $t0, length
	li $t5, 0 #Odd count
	li $t6, 0 #Even count
	li $t7, 2

loop:
	bge $t1, $t0, exit
	sll $t2, $t1, 2 #shifting 2 times is like multiplying by 4
	lw $t3, array($t2)

	div $t3, $t7
	mfhi $t4
	beq $t4, $zero, isEven

	addi $t5, $t5, 1 
	addi $t1, $t1, 1
	addi $t2, $t2, 4
	j loop

isEven:
	addi $t6, $t6, 1 
	addi $t1, $t1, 1
	addi $t2, $t2, 4
	j loop

exit:
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 

	move $a0, $t6
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, newLine # argument: string
	syscall 

    li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 

	move $a0, $t5
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

	li $v0, 10
	syscall