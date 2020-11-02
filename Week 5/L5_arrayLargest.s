# Find largest element of a word array A which has 10 elements.
.data 
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length: .word 10
msg1: .asciiz "Largest element: "
.text

main:
	li $t1, 0 #i=0
	li $t2, 0 #Array Counter
	lw $t0, length
	lw $t4, array($t1) #maximum val

loop:
	bge $t1, $t0, exit
	sll $t2, $t1, 2 #i*4
	lw $t3, array($t2)
	bgt $t3, $t4, setMax
    
	addi $t1, $t1, 1
	j loop

setMax:
	move $t4, $t3
	addi $t1, $t1, 1
	j loop

exit:
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 

	move $a0, $t4
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

	li $v0, 10
	syscall
