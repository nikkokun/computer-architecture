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
array1:	.float 3.14159265, 2.71828183, 1.0,  -0.10
array2:	.float 2.71828183, 1.0, 3.14159265, 1.0
array3:	.float 0.0, 0.0, 0.0, 0.0

	.text
	.globl main
main:
	sw $31 saved_ret_pc

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
	addi $t0 4	# loop counter
	la $t1 array1
	la $t2 array2
	la $t3 array3
ladd:	
	lwc1 $f0 0($t1)
	lwc1 $f1 0($t2)
	nop
	add.s $f2 $f1 $f0
	nop
	swc1 $f2 0($t3)
	addi $t0 $t0 -1
	addi $t1 $t1 4
	addi $t2 $t2 4
	addi $t3 $t3 4
	bne $t0 $0 ladd

# Done adding...
	.data
sm:	.asciiz "Done adding\n"
	.text
	li $v0 4	# syscall 4 (print_str)
	la $a0 sm
	syscall

# see the list of syscalls at e.g.
# http://www.inf.pucrs.br/~eduardob/disciplinas/arqi/mips/spim/syscall_codes.html
	la $a1 array3
	addi $t0 $0 4
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
