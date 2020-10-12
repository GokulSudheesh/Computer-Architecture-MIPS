# Write a MIPS program to read and print a integer.
.data

.text

main: 
	li $v0, 5 # syscall 5 (read_int)
    syscall 
		
	move $a0, $v0
	
	li $v0, 1 # syscall 1 (print_int)
    syscall # print the integer stored in a0
	  
    li $v0, 10 #exit
    syscall #exit
