# Write a MIPS program to print Hello World.
.data
msg: .asciiz "Hello World"
.text

main: li $v0, 4 # syscall 4 (print_str)
      la $a0, msg # argument: string
      syscall # print the string
      
      li $v0, 10 #exit
      syscall #exit
