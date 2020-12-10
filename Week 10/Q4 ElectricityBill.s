# Check the problem statement in "Lab10.txt"

.data
	message1: .asciiz "Enter Unit: " 
	message2: .asciiz "Total Amount: " 
.text
main:
	li $v0, 4
	la $a0, message1
	syscall
	li $v0, 6 # syscall 6 (read_float)
	syscall # stores in $f0

	li.s $f1, 50.0
	c.le.s $f0, $f1 # $f0 -> unit
	bc1t updateAmt1

	li.s $f1, 150.0
	c.le.s $f0, $f1
	bc1t updateAmt2

	li.s $f1, 250.0
	c.le.s $f0, $f1
	bc1t updateAmt3

	li.s $f1, 250.0
	sub.s $f0, $f0, $f1 # unit - 250
	li.s $f1, 1.50
	mul.s $f0, $f0, $f1 # ((unit-250) * 1.50)
	li.s $f1, 220.0
	add.s $f12, $f0, $f1 # amt = 220 + ((unit-250) * 1.50)
	j exit

updateAmt1:
	li.s $f1, 0.50
	mul.s $f12, $f0, $f1 # unit * 0.50
	j exit		

updateAmt2:
	li.s $f1, 50.0
	sub.s $f0, $f0, $f1 # unit - 50
	li.s $f1, 0.75
	mul.s $f0, $f0, $f1 # ((unit-50) * 0.75)
	li.s $f1, 25.0
	add.s $f12, $f0, $f1 # 25 + ((unit-50) * 0.75)
	j exit
	

updateAmt3:
	li.s $f1, 150.0
	sub.s $f0, $f0, $f1 # unit - 150
	li.s $f1, 1.20
	mul.s $f0, $f0, $f1 # ((unit-150) * 1.20)
	li.s $f1, 100.0
	add.s $f12, $f0, $f1 # 100 + ((unit-150) * 1.20)
	j exit

exit:
	li.s $f1, 0.20
	mul.s $f11, $f12, $f1 # sur_charge = amt * 0.20;
	add.s $f12, $f12, $f11 # total_amt  = amt + sur_charge

	li $v0, 4
	la $a0, message2
	syscall

	li $v0, 2 # syscall 2 (print_float) float in $f12
	syscall 

	li $v0, 10      
	syscall    