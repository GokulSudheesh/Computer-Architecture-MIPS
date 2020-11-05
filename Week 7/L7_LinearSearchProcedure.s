#2. Linear search using procedure
#Input arguments to the procedure: Address of the array, total number of elements and search element
#Return value(s): 0 (element not found) 
#              1 (element found), index
.data
list: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
length: .word 10
msg1: .asciiz "Enter key to be searched for: "
msg2: .asciiz "Element not found!"
msg3: .asciiz "Element found at position: "
.text

linearSearch:
	li $v0, 0 # Assume the element is not found initially
	li $t0, 0 # loop variable
loop:
	bge $t0, $a2, out1

	lw $t1, 0($a0)
	beq $t1, $a1, out2

	addi $a0, $a0, 4
	addi $t0, $t0, 1
	j loop
out1:
	jr $ra
out2:
	li $v0, 1
	move $v1, $t0

elementFound:
	#Print msg3
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg3 # argument: string
	syscall 
	move $a0, $v1
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	li $v0, 10      # Exit
    syscall         # Exit

elementNotfound:
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	li $v0, 10      # Exit
    syscall         # Exit


main:
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 

	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $a1, $v0 # element to be searched for
	la $a0, list # base address of the array
	lw $a2, length #length

	jal linearSearch
	beq $v0, 1, elementFound
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	li $v0, 10      # Exit
    syscall         # Exit