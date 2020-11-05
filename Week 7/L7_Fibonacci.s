#3. Print fibonacci series using procedures
#Input arguments to the procedure: No. of terms
.data
msg1: .asciiz "Enter N: "
space: .asciiz " "
.text

fibonacci:
	move $t0, $a0 # loop variable
	li $t1, 0
	li $t2, 1
	move $a0, $t1
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
    #Print space
	li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 
loop:
	beq $t0, 1, end
	move $t3, $t2
	add $t2, $t2, $t1
	move $t1, $t3
	move $a0, $t1
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
    #Print space
	li $v0, 4 # syscall 4 (print_str)
    la $a0, space # argument: string
	syscall 
	addi $t0, $t0, -1         
	j loop	
end:
	jr $ra
main: 
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 
	  
	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $a0, $v0 # no.of terms
	jal fibonacci
	li $v0, 10 #exit
	syscall #exit