	.file	"STL_spu_struct.cpp"
	.data
	.align 32
__ZL6errStr:
	.ascii "ERROR \0"
	.space 493
	.section .rdata,"dr"
LC0:
	.ascii "STL_spu_struct.cpp\0"
LC1:
	.ascii "spu\0"
	.text
	.globl	__Z17STL_SpuStructCtorP10SPU_Struct
	.def	__Z17STL_SpuStructCtorP10SPU_Struct;	.scl	2;	.type	32;	.endef
__Z17STL_SpuStructCtorP10SPU_Struct:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L2
	movl	$10, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L2:
	movl	8(%ebp), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackCtorP5Stackj
	movl	8(%ebp), %eax
	movl	$0, 16(%eax)
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	movl	8(%ebp), %eax
	movl	$0, 24(%eax)
	movl	8(%ebp), %eax
	movl	$0, 28(%eax)
	movl	8(%ebp), %eax
	movl	$0, 32(%eax)
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.globl	__Z17STL_SpuStructDtorP10SPU_Struct
	.def	__Z17STL_SpuStructDtorP10SPU_Struct;	.scl	2;	.type	32;	.endef
__Z17STL_SpuStructDtorP10SPU_Struct:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L5
	movl	$26, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L5:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDtorP5Stack
	movl	8(%ebp), %eax
	movl	$0, 16(%eax)
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	movl	8(%ebp), %eax
	movl	$0, 24(%eax)
	movl	8(%ebp), %eax
	movl	$0, 28(%eax)
	movl	8(%ebp), %eax
	movl	$0, 32(%eax)
	movl	$0, 8(%ebp)
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.globl	__Z24STL_SpuStructVerificatorP10SPU_Struct
	.def	__Z24STL_SpuStructVerificatorP10SPU_Struct;	.scl	2;	.type	32;	.endef
__Z24STL_SpuStructVerificatorP10SPU_Struct:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L8
	movl	$44, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L8:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L9
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L9:
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	32(%eax), %eax
	addl	%edx, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section .rdata,"dr"
LC2:
	.ascii "rax = %d\12\0"
LC3:
	.ascii "rbx = %d\12\0"
LC4:
	.ascii "rcx = %d\12\0"
LC5:
	.ascii "rdx = %d\12\0"
	.text
	.globl	__Z17STL_SpuStructDumpPK10SPU_Struct
	.def	__Z17STL_SpuStructDumpPK10SPU_Struct;	.scl	2;	.type	32;	.endef
__Z17STL_SpuStructDumpPK10SPU_Struct:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	__ZL9STL_PrintPKcz
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.section .rdata,"dr"
LC6:
	.ascii "%s\0"
	.text
	.globl	__Z21STL_SpuStructErrPrinti
	.def	__Z21STL_SpuStructErrPrinti;	.scl	2;	.type	32;	.endef
__Z21STL_SpuStructErrPrinti:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	addl	$-128, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	$32, -108(%ebp)
	leal	-104(%ebp), %ebx
	movl	$0, %eax
	movl	$24, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	movw	$2570, __ZL6errStr
	movb	$0, __ZL6errStr+2
	movl	8(%ebp), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jle	L13
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1380930130, 8(%eax)
	movl	$1129204063, 12(%eax)
	movl	$1163022927, 16(%eax)
	movl	$1180652611, 20(%eax)
	movl	$172183125, 24(%eax)
	movb	$0, 28(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L13:
	movl	8(%ebp), %eax
	cltd
	shrl	$30, %edx
	addl	%edx, %eax
	andl	$3, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jle	L14
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1380930130, 8(%eax)
	movl	$1129204063, 12(%eax)
	movl	$1163022927, 16(%eax)
	movl	$1449088067, 20(%eax)
	movl	$1163217985, 24(%eax)
	movw	$10, 28(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L14:
	movl	8(%ebp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	cmpl	$3, %eax
	jle	L15
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1380930130, 8(%eax)
	movl	$1414483551, 12(%eax)
	movl	$1599688031, 16(%eax)
	movl	$1162627398, 20(%eax)
	movw	$10, 24(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L15:
	movl	$__ZL6errStr, 4(%esp)
	movl	$LC6, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	$__ZL6errStr, %eax
	subl	$-128, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.section .rdata,"dr"
LC7:
	.ascii "fmt\0"
	.text
	.def	__ZL9STL_PrintPKcz;	.scl	3;	.type	32;	.endef
__ZL9STL_PrintPKcz:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L18
	movl	$89, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC7, (%esp)
	call	__assert
L18:
	movl	$0, -12(%ebp)
	leal	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_vfprintf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
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
LC8:
	.ascii "push\0"
LC9:
	.ascii "pop\0"
LC10:
	.ascii "add\0"
LC11:
	.ascii "sub\0"
LC12:
	.ascii "mul\0"
LC13:
	.ascii "div\0"
LC14:
	.ascii "sqrt\0"
LC15:
	.ascii "sin\0"
LC16:
	.ascii "cos\0"
LC17:
	.ascii "in\0"
LC18:
	.ascii "OUT\0"
LC19:
	.ascii "HLT\0"
	.align 32
__ZL8funcText:
	.long	LC8
	.long	LC9
	.long	LC10
	.long	LC11
	.long	LC12
	.long	LC13
	.long	LC14
	.long	LC15
	.long	LC16
	.long	LC17
	.long	LC18
	.long	LC19
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
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	__Z13STL_StackCtorP5Stackj;	.scl	2;	.type	32;	.endef
	.def	__Z13STL_StackDtorP5Stack;	.scl	2;	.type	32;	.endef
	.def	__Z20STL_StackVerificatorP5Stack;	.scl	2;	.type	32;	.endef
	.def	__Z13StackPrintErrPK5Stack;	.scl	2;	.type	32;	.endef
	.def	__Z13STL_StackDumpPK5Stack;	.scl	2;	.type	32;	.endef
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
