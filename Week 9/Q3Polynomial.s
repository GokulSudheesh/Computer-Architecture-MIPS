# 3. Find the output of polynomial ax^2 + bx + c for user-input x. Assume x to be a single precision floating point value.
.data
msg1: .asciiz "X: "
a1: .float 1.5
b1: .float 2.5
c1: .float 3.5
.text

main:
	lwc1 $f1, a1
	lwc1 $f2, b1
	lwc1 $f3, c1
 	# $f0 = x
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 
	syscall 
	li $v0, 6 # syscall 6 (read_float)
	syscall 

	mul.s $f12, $f0, $f0 # x^2
	mul.s $f12, $f12, $f1 # a*x^2
	mul.s $f2, $f2, $f0 # b*x
	add.s $f12, $f12, $f2 # ax^2 + bx
	add.s $f12, $f12, $f3 # ax^2 + bx + c

	li $v0, 2 # syscall 2 (print_float) in $f12
	syscall
	li $v0, 10      # Exit 
	syscall     