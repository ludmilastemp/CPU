	.file	"error.cpp"
	.data
	.align 32
__ZL6errStr:
	.ascii "Error from \0"
	.space 488
	.section .rdata,"dr"
LC0:
	.ascii "%s\0"
	.text
	.globl	__Z13StackPrintErrPK5Stack
	.def	__Z13StackPrintErrPK5Stack;	.scl	2;	.type	32;	.endef
__Z13StackPrintErrPK5Stack:
LFB8:
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
	movl	12(%eax), %eax
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jle	L2
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1314869842, 8(%eax)
	movl	$1147098191, 12(%eax)
	movl	$1598116929, 16(%eax)
	movl	$1313427280, 20(%eax)
	movl	$173163860, 24(%eax)
	movb	$0, 28(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L2:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cltd
	shrl	$28, %edx
	addl	%edx, %eax
	andl	$15, %eax
	subl	%edx, %eax
	cmpl	$7, %eax
	jle	L3
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1314869842, 8(%eax)
	movl	$1298093135, 12(%eax)
	movl	$1380928837, 16(%eax)
	movw	$2649, 20(%eax)
	movb	$0, 22(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L3:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cltd
	shrl	$27, %edx
	addl	%edx, %eax
	andl	$31, %eax
	subl	%edx, %eax
	cmpl	$15, %eax
	jle	L4
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1096766034, 8(%eax)
	movl	$1330205774, 12(%eax)
	movl	$1179796822, 16(%eax)
	movl	$173494092, 20(%eax)
	movb	$0, 24(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L4:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cltd
	shrl	$30, %edx
	addl	%edx, %eax
	andl	$3, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jle	L5
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1230983762, 8(%eax)
	movl	$1380926286, 12(%eax)
	movl	$1413694802, 16(%eax)
	movl	$1514754911, 20(%eax)
	movw	$2629, 24(%eax)
	movb	$0, 26(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L5:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	cmpl	$3, %eax
	jle	L6
	leal	-108(%ebp), %eax
	movl	$1330795077, (%eax)
	movl	$1159733586, 4(%eax)
	movl	$1230983762, 8(%eax)
	movl	$1380926286, 12(%eax)
	movl	$1413694802, 16(%eax)
	movl	$1346454367, 20(%eax)
	movl	$1414087489, 24(%eax)
	movw	$2649, 28(%eax)
	movb	$0, 30(%eax)
	leal	-108(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$__ZL6errStr, (%esp)
	call	_strcat
L6:
	movl	$__ZL6errStr, 4(%esp)
	movl	$LC0, (%esp)
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
LFE8:
	.section .rdata,"dr"
LC1:
	.ascii "Stack_1type/error.cpp\0"
LC2:
	.ascii "fmt\0"
LC3:
	.ascii "a\0"
	.text
	.def	__ZL9STL_PrintPKcz;	.scl	3;	.type	32;	.endef
__ZL9STL_PrintPKcz:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L9
	movl	$61, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	__assert
L9:
	movl	$LC3, 4(%esp)
	movl	$__ZL7logFile, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	leal	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	__imp___iob, %eax
	addl	$64, %eax
	movl	%eax, (%esp)
	call	_vfprintf
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_vfprintf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, -12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.section .rdata,"dr"
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
	.def	_strcat;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
