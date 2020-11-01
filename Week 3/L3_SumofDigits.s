#Write a MIPS Program to find the sum of digits.
#sum = 0;
#while (N != 0)
#{
#      remainder = N % 10;
#      sum       = sum + remainder;
#      N         = N / 10;
#}
.data
msg1: .asciiz "Enter number: "
.text

loop:  
	beq $t1, $zero, end
	div $t1, $t0
	mfhi $t2 #N%10
	add $a0, $a0, $t2
	mflo $t1
	j loop

main: 
	#Print msg1
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 # argument: string
	syscall 
	  
	li $v0, 5 # syscall 5 (read_int)
	syscall 
	move $t1, $v0
	li $t0, 10
	li $a0, 0
	j loop
end:
	#Print sum value of digits which is at $a0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0

	li $v0, 10 #exit
	syscall #exit
