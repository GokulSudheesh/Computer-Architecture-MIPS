.data
pi: .float 3.14159265358979
msg1: .asciiz "Enter radius: "
msg2: .asciiz "\nArea: "

.text
main:
	lwc1 $f2, pi
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 
	syscall 
	li $v0, 6 # syscall 6 (read_float)
	syscall 
	mul.s $f12, $f0, $f0 # r^2
	mul.s $f12, $f0, $f2 # pi*r^2

	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2
	syscall 
	li $v0, 2 # syscall 2 (print_float) in $f12
	syscall
	li $v0, 10      # Exit 
	syscall         
