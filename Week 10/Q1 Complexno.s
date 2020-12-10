#1. Write the floating point version of Complex no representation and addition.
#Input: a1 = 4.3, b1 = 8.2
#       a2 = 5.6, b2 = 7.1
#Output: Sum = 9.9 + i15.3
#Explanation:
#(4.3 + i8.2) + (5.6 + i7.1)
#= (4.3 + i8.2) + i(5.6 + i7.1) 
#= 9.9 + i15.3
.data
	message1: .asciiz "a1: "
	message2: .asciiz "b1: "
	message3: .asciiz "a2: "
	message4: .asciiz "b2: "
	schar: .asciiz " + i"

.text
main:
	li $v0, 4 
	la $a0, message1
	syscall

	li $v0, 6 # syscall 6 (read_float)
	syscall # stores in $f0

	mov.s $f1, $f0

	li $v0, 4 
	la $a0, message2
	syscall

	li $v0, 6 # syscall 6 (read_float)
	syscall # stores in $f0

	mov.s $f2, $f0

	li $v0, 4 
	la $a0, message3
	syscall

	li $v0, 6 # syscall 6 (read_float)
	syscall # stores in $f0

	mov.s $f3, $f0
	li $v0, 4 
	la $a0, message4
	syscall

	li $v0, 6 # syscall 6 (read_float)
	syscall # stores in $f0

	mov.s $f4, $f0

	add.s $f1, $f1, $f3
	add.s $f2, $f2, $f4

	mov.s $f12, $f1
	li $v0, 2 # syscall 2 (print_float) float in $f12
	syscall 

	li $v0, 4 
	la $a0, schar
	syscall

	mov.s $f12, $f2
	li $v0, 2 # syscall 2 (print_float) float in $f12
	syscall 

	li $v0, 10      
	syscall   