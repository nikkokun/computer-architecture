	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$320, %rsp              ## imm = 0x140
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -276(%rbp)
	movl	%edi, -280(%rbp)
	movq	%rsi, -288(%rbp)
	movl	$0, -304(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
                                        ##         Child Loop BB0_7 Depth 4
	cmpl	$100, -304(%rbp)
	jge	LBB0_16
## BB#2:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, -292(%rbp)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
                                        ##         Child Loop BB0_7 Depth 4
	cmpl	$32, -292(%rbp)
	jge	LBB0_14
## BB#4:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	$0, -296(%rbp)
LBB0_5:                                 ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB0_7 Depth 4
	cmpl	$32, -296(%rbp)
	jge	LBB0_12
## BB#6:                                ##   in Loop: Header=BB0_5 Depth=3
	movl	$0, -300(%rbp)
LBB0_7:                                 ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ##       Parent Loop BB0_5 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	cmpl	$32, -300(%rbp)
	jge	LBB0_10
## BB#8:                                ##   in Loop: Header=BB0_7 Depth=4
	leaq	_C(%rip), %rax
	leaq	_B(%rip), %rcx
	leaq	_A(%rip), %rdx
	movslq	-292(%rbp), %rsi
	shlq	$8, %rsi
	addq	%rsi, %rdx
	movslq	-300(%rbp), %rsi
	movsd	(%rdx,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
	movslq	-300(%rbp), %rdx
	shlq	$8, %rdx
	addq	%rdx, %rcx
	movslq	-296(%rbp), %rdx
	mulsd	(%rcx,%rdx,8), %xmm0
	movslq	-292(%rbp), %rcx
	shlq	$8, %rcx
	addq	%rcx, %rax
	movslq	-296(%rbp), %rcx
	addsd	(%rax,%rcx,8), %xmm0
	movsd	%xmm0, (%rax,%rcx,8)
## BB#9:                                ##   in Loop: Header=BB0_7 Depth=4
	movl	-300(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -300(%rbp)
	jmp	LBB0_7
LBB0_10:                                ##   in Loop: Header=BB0_5 Depth=3
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_5 Depth=3
	movl	-296(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -296(%rbp)
	jmp	LBB0_5
LBB0_12:                                ##   in Loop: Header=BB0_3 Depth=2
	jmp	LBB0_13
LBB0_13:                                ##   in Loop: Header=BB0_3 Depth=2
	movl	-292(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -292(%rbp)
	jmp	LBB0_3
LBB0_14:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_15
LBB0_15:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	-304(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -304(%rbp)
	jmp	LBB0_1
LBB0_16:
	movl	-276(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -316(%rbp)        ## 4-byte Spill
	jne	LBB0_18
## BB#17:
	movl	-316(%rbp), %eax        ## 4-byte Reload
	addq	$320, %rsp              ## imm = 0x140
	popq	%rbp
	retq
LBB0_18:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_lastval                ## @lastval
.zerofill __DATA,__common,_lastval,8,3
	.section	__DATA,__data
	.globl	_A                      ## @A
	.p2align	4
_A:
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	4614253070214989087     ## double 3.1400000000000001
	.quad	4613307314293241283     ## double 2.7200000000000002
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4613307314293241283     ## double 2.7200000000000002
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	4614253070214989087     ## double 3.1400000000000001
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4607182418800017408     ## double 1
	.quad	4611686018427387904     ## double 2
	.quad	4613937818241073152     ## double 3
	.quad	4616189618054758400     ## double 4
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256

	.globl	_B                      ## @B
	.p2align	4
_B:
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	4614253070214989087     ## double 3.1400000000000001
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4607182418800017408     ## double 1
	.quad	4614253070214989087     ## double 3.1400000000000001
	.quad	4613307314293241283     ## double 2.7200000000000002
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4607182418800017408     ## double 1
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	4616189618054758400     ## double 4
	.quad	4613937818241073152     ## double 3
	.quad	4611686018427387904     ## double 2
	.quad	4607182418800017408     ## double 1
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.quad	0                       ## double 0
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256
	.space	256

	.globl	_C                      ## @C
.zerofill __DATA,__common,_C,8192,4
	.comm	_vals,800,4             ## @vals
	.comm	_thisval,8,3            ## @thisval

.subsections_via_symbols
