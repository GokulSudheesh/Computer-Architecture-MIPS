# MALP to read and print a string
	.data
str1: .space 20 
	.text

main: 	li $v0, 8	# syscall 8 (read_str)
	la $a0, str1	# load address of string in $a0
	li $a1, 20	# load number of bytes (length) in $a1
	syscall		# string is loaded in memory @ str1

	la $a0, str1	
        li $v0,4	# syscall 4 (print_str)
        syscall

	li $v0, 10
	syscall	