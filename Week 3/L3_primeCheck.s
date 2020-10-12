#Write a MIPS Program to check for prime number.
.data
msg1: .asciiz "Enter number: "
msg2: .asciiz "It is a prime!"
msg3: .asciiz "It is not a prime!"
.text

loop:  
	bgt $t3, $t2, end #branch greater than
	div $t0, $t3	
	mfhi $t4
	beq $t4, 0, isNotprime  
	addi $t3, $t3, 1    
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
	move $t0, $v0 #$t0 stores the actual number.
	li $t1, 2
	div $t0, $t1 # Dividing number by 2
	mflo $t2 # Actual number/2
	##delete this
	move $a0, $t2
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	#######################
	li $t3, 2
	j loop

end:
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	li $v0, 10 #exit
	syscall #exit	