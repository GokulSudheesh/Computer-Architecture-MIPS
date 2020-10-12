# Write a MIPS program to read and print a string.
.data
str1: .space 10	
.text

main: li $v0, 8 # syscall 5 read_string
      la $a0, str1 # argument: num
	  la $a1, 10 # argument: num
      syscall 
      
	  li $v0, 4 # syscall 4 (print_str)
      la $a0, str1 # argument: string
      syscall # print the string
	  
      li $v0, 10 #exit
      syscall #exit
