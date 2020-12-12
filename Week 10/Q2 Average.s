#2. Compute the average of a list of 5 integer numbers stored in memory and 
#print the result to the user
.data 
	array_marks: .word 14, 25, 33, 49, 41
	length: .byte 5
	floatNum: .float 5.0
.text
main:
	li $t1, 0 #i=0
	li $t2, 0 #Array Counter
	lb $t0, length

loop:
	bge $t1, $t0, exit
	sll $t2, $t1, 2 #shifting 2 times is like multiplying by 4
	lw $t3, array_marks($t2)

	mtc1 $t3, $f0 # $f12 = $t3
	cvt.s.w $f0, $f0

	add.s $f12, $f12, $f0

	addi $t1, $t1, 1
	j loop

exit:
	li.s $f0, 5.0
	div.s $f12, $f12, $f0

	li $v0, 2 # syscall 2 (print_float) float in $f12
	syscall 

	li $v0, 10      
	syscall    
