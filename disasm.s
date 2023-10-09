	.file	"disasm.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "wb\0"
LC1:
	.ascii "STL v3\0"
LC2:
	.ascii "line = %d\12\0"
	.text
	.globl	__Z8BinToASMPKcS0_
	.def	__Z8BinToASMPKcS0_;	.scl	2;	.type	32;	.endef
__Z8BinToASMPKcS0_:
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
	movl	-24(%ebp), %eax
	movl	(%eax), %eax
	movl	$6, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	%eax, (%esp)
	call	_strncmp
	testl	%eax, %eax
	je	L4
	movl	$4, (%esp)
	call	__Z21STL_SpuStructErrPrinti
	movl	$4, %eax
	jmp	L11
L4:
	movl	$1, -12(%ebp)
	jmp	L6
L7:
	movl	-24(%ebp), %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z14TranslateToASMP6_iobufP6String
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	je	L6
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z21STL_SpuStructErrPrinti
LEHE0:
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-20(%ebp), %eax
	jmp	L11
L6:
	movl	-28(%ebp), %eax
	cmpl	-12(%ebp), %eax
	jg	L7
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	$0, %eax
	jmp	L11
L10:
	movl	%eax, (%esp)
LEHB1:
	call	__Unwind_Resume
LEHE1:
L11:
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
	.uleb128 L10-LFB8
	.uleb128 0
	.uleb128 LEHB1-LFB8
	.uleb128 LEHE1-LEHB1
	.uleb128 0
	.uleb128 0
LLSDACSE8:
	.text
	.section .rdata,"dr"
LC3:
	.ascii "%c\0"
LC4:
	.ascii "%s \0"
LC5:
	.ascii "\12\0"
	.text
	.globl	__Z14TranslateToASMP6_iobufP6String
	.def	__Z14TranslateToASMP6_iobufP6String;	.scl	2;	.type	32;	.endef
__Z14TranslateToASMP6_iobufP6String:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$1024, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	movl	$0, -16(%ebp)
	movl	$48, -1016(%ebp)
	leal	-1012(%ebp), %ebx
	movl	$0, %eax
	movl	$249, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	leal	-16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	%eax, (%esp)
	call	_sscanf
	movl	-16(%ebp), %eax
	subl	$33, %eax
	movl	__ZL8funcText(,%eax,4), %eax
	movl	%eax, 8(%esp)
	movl	$LC4, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z9STL_PrintP6_iobufPKcz
	movl	$1, -12(%ebp)
	jmp	L13
L14:
	movl	12(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z9STL_PrintP6_iobufPKcz
	addl	$1, -12(%ebp)
L13:
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	%eax, %edx
	jb	L14
	movl	$LC5, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z9STL_PrintP6_iobufPKcz
	movl	$0, %eax
	addl	$1024, %esp
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
	.section .rdata,"dr"
LC6:
	.ascii "disasm.cpp\0"
LC7:
	.ascii "fmt\0"
	.text
	.globl	__Z9STL_PrintP6_iobufPKcz
	.def	__Z9STL_PrintP6_iobufPKcz;	.scl	2;	.type	32;	.endef
__Z9STL_PrintP6_iobufPKcz:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	cmpl	$0, 12(%ebp)
	jne	L17
	movl	$66, 8(%esp)
	movl	$LC6, 4(%esp)
	movl	$LC7, (%esp)
	call	__assert
L17:
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
	.def	__Z22STL_SplitFileIntoLinesP4FilePKc;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_strncmp;	.scl	2;	.type	32;	.endef
	.def	__Z21STL_SpuStructErrPrinti;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	__Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_sscanf;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_vfprintf;	.scl	2;	.type	32;	.endef
