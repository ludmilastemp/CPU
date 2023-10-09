	.file	"STL_spu.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "STL v3\0"
LC1:
	.ascii "line = %d\12\0"
	.text
	.globl	__Z3SPUPKc
	.def	__Z3SPUPKc;	.scl	2;	.type	32;	.endef
__Z3SPUPKc:
LFB8:
	.cfi_startproc
	.cfi_personality 0,___gxx_personality_v0
	.cfi_lsda 0,LLSDA8
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$80, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	leal	-36(%ebp), %edx
	movl	$0, %ecx
	movl	$24, %eax
	andl	$-4, %eax
	movl	%eax, %ebx
	movl	$0, %eax
L2:
	movl	%ecx, (%edx,%eax)
	addl	$4, %eax
	cmpl	%ebx, %eax
	jb	L2
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-36(%ebp), %eax
	movl	%eax, (%esp)
LEHB0:
	call	__Z22STL_SplitFileIntoLinesP4FilePKc
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	$6, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	je	L4
	movl	$4, (%esp)
	call	__Z21STL_SpuStructErrPrinti
	movl	$4, %eax
	jmp	L12
L4:
	leal	-72(%ebp), %ebx
	movl	$0, %eax
	movl	$9, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z17STL_SpuStructCtorP10SPU_Struct
	movl	$1, -12(%ebp)
	jmp	L6
