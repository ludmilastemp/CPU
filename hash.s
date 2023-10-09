	.file	"hash.cpp"
	.text
	.globl	__Z9CountHashPvx
	.def	__Z9CountHashPvx;	.scl	2;	.type	32;	.endef
__Z9CountHashPvx:
LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, -24(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$0, -8(%ebp)
	movl	$0, -4(%ebp)
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %ecx
	movsbl	%cl, %eax
	cltd
	addl	%eax, -8(%ebp)
	adcl	%edx, -4(%ebp)
	addl	$1, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	cltd
	cmpl	-20(%ebp), %edx
	jl	L3
	cmpl	-20(%ebp), %edx
	jg	L6
	cmpl	-24(%ebp), %eax
	jb	L3
L6:
	movl	-8(%ebp), %eax
	movl	-4(%ebp), %edx
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE0:
	.ident	"GCC: (GNU) 4.8.1"
