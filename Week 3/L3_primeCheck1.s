#Write a MIPS Program to check for prime number.
.data
msg1: .asciiz "Enter number: "
msg2: .asciiz "It is a prime!"
msg3: .asciiz "It is not a prime!"
.text

loop:  
	beq $t0, 1, end
	div $t1, $t0	
	mfhi $t3
	beq $t3, 0, isNotprime  
	addi $t0, $t0, -1    
	j loop

isNotprime:
	#Print msg3
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg3 # argument: string
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
	move $t1, $v0 #$t1 stores the actual number.
	#divi $t0, $v0, 2 
	addi $t0, $v0, -1 #we need $t0 to divide the number from (2 to $t1-1)
	j loop
	
end:
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	li $v0, 10 #exit
	syscall #exit