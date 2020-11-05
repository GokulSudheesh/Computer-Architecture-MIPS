# 1. A main procedure calls procedures named sum, difference, product and quotient. 
# All procedures (except main) takes two numbers (x, y) as input arguments and returns the 
# sum (x + y), difference (x-y), product (x*y) and quotient (x/y) values to the main procedure. 
# The result of each operation is displayed to the user.
.data
data1: .word 10
data2: .word 2
string1: .asciiz "Sum: "
string2: .asciiz "\nDifference: "
string3: .asciiz "\nProduct: "
string4: .asciiz "\nQuotient: "
.text

divProcedure:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	div $a0, $a1
	mflo $s0
	move $v0, $s0

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

mulProcedure:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	mul $s0, $a0, $a1
	move $v0, $s0

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

diffProcedure:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	sub $s0, $a0, $a1
	move $v0, $s0

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

addProcedure:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	add $s0, $a0, $a1
	move $v0, $s0

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

mainProcedure:		
	addi $sp, $sp, -8 #Pushing Stack
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	
	li $v0, 4 # syscall 4 (print_str)
    la $a0, string1 # argument: string
	syscall 
	lw $a0, data1
	lw $a1, data2
	jal addProcedure
	move $a0, $v0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, string2 # argument: string
	syscall 
	lw $a0, data1
	lw $a1, data2
	jal diffProcedure
	move $a0, $v0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, string3 # argument: string
	syscall 
	lw $a0, data1
	lw $a1, data2
	jal mulProcedure
	move $a0, $v0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

    li $v0, 4 # syscall 4 (print_str)
    la $a0, string4 # argument: string
	syscall 
	lw $a0, data1
	lw $a1, data2
	jal divProcedure
	move $a0, $v0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8 #Popping Stack
	jr $ra

main:  
	jal mainProcedure
	li $v0, 10      # 
	syscall         #