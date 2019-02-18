#Author:	Alvaro Gutierrez Arce
#Date:		2-16-19
#Description:	iteration

.data

.text
main:
	li $a0, 1
	li $s1, 0
	li $t0, 4
	li $t2, 20
	
doWhile:
	jal addition
	add $a0, $v0, $zero	#load result into the input variable
	div $v0, $t0		#divide by 20
	mflo $t1		#load quotient result
	blt $t1, $t2, doWhile	#while the quotient is less than 20, repeat
	j exit
	
addition:
	add $v0, $a0, $a0	#add the same variable together
	jr $ra
	
exit:
	