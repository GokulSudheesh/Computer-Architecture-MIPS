#Write an MIPS program to implement linear search.
.data
list: .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length: .word 10
msg1: .asciiz "Enter number to be searched for: "
msg2: .asciiz "Element not found!"
msg3: .asciiz "Element found at position: "
space: .asciiz " "
.text


main:  
	la $s0, list
	li $t0, 10 #length
	li $t1, 0#i

	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 

	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $t2, $v0

loop:
	bge $t1, $t0, notFound

	lw $t3, 0($s0)
	beq $t3, $t2 found

	addi $s0, $s0, 4
	addi $t1, $t1, 1
	j loop

found:
	#Print msg3
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg3 # argument: string
	syscall 
	move $a0, $t1
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	li $v0, 10      # Exit
    syscall         # Exit

notFound:
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	li $v0, 10      # Exit
    syscall         # Exit