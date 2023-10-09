	.file	"stack.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "Stack_1type/stack.cpp\0"
LC1:
	.ascii "stk\0"
LC2:
	.ascii "w\0"
	.text
	.globl	__Z13STL_StackCtorP5Stackj
	.def	__Z13STL_StackCtorP5Stackj;	.scl	2;	.type	32;	.endef
__Z13STL_StackCtorP5Stackj:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L2
	movl	$74, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L2:
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL12StackReallocP5Stack
	movl	$LC2, 4(%esp)
	movl	$__ZL7logFile, (%esp)
	call	_fopen
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.globl	__Z13STL_StackDtorP5Stack
	.def	__Z13STL_StackDtorP5Stack;	.scl	2;	.type	32;	.endef
__Z13STL_StackDtorP5Stack:
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
	movl	$121, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L5:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L6
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L7
L6:
	movl	8(%ebp), %eax
	movl	$-1, 4(%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	movl	$0, %eax
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.globl	__Z13STL_StackPushP5Stacki
	.def	__Z13STL_StackPushP5Stacki;	.scl	2;	.type	32;	.endef
__Z13STL_StackPushP5Stacki:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	jne	L9
	movl	$158, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L9:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L10
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L11
L10:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL14StackReallocUpP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L12
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	jmp	L11
L12:
	movl	8(%ebp), %eax
	movl	(%eax), %ebx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 4(%edx)
	sall	$2, %eax
	leal	(%ebx,%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
L11:
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	__Z12STL_StackPopP5StackPi
	.def	__Z12STL_StackPopP5StackPi;	.scl	2;	.type	32;	.endef
__Z12STL_StackPopP5StackPi:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L14
	movl	$186, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L14:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L15
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L16
L15:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L17
	movl	8(%ebp), %eax
	movl	$16, 12(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	jmp	L16
L17:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL16StackReallocDownP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L18
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
	jmp	L16
L18:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %ecx
	movl	8(%ebp), %eax
	movl	%ecx, 4(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	addl	%edx, %eax
	movl	$666, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z20STL_StackVerificatorP5Stack
L16:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	__Z20STL_StackVerificatorP5Stack
	.def	__Z20STL_StackVerificatorP5Stack;	.scl	2;	.type	32;	.endef
__Z20STL_StackVerificatorP5Stack:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L20
	movl	$215, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L20:
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$8, %eax
	jne	L21
	orl	$8, -12(%ebp)
L21:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$16, %eax
	jne	L22
	orl	$16, -12(%ebp)
L22:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L23
	orl	$1, -12(%ebp)
L23:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$-1, %eax
	je	L24
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jbe	L25
L24:
	orl	$2, -12(%ebp)
L25:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	L26
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$-1, %eax
	jne	L27
L26:
	orl	$4, -12(%ebp)
L27:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.section .rdata,"dr"
LC3:
	.ascii "\12Stack [0x%p]\12\0"
LC4:
	.ascii "{\12\0"
LC5:
	.ascii "\11 size = %zd\12\0"
LC6:
	.ascii "\11 capacity = %zd\12\0"
LC7:
	.ascii "\11 data = [0x%p]\12\0"
LC8:
	.ascii "\11 {\12\0"
LC9:
	.ascii "\11\11 *[%zd] = POISON\12\0"
LC10:
	.ascii "\11\11 *[%zd] = %d\12\0"
LC11:
	.ascii "\11\11  [%zd] = POISON\12\0"
LC12:
	.ascii "\11\11  [%zd] = %d\12\0"
LC13:
	.ascii "\11 }\12\0"
LC14:
	.ascii "}\12\0"
	.text
	.globl	__Z13STL_StackDumpPK5Stack
	.def	__Z13STL_StackDumpPK5Stack;	.scl	2;	.type	32;	.endef
__Z13STL_StackDumpPK5Stack:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	$LC4, (%esp)
	call	__ZL9STL_PrintPKcz
	cmpl	$0, 8(%ebp)
	jne	L30
	movl	$279, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L30:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC5, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC7, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	$LC8, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	L31
	movl	$0, -12(%ebp)
	jmp	L32
L35:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$666, %eax
	jne	L33
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC9, (%esp)
	call	__ZL9STL_PrintPKcz
	jmp	L34
L33:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC10, (%esp)
	call	__ZL9STL_PrintPKcz
L34:
	addl	$1, -12(%ebp)
L32:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L35
	jmp	L36
L39:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$666, %eax
	jne	L37
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC11, (%esp)
	call	__ZL9STL_PrintPKcz
	jmp	L38
L37:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	__ZL9STL_PrintPKcz
L38:
	addl	$1, -12(%ebp)
L36:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L39
L31:
	movl	$LC13, (%esp)
	call	__ZL9STL_PrintPKcz
	movl	$LC14, (%esp)
	call	__ZL9STL_PrintPKcz
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.def	__ZL12StackReallocP5Stack;	.scl	3;	.type	32;	.endef
__ZL12StackReallocP5Stack:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L41
	movl	$331, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L41:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	sall	$2, %eax
	movl	%eax, -16(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_realloc
	movl	8(%ebp), %edx
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L42
	movl	8(%ebp), %eax
	movl	$8, 12(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L43
L42:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	jmp	L44
L45:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$666, (%eax)
	addl	$1, -12(%ebp)
L44:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	-12(%ebp), %eax
	ja	L45
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
L43:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	__ZL14StackReallocUpP5Stack;	.scl	3;	.type	32;	.endef
__ZL14StackReallocUpP5Stack:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 8(%ebp)
	jne	L47
	movl	$378, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L47:
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	%eax, %edx
	jae	L48
	movl	$0, %eax
	jmp	L49
L48:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	leal	(%eax,%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL12StackReallocP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L50
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L49
L50:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
L49:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.def	__ZL16StackReallocDownP5Stack;	.scl	3;	.type	32;	.endef
__ZL16StackReallocDownP5Stack:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	jne	L52
	movl	$402, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L52:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	subl	$1, %eax
	movl	$0, %edx
	shldl	$2, %eax, %edx
	sall	$2, %eax
	movl	8(%ebp), %ecx
	movl	8(%ecx), %ecx
	movl	$0, %ebx
	cmpl	%ebx, %edx
	ja	L53
	cmpl	%ebx, %edx
	jb	L58
	cmpl	%ecx, %eax
	ja	L53
L58:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$1, %eax
	jne	L55
L53:
	movl	$0, %eax
	jmp	L56
L55:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	shrl	%eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL12StackReallocP5Stack
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L57
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	jmp	L56
L57:
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
L56:
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.section .rdata,"dr"
LC15:
	.ascii "fmt\0"
LC16:
	.ascii "a\0"
	.text
	.def	__ZL9STL_PrintPKcz;	.scl	3;	.type	32;	.endef
__ZL9STL_PrintPKcz:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 8(%ebp)
	jne	L60
	movl	$426, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC15, (%esp)
	call	__assert
L60:
	movl	$LC16, 4(%esp)
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
LFE17:
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
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	__Z13StackPrintErrPK5Stack;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
	.def	_realloc;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
