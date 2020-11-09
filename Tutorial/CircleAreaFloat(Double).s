.data
pi: .double 3.14159265358979
msg1: .asciiz "Enter radius: "
msg2: .asciiz "\nArea: "

.text
main:
	ldc1 $f2, pi
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 
	syscall 
	li $v0, 7 # syscall 7 (read_double)
	syscall 
	mul.d $f12, $f0, $f0 # r^2
	mul.d $f12, $f0, $f2 # pi*r^2

	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2
	syscall 
	li $v0, 3 # syscall 3 (print_double) in $f12
	syscall
	li $v0, 10      # Exit 
	syscall         
