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

loop1:
	bge $t1, $t0, exit1

	lw $t2, 0($s0)
	lw $t3, 0($s1)
	add $t4, $t2, $t3
	sw $t4, 0($s2)

	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $t1, $t1, 1
	j loop1

exit1:
	li $t1, 0#i
	la $s2, list3

loop2:
	bge $t1, $t0, exit2

	lw $a0, 0($s2)

	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 

	addi $s2, $s2, 4
	addi $t1, $t1, 1
	j loop2

exit2:
	li $v0, 10      # 
    syscall         #