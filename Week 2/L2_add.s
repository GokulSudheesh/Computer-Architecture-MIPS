# Write a MIPS program to take two values from the user, add these values and print the output.
.data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
msg3: .asciiz "Sum: "
.text

main: 
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 
    
	#Read first val
	li $v0, 5 # syscall 5 (read_int)
    syscall 
		
	move $t0, $v0
	
	#Print msg2
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2 # argument: string
	syscall 
	
	#Read second val	
	li $v0, 5 # syscall 5 (read_int)
    syscall 
		
	move $t1, $v0
	
	#Print msg3
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg3 # argument: string
	syscall 
	
	add $a0, $t0, $t1
	
	#Print sum value is at $a0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	  
    li $v0, 10 #exit
    syscall #exit