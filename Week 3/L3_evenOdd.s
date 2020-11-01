#Write a MIPS Program to check if a number is even/odd.
.data
msg1: .asciiz "Enter number: "
msg2: .asciiz "It is even!"
msg3: .asciiz "It is odd!"
.text

isEven:
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 	
	li $v0, 10 #exit
	syscall #exit
	
main: 
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 
	  
	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $t1, $v0
	li $t0, 2
	
	div $t1, $t0
	mfhi $t2
	beq $t2, $zero, isEven
	
	#Print msg3
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg3 # argument: string
	syscall 	
	li $v0, 10 #exit
	syscall #exit
