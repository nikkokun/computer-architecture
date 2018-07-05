# SPIM S20 MIPS simulator.
# simple array addition routine (to be adapted by students for multiplication)
# $Header: $


	.data
saved_ret_pc:	.word 0		# Holds PC to return from main
m3:	.asciiz "The next few lines should contain exception error messages\n"
m4:	.asciiz "Done with exceptions\n\n"
m5:	.asciiz "Expect an address error exception:\n	"
m6:	.asciiz "Expect two address error exceptions:\n"

# here's our array data, two args and a result
	.data
	.globl array1
	.globl array2
	.globl array3
# array1:	.float 1.0, 0.0, 3.14, 2.72, 2.72, 1.0, 0.0, 3.14, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 3.0, 4.0
# array2:	.float 1.0, 1.0, 0.0, 3.14, 0.0, 1.0, 3.14, 2.72, 0.0, 1.0, 1.0, 0.0, 4.0, 3.0, 2.0, 1.0
# array3:	.float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

array1: .float 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
array2: .float 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0
array3:	.float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

	.data
lb_:	.asciiz "Matrix Multiplication\n"
lbd_:	.byte 1, -1, 0, 128
lbd1_:	.word 0x76543210, 0xfedcba98
space: .asciiz " "
newline: .asciiz "\n"
	.text
	.globl main	
main:
	sw $31 saved_ret_pc #return address

	.text
	li $v0 4	# syscall 4 (print_str)
	la $a0 lb_
	syscall

# main program: add array1 & array2, store in array3
# first, the setup
	addi $s0 5 #size
	move $t0 $s0 # i
	addi $s1 $s1 -1 # -1 used to invert the count down counters
	addi $s2 4 #float size
	li $t8 0 #print size

	mult $s0 $s0
	mflo $t8

	la $t4 array1
	la $t5 array2
	la $t6 array3

	j loop_i

loop_i:

	move $t1 $s0
	bne $t0 $0 loop_j #call loop j
	j endloop


loop_j:
	move $t2 $s0
	bne $t1 $0 loop_k #call loop k
	#add new line
	li $v0 4	# syscall 4 (print_str)
	la $a0 newline
	syscall
	addi $t0 $t0 -1 #count down i
	nop
	j loop_i

loop_k:
	
	#always set the base to 0 since we are using absolute indexing, not relative indexing
	la $t4 array1
	la $t5 array2
	la $t6 array3

	#setting the index to [i][k]
	li $a0 0
	li $a1 0
	#inverse i
	sub $a0 $s0 $t0
	#inverse k
	sub $a1 $s0 $t2

	jal setIndex #the index will be $v0
	nop
	add $t4 $t4 $v0#move to the next index in array 1, array1[i][k]

	#setting the index to [k][j]
	li $a0 0
	li $a1 0
	#inverse k
	sub $a0 $s0 $t2
	#inverse j
	sub $a1 $s0 $t1

	jal setIndex #the index will $v0
	nop
	add $t5 $t5 $v0 #move to the next index in array 2, array2[k][j]

	#setting the index to [i][j]
	li $a0 0
	li $a1 0
	#inverse i
	sub $a0 $s0 $t0
	#inverse j
	sub $a1 $s0 $t1

	jal setIndex #the index be $v0
	nop
	add $t6 $t6 $v0 #move to the next index in array 3, array3[i][j]

	lwc1 $f0 0($t4) #get the contents of array1[i][k]
	lwc1 $f1 0($t5) #get the contents of array2[k][j]
	lwc1 $f3 0($t6) #get the contents of array3[i][j]
	nop
	mul.s $f2 $f0 $f1
	nop
	add.s $f3 $f3 $f2
	nop
	swc1 $f3 0($t6)

	addi $t2 $t2 -1 #count down k
	nop
	bne $t2 $0 loop_k #was too sleepy and put the count down elsewhere. Fixed it here.
	#print the result
	lwc1 $f12 0($t6)
	li $v0 2
	syscall
	#add space
	li $v0 4	# syscall 4 (print_str)
	la $a0 space
	syscall

	addi $t1 $t1 -1 #count down j
	nop
	j loop_j

setIndex:
	li $v0 0
	mult $a0 $s0
	nop
	mflo $v0
	add $v0 $v0 $a1
	nop
	mult $v0 $s2
	nop
	mflo $v0
	jr $ra

endloop:

# Done with the program!
	lw $31 saved_ret_pc
	jr $31		# Return from main
