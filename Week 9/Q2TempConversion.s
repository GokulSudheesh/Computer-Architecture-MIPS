# 2. Covert from°F to °C (°C= ((5.0/9.0)*(fahrenheit  - 32.0)). Get the fahrenheit from the user. Assume it to be a double precision floating point value. 
.data 
msg1: .asciiz "Fahrenheit: "
msg2: .asciiz "\nCelsius : "
constant: .float -32.0
.text
main:
	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg1 
	syscall 
	li $v0, 6 # syscall 6 (read_float)
	syscall 

	lwc1 $f1, constant
	add.s $f0, $f0, $f1
	li.s $f2, 0.5555
	mul.s $f12, $f0, $f2

	li $v0, 4 # syscall 4 (print_str)
    la $a0, msg2
	syscall 
	li $v0, 2 # syscall 2 (print_float) in $f12
	syscall
	li $v0, 10      # Exit 
	syscall        