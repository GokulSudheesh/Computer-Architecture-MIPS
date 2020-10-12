# Write the MIPS ALP for the high level code. Observe precedence and associativity rules.
# a  = a * b / c % d + e;
.data
a1: .word 5
b1: .word 6
c1: .word 7
d1: .word 8
e1: .word 9
.text

main:
	lw $t0, a1
	lw $t1, b1
	lw $t2, c1
	lw $t3, d1
	lw $t4, e1
	
	mul $t0, $t0, $t1
	div $t0, $t2
	mflo $t0
	div $t0, $t3
	mfhi $t0
	add $a0, $t0, $t4
	
	#Print sum value is at $a0
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	
	li $v0, 10 #exit
	syscall #exit

