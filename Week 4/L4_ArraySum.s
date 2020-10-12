#Write an MIPS program to compute the sum of two arrays and store them in the third array.
.data
list1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
list2: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
#list3: .space 20 #2*10 or 
list3: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
length: .word 10
space: .asciiz " "
.text

main:  
	la $s0, list1
	la $s1, list2
	la $s2, list3
	li $t0, 10 #length
	li $t1, 0#i

loop:
	bge $t1, $t0, exit

	lw $t2, 0($s0)
	lw $t3, 0($s1)
	add $a0, $t2, $t3
	sw $a0, 0($s2)
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 

	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $t1, $t1, 1
	j loop

exit:
	li $v0, 10      # 
    syscall         #