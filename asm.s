	.file	"asm.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "wb\0"
LC1:
	.ascii "STL v3\12\0"
LC2:
	.ascii "line = %d\12\0"
	.text
	.globl	__Z8ASMToBinPKcS0_
	.def	__Z8ASMToBinPKcS0_;	.scl	2;	.type	32;	.endef
__Z8ASMToBinPKcS0_:
LFB8:
	.cfi_startproc
	.cfi_personality 0,___gxx_personality_v0
	.cfi_lsda 0,LLSDA8
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	leal	-44(%ebp), %edx
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
	leal	-44(%ebp), %eax
	movl	%eax, (%esp)
LEHB0:
	call	__Z22STL_SplitFileIntoLinesP4FilePKc
	movl	$LC0, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_fopen
	movl	%eax, -16(%ebp)
	movl	$LC1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL9STL_PrintP6_iobufPKcz
	movl	$0, -12(%ebp)
	jmp	L4
L6:
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL14TranslateToSPUP6_iobufP6String
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	L4
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z21STL_SpuStructErrPrinti
LEHE0:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-20(%ebp), %eax
	jmp	L10
L4:
	movl	-28(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L6
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, %eax
	jmp	L10
L9:
	movl	%eax, (%esp)
LEHB1:
	call	__Unwind_Resume
LEHE1:
L10:
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
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
	.uleb128 L9-LFB8
	.uleb128 0
	.uleb128 LEHB1-LFB8
	.uleb128 LEHE1-LEHB1
	.uleb128 0
	.uleb128 0
LLSDACSE8:
	.text
	.section .rdata,"dr"
LC3:
	.ascii "%s\0"
LC4:
	.ascii "%c\0"
LC5:
	.ascii "%d\0"
LC6:
	.ascii "r%[abcd]x%n\0"
LC7:
	.ascii "r%cx\0"
LC8:
	.ascii "\12\0"
	.text
	.def	__ZL14TranslateToSPUP6_iobufP6String;	.scl	3;	.type	32;	.endef
__ZL14TranslateToSPUP6_iobufP6String:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$1040, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	$48, -1024(%ebp)
	leal	-1020(%ebp), %ebx
	movl	$0, %eax
	movl	$249, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	leal	-1024(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	%eax, (%esp)
	call	_sscanf
	movl	$0, -12(%ebp)
	jmp	L12
L15:
	movl	-12(%ebp), %eax
	movl	__ZL8funcText(,%eax,4), %eax
	movl	%eax, 4(%esp)
	leal	-1024(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcmp
	testl	%eax, %eax
	jne	L13
	jmp	L14
L13:
	addl	$1, -12(%ebp)
L12:
	cmpl	$11, -12(%ebp)
	jle	L15
L14:
	cmpl	$12, -12(%ebp)
	jne	L16
	movl	$1, %eax
	jmp	L22
L16:
	movl	-12(%ebp), %eax
	addl	$33, %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL9STL_PrintP6_iobufPKcz
	cmpl	$1, -12(%ebp)
	jg	L18
	movl	$0, -16(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %ebx
	leal	-1024(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	leal	(%ebx,%eax), %edx
	leal	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC5, 4(%esp)
	movl	%edx, (%esp)
	call	_sscanf
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	L19
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL9STL_PrintP6_iobufPKcz
	jmp	L20
L19:
	movl	$0, -20(%ebp)
	movl	$0, -24(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax), %ebx
	leal	-1024(%ebp), %eax
	movl	%eax, (%esp)
	call	_strlen
	addl	$1, %eax
	leal	(%ebx,%eax), %edx
	leal	-24(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC6, 4(%esp)
	movl	%edx, (%esp)
	call	_sscanf
	movl	-24(%ebp), %eax
	cmpl	$3, %eax
	jne	L21
	movl	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$LC7, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL9STL_PrintP6_iobufPKcz
	jmp	L20
L21:
	movl	$2, %eax
	jmp	L22
L20:
L18:
	movl	$LC8, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL9STL_PrintP6_iobufPKcz
	movl	$0, %eax
L22:
	addl	$1040, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.globl	__Z17CheckAntiOverflowPKc
	.def	__Z17CheckAntiOverflowPKc;	.scl	2;	.type	32;	.endef
__Z17CheckAntiOverflowPKc:
LFB10:
	.cfi_startproc
	.cfi_personality 0,___gxx_personality_v0
	.cfi_lsda 0,LLSDA10
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	leal	-44(%ebp), %edx
	movl	$0, %ecx
	movl	$24, %eax
	andl	$-4, %eax
	movl	%eax, %ebx
	movl	$0, %eax
L24:
	movl	%ecx, (%edx,%eax)
	addl	$4, %eax
	cmpl	%ebx, %eax
	jb	L24
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-44(%ebp), %eax
	movl	%eax, (%esp)
LEHB2:
	call	__Z22STL_SplitFileIntoLinesP4FilePKc
LEHE2:
	movl	$0, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	$1, -16(%ebp)
	jmp	L26
L29:
	movl	-24(%ebp), %eax
	movl	-16(%ebp), %edx
	sall	$3, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	subl	$33, %eax
	movl	__ZL7funcArg(,%eax,4), %eax
	addl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jns	L27
	movl	$-1, %eax
	jmp	L34
L27:
	addl	$1, -16(%ebp)
L26:
	movl	-28(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jg	L29
	cmpl	$0, -12(%ebp)
	jle	L30
	movl	$1, %eax
	jmp	L34
L30:
	movl	$0, %eax
	jmp	L34
L33:
	movl	%eax, (%esp)
LEHB3:
	call	__Unwind_Resume
LEHE3:
L34:
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.section	.gcc_except_table,"w"
LLSDA10:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 LLSDACSE10-LLSDACSB10
LLSDACSB10:
	.uleb128 LEHB2-LFB10
	.uleb128 LEHE2-LEHB2
	.uleb128 L33-LFB10
	.uleb128 0
	.uleb128 LEHB3-LFB10
	.uleb128 LEHE3-LEHB3
	.uleb128 0
	.uleb128 0
LLSDACSE10:
	.text
	.section .rdata,"dr"
LC9:
	.ascii "asm.cpp\0"
LC10:
	.ascii "fmt\0"
	.text
	.def	__ZL9STL_PrintP6_iobufPKcz;	.scl	3;	.type	32;	.endef
__ZL9STL_PrintP6_iobufPKcz:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 12(%ebp)
	jne	L36
	movl	$114, 8(%esp)
	movl	$LC9, 4(%esp)
	movl	$LC10, (%esp)
	call	__assert
L36:
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
LFE11:
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
LC11:
	.ascii "push\0"
LC12:
	.ascii "pop\0"
LC13:
	.ascii "add\0"
LC14:
	.ascii "sub\0"
LC15:
	.ascii "mul\0"
LC16:
	.ascii "div\0"
LC17:
	.ascii "sqrt\0"
LC18:
	.ascii "sin\0"
LC19:
	.ascii "cos\0"
LC20:
	.ascii "in\0"
LC21:
	.ascii "OUT\0"
LC22:
	.ascii "HLT\0"
	.align 32
__ZL8funcText:
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
	.long	LC22
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
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	__Z21STL_SpuStructErrPrinti;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	__Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_sscanf;	.scl	2;	.type	32;	.endef
	.def	_strcmp;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
