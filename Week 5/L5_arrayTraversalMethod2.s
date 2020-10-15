.data 
array: .word 1, 2, 3, 4, 5
length: .word 5
space: .asciiz " "
.text

main:
	li $t1, 0 #i=0
	li $t2, 0 #i*4
	lw $t0, length

loop:
	bge $t1, $t0, exit
	sll $t2, $t1, 2 #shifting 2 times is like multiplying by 4
	lw $t3, array($t2)

	move $a0, $t3
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 
	addi $t1, $t1, 1
	addi $t2, $t2, 4
	j loop
exit:
	li $v0, 10
	syscall