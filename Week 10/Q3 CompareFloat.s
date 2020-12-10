#3. Comapre two floating point numbers and print if they are equal or not

.data
	float1: .float 4.56
	float2: .float 4.56
	message1: .asciiz "Not equal."
	message2: .asciiz "Equal."
.text

main: 
	lwc1 $f0, float1	
	lwc1 $f1, float2

	c.eq.s $f0, $f1

	bc1t equal_branch
	li $v0, 4 
	la $a0, message1
	syscall

	li $v0, 10      
	syscall   


equal_branch:
	li $v0, 4 
	la $a0, message2
	syscall

	li $v0, 10      
	syscall   