L8:
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	leal	-72(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__ZL11ExecuteFuncPKcP10SPU_Struct
	movl	%eax, -40(%ebp)
	movl	-40(%ebp), %eax
	testl	%eax, %eax
	je	L7
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z21STL_SpuStructErrPrinti
LEHE0:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	-40(%ebp), %eax
	jmp	L12
L7:
	addl	$1, -12(%ebp)
L6:
	movl	-20(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L8
	movl	$0, %eax
	jmp	L12
L11:
	movl	%eax, (%esp)
LEHB1:
	call	__Unwind_Resume
LEHE1:
L12:
	addl	$80, %esp
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
	.def	___gxx_personality_v0;	.scl	2;	.type	32;	.endef
	.section	.gcc_except_table,"w"
LLSDA8:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 LLSDACSE8-LLSDACSB8
LLSDACSB8:
	.uleb128 LEHB0-LFB8
	.uleb128 LEHE0-LEHB0
	.uleb128 L11-LFB8
	.uleb128 0
	.uleb128 LEHB1-LFB8
	.uleb128 LEHE1-LEHB1
	.uleb128 0
	.uleb128 0
LLSDACSE8:
	.text
	.section .rdata,"dr"
LC2:
	.ascii "%c\0"
LC3:
	.ascii "%d\0"
LC4:
	.ascii "r%[abcd]x%n\0"
LC5:
	.ascii "\12Please, enter var: \0"
LC6:
	.ascii "OUT = %d\12\0"
	.text
	.def	__ZL11ExecuteFuncPKcP10SPU_Struct;	.scl	3;	.type	32;	.endef
__ZL11ExecuteFuncPKcP10SPU_Struct:
LFB9:
	.cfi_startproc
	.cfi_personality 0,___gxx_personality_v0
	.cfi_lsda 0,LLSDA9
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	$0, -12(%ebp)
	movl	$0, -16(%ebp)
	movl	$0, -20(%ebp)
	leal	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC2, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_sscanf
	movl	-12(%ebp), %eax
	subl	$33, %eax
	cmpl	$11, %eax
	ja	L14
	movl	L16(,%eax,4), %eax
	jmp	*%eax
	.section .rdata,"dr"
	.align 4
L16:
	.long	L15
	.long	L17
	.long	L18
	.long	L19
	.long	L20
	.long	L21
	.long	L22
	.long	L23
	.long	L24
	.long	L25
	.long	L26
	.long	L27
	.text
L15:
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	leal	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	%edx, (%esp)
	call	_sscanf
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L28
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
LEHB2:
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L29
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
LEHE2:
L29:
	jmp	L30
L28:
	movl	$0, -24(%ebp)
	movl	$0, -28(%ebp)
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	leal	-28(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	%edx, (%esp)
	call	_sscanf
	movl	-28(%ebp), %eax
	cmpl	$3, %eax
	jne	L31
	movl	-24(%ebp), %eax
	cmpl	$97, %eax
	jne	L32
	movl	12(%ebp), %eax
	movl	16(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
LEHB3:
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L32
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L32:
	movl	-24(%ebp), %eax
	cmpl	$98, %eax
	jne	L33
	movl	12(%ebp), %eax
	movl	20(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L33
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L33:
	movl	-24(%ebp), %eax
	cmpl	$99, %eax
	jne	L34
	movl	12(%ebp), %eax
	movl	24(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L34
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L34:
	movl	-24(%ebp), %eax
	cmpl	$100, %eax
	jne	L35
	movl	12(%ebp), %eax
	movl	28(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L35
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
LEHE3:
	jmp	L35
L31:
	movl	$2, %eax
	jmp	L71
L35:
	jmp	L30
L17:
	movl	$0, -32(%ebp)
	movl	$0, -36(%ebp)
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	leal	-36(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	%edx, (%esp)
	call	_sscanf
	movl	-36(%ebp), %eax
	cmpl	$3, %eax
	jne	L37
	movl	-32(%ebp), %eax
	cmpl	$97, %eax
	jne	L38
	movl	12(%ebp), %eax
	leal	16(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
LEHB4:
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L38
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L38:
	movl	-32(%ebp), %eax
	cmpl	$98, %eax
	jne	L39
	movl	12(%ebp), %eax
	leal	20(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L39
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L39:
	movl	-32(%ebp), %eax
	cmpl	$99, %eax
	jne	L40
	movl	12(%ebp), %eax
	leal	24(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L40
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L40:
	movl	-32(%ebp), %eax
	cmpl	$100, %eax
	jne	L41
	movl	12(%ebp), %eax
	leal	28(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L41
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
LEHE4:
	jmp	L41
L37:
	movl	$2, %eax
	jmp	L71
L41:
	jmp	L30
L18:
	movl	12(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
LEHB5:
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L42
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L42:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L43
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L43:
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L44
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L44:
	jmp	L30
L19:
	movl	12(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L45
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L45:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L46
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L46:
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	subl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L47
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L47:
	jmp	L30
L20:
	movl	12(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L48
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L48:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L49
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L49:
	movl	-16(%ebp), %edx
	movl	-20(%ebp), %eax
	imull	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L50
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L50:
	jmp	L30
L21:
	movl	12(%ebp), %eax
	leal	-20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L51
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L51:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L52
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L52:
	movl	-20(%ebp), %eax
	testl	%eax, %eax
	jne	L53
	movl	$2, %eax
	jmp	L71
L53:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L54
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L54:
	jmp	L30
L22:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L55
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L55:
	movl	-16(%ebp), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fstpl	(%esp)
	call	_sqrt
	fnstcw	-46(%ebp)
	movzwl	-46(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -48(%ebp)
	fldcw	-48(%ebp)
	fistpl	-44(%ebp)
	fldcw	-46(%ebp)
	movl	-44(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L56
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L56:
	jmp	L30
L23:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L57
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L57:
	movl	-16(%ebp), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fstpl	(%esp)
	call	_sin
	fnstcw	-46(%ebp)
	movzwl	-46(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -48(%ebp)
	fldcw	-48(%ebp)
	fistpl	-44(%ebp)
	fldcw	-46(%ebp)
	movl	-44(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L58
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L58:
	jmp	L30
L24:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L59
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L59:
	movl	-16(%ebp), %eax
	movl	%eax, -44(%ebp)
	fildl	-44(%ebp)
	fstpl	(%esp)
	call	_cos
	fnstcw	-46(%ebp)
	movzwl	-46(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -48(%ebp)
	fldcw	-48(%ebp)
	fistpl	-44(%ebp)
	fldcw	-46(%ebp)
	movl	-44(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L60
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L60:
	jmp	L30
L25:
	movl	$LC5, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_scanf
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z13STL_StackPushP5Stacki
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L61
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L61:
	jmp	L30
L26:
	movl	12(%ebp), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z12STL_StackPopP5StackPi
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L62
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13StackPrintErrPK5Stack
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z13STL_StackDumpPK5Stack
L62:
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC6, (%esp)
	call	_printf
	jmp	L30
L27:
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z17STL_SpuStructDtorP10SPU_Struct
LEHE5:
	movl	$0, %eax
	jmp	L71
L14:
	movl	$1, %eax
	jmp	L71
L30:
	movl	$0, %eax
	jmp	L71
L68:
	jmp	L65
L69:
	jmp	L65
L67:
L65:
	movl	%eax, (%esp)
LEHB6:
	call	__Unwind_Resume
LEHE6:
L71:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.section	.gcc_except_table,"w"
LLSDA9:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 LLSDACSE9-LLSDACSB9
LLSDACSB9:
	.uleb128 LEHB2-LFB9
	.uleb128 LEHE2-LEHB2
	.uleb128 L67-LFB9
	.uleb128 0
	.uleb128 LEHB3-LFB9
	.uleb128 LEHE3-LEHB3
	.uleb128 L68-LFB9
	.uleb128 0
	.uleb128 LEHB4-LFB9
	.uleb128 LEHE4-LEHB4
	.uleb128 L69-LFB9
	.uleb128 0
	.uleb128 LEHB5-LFB9
	.uleb128 LEHE5-LEHB5
	.uleb128 L67-LFB9
	.uleb128 0
	.uleb128 LEHB6-LFB9
	.uleb128 LEHE6-LEHB6
	.uleb128 0
	.uleb128 0
LLSDACSE9:
	.text
	.section .rdata,"dr"
LC8:
	.ascii "STL_spu.cpp\0"
LC9:
	.ascii "fmt\0"
	.text
	.def	__ZL9STL_PrintP6_iobufPKcz;	.scl	3;	.type	32;	.endef
__ZL9STL_PrintP6_iobufPKcz:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 12(%ebp)
	jne	L73
	movl	$162, 8(%esp)
	movl	$LC8, 4(%esp)
	movl	$LC9, (%esp)
	call	__assert
L73:
	movl	$0, -12(%ebp)
	leal	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_vfprintf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
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
LC10:
	.ascii "push\0"
LC11:
	.ascii "pop\0"
LC12:
	.ascii "add\0"
LC13:
	.ascii "sub\0"
LC14:
	.ascii "mul\0"
LC15:
	.ascii "div\0"
LC16:
	.ascii "sqrt\0"
LC17:
	.ascii "sin\0"
LC18:
	.ascii "cos\0"
LC19:
	.ascii "in\0"
LC20:
	.ascii "OUT\0"
LC21:
	.ascii "HLT\0"
	.align 32
__ZL8funcText:
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
	.long	LC20
	.long	LC21
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
	.def	__Z22STL_SplitFileIntoLinesP4FilePKc;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
	.def	__Z21STL_SpuStructErrPrinti;	.scl	2;	.type	32;	.endef
	.def	__Z17STL_SpuStructCtorP10SPU_Struct;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	__Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_sscanf;	.scl	2;	.type	32;	.endef
	.def	__Z13STL_StackPushP5Stacki;	.scl	2;	.type	32;	.endef
	.def	__Z13StackPrintErrPK5Stack;	.scl	2;	.type	32;	.endef
	.def	__Z13STL_StackDumpPK5Stack;	.scl	2;	.type	32;	.endef
	.def	__Z12STL_StackPopP5StackPi;	.scl	2;	.type	32;	.endef
	.def	_sqrt;	.scl	2;	.type	32;	.endef
	.def	_sin;	.scl	2;	.type	32;	.endef
	.def	_cos;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	__Z17STL_SpuStructDtorP10SPU_Struct;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
