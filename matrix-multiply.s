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
array1:	.float 1.0, 0.0, 3.14, 2.72, 2.72, 1.0, 0.0, 3.14, 1.0, 1.0, 1.0, 1.0, 1.0, 2.0, 3.0, 0.0 4.0

array2:	.float 1.0, 1.0, 0.0, 3.14, 0.0, 1.0, 3.14, 2.72, 0.0, 1.0, 1.0, 0.0, 4.0, 3.0, 2.0, 1.0

array3:	.float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0

	.text
	.globl main
main:
	sw $31 saved_ret_pc #return address

	.data
lb_:	.asciiz "Vector Addition\n"
lbd_:	.byte 1, -1, 0, 128
lbd1_:	.word 0x76543210, 0xfedcba98
	.text
	li $v0 4	# syscall 4 (print_str)
	la $a0 lb_
	syscall

# main program: add array1 & array2, store in array3
# first, the setup
	addi $t0 4	# i
	addi $t1 4 # j
	addi $t2 4 # k
	addi $t3 0 # index
	addi $s0 4 #size

	la $t4 array1
	la $t5 array2
	la $t6 array3

loop_i:	
	li $t1 4
	j loop_j #call loop j
	addi $t0 $t0 -1 #count down i
	bne $t0 $0 loop_i

loop_j:
	li $t2 4
	j loop_k #call loop k
	addi $t1 $t1 -1 #count down j
	bne $t1 $0 loop_j

loop_k:

	lwc1 $f0 0($t4) #get the contents of array1[i][k]
	lwc1 $f1 0($t5) #get the contents of array2[k][j]
	lwc1 $f3 0($t6) #get the contents of array3[i][j]
	nop
	mul.s $f2 $f0 $f1
	nop
	add.s $f3 $f3 $f2
	nop
	swc1 $f3 0($t6) 


	#setting the index to [i][k]
	li $t3 0
	mult $t0 $s5
	mflo $t3
	add $t3 $t3 $t2
	mult $t3 $s5
	mflo $t3
	add $t4 $t4 $t3#move to the next index in array 1, array1[i][k]

	#setting the index to [k][j]
	li $t3 0
	mult $t2 $s5
	mflo $t3
	add $t3 $t3 $t1
	mult $t3 $s5
	mflo $t3
	add $t5 $t5 $t3 #move to the next index in array 2, array2[k][j]

	#setting the index to [i][j]
	li $t3 0
	mult $t0 $s5
	mflo $t3
	add $t3 $t3 $t1
	mult $t3 $s5
	mflo $t3
	add $t6 $t6 $t3 #move to the next index in array 3, array3[i][j]

	addi $t2 $t2 -1 #count down k
	bne $t2 $0 loop_k


# Done adding...
	.data
sm:	.asciiz "Done Multiplying\n"
	.text
	li $v0 4	# syscall 4 (print_str)
	la $a0 sm
	syscall

# see the list of syscalls at e.g.
# http://www.inf.pucrs.br/~eduardob/disciplinas/arqi/mips/spim/syscall_codes.html
	la $a1 array3
	addi $t0 $0 16
ploop:	lwc1 $f12 0($a1)
	li $v0 2	# syscall 2 (print_float)
	syscall
	.data
sm2:	.asciiz "\n"
	.text
	li $v0 4	# syscall 4 (print_str)
	la $a0 sm2
	syscall

	addi $t0 $t0 -1
	addi $a1 $a1 4
	bne $t0 $0 ploop

# Done with the program!
	lw $31 saved_ret_pc
	jr $31		# Return from main
