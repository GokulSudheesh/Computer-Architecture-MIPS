#Write a MIPS Program to compute the factorial of a whole number N.(Do While Loop)
.data
msg1: .asciiz "Enter number: "
.text

loop:  	
	mul $a0, $a0, $t0
	addi $t0, $t0, -1    
	bne $t0, $zero, loop     
	#Print factorial value is at $a0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	li $v0, 10 #exit
	syscall #exit
	
main: 
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 
	  
	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $t0, $v0
	li $a0, 1
	j loop	