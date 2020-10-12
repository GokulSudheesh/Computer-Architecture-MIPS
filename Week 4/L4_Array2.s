.data
list: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length: .word 10
space: .asciiz " "
.text

main:  
	li $s0, 0
	li $t0, 10 #length
	li $t1, 0#i

loop:
	bge $t1, $t0, exit

	lw $a0, list($s0)
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop

exit:
	li $v0, 10      # 
    syscall         #