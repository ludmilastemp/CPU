	.file	"main.cpp"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "bin_txt.txt\0"
LC1:
	.ascii "my_asm.txt\0"
LC2:
	.ascii "\12\12END!\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$3000, 28(%esp)
	movl	$LC0, (%esp)
	call	__Z17CheckAntiOverflowPKc
	movl	$LC0, (%esp)
	call	__Z3SPUPKc
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L2
	movl	$0, %eax
	jmp	L3
L2:
	movl	$LC1, 4(%esp)
	movl	$LC0, (%esp)
	call	__Z8BinToASMPKcS0_
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L4
	movl	$0, %eax
	jmp	L3
L4:
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, %eax
L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.section .rdata,"dr"
	.align 4
__ZL5nFunc:
	.long	12
	.align 4
__ZL18nFuncWithArguments:
	.long	2
	.align 4
__ZL26INITIAL_VALUE_OF_FUNCTIONS:
	.long	33
LC3:
	.ascii "push\0"
LC4:
	.ascii "pop\0"
LC5:
	.ascii "add\0"
LC6:
	.ascii "sub\0"
LC7:
	.ascii "mul\0"
LC8:
	.ascii "div\0"
LC9:
	.ascii "sqrt\0"
LC10:
	.ascii "sin\0"
LC11:
	.ascii "cos\0"
LC12:
	.ascii "in\0"
LC13:
	.ascii "OUT\0"
LC14:
	.ascii "HLT\0"
	.align 32
__ZL8funcText:
	.long	LC3
	.long	LC4
	.long	LC5
	.long	LC6
	.long	LC7
	.long	LC8
	.long	LC9
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.align 32
__ZL7funcArg:
	.long	1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	-1
	.long	0
	.long	0
	.long	0
	.long	1
	.long	-1
	.long	0
	.align 4
__ZL11DEBUG_PRINT:
	.space 4
	.align 8
__ZL16INITIAL_CAPACITY:
	.long	1
	.long	0
	.align 8
__ZL17EXPAND_MULTIPLIER:
	.long	2
	.long	0
	.align 8
__ZL18INCORRECT_CAPACITY:
	.long	-1
	.long	0
	.align 8
__ZL14INCORRECT_SIZE:
	.long	-1
	.long	0
	.align 4
__ZL14INCORRECT_DATA:
	.long	666
__ZL7logFile:
	.ascii "LOGFILE\0"
	.ident	"GCC: (GNU) 4.8.1"
	.def	__Z17CheckAntiOverflowPKc;	.scl	2;	.type	32;	.endef
	.def	__Z3SPUPKc;	.scl	2;	.type	32;	.endef
	.def	__Z8BinToASMPKcS0_;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
