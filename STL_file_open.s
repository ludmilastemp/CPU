	.file	"STL_file_open.cpp"
	.section .rdata,"dr"
LC0:
	.ascii "STL_file_open.cpp\0"
LC1:
	.ascii "file\0"
LC2:
	.ascii "rb\0"
LC3:
	.ascii "file->fp\0"
LC4:
	.ascii "file->buf\0"
	.text
	.globl	__Z9STL_FreadP4File
	.def	__Z9STL_FreadP4File;	.scl	2;	.type	32;	.endef
__Z9STL_FreadP4File:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	subl	$64, %esp
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	cmpl	$0, 8(%ebp)
	jne	L2
	movl	$9, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L2:
	leal	-44(%ebp), %ebx
	movl	$0, %eax
	movl	$9, %edx
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep stosl
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	$LC2, 4(%esp)
	movl	%eax, (%esp)
	call	_fopen
	movl	8(%ebp), %edx
	movl	%eax, 4(%edx)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L3
	movl	$14, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
L3:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	16(%eax), %eax
	leal	-44(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_fstat
	movl	-24(%ebp), %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	addl	$1, %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	L4
	movl	$21, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC4, (%esp)
	call	__assert
L4:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	_fread
	movl	8(%ebp), %edx
	movl	%eax, 12(%edx)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	subl	$1, %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	je	L5
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	addl	%edx, %eax
	movb	$10, (%eax)
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 12(%eax)
L5:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_fclose
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	addl	$64, %esp
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
LC5:
	.ascii "file->strings\0"
	.text
	.globl	__Z22STL_SplitFileIntoLinesP4FilePKc
	.def	__Z22STL_SplitFileIntoLinesP4FilePKc;	.scl	2;	.type	32;	.endef
__Z22STL_SplitFileIntoLinesP4FilePKc:
LFB9:
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
	movl	12(%ebp), %edx
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z9STL_FreadP4File
	movl	8(%ebp), %edx
	movl	%eax, 8(%edx)
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__ZL18CountNumberOfLinesPcj
	movl	8(%ebp), %edx
	movl	%eax, 16(%edx)
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	movl	$8, 4(%esp)
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	jne	L9
	movl	$53, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC5, (%esp)
	call	__assert
L9:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__ZL14SplitIntoLinesP4File
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.def	__ZL18CountNumberOfLinesPcj;	.scl	3;	.type	32;	.endef
__ZL18CountNumberOfLinesPcj:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L12
L13:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	$10, 4(%esp)
	movl	%eax, (%esp)
	call	_strchr
	movl	%eax, -16(%ebp)
	addl	$1, -12(%ebp)
L12:
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	cmpl	-16(%ebp), %eax
	jne	L13
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.def	__ZL14SplitIntoLinesP4File;	.scl	3;	.type	32;	.endef
__ZL14SplitIntoLinesP4File:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	cmpl	$0, 8(%ebp)
	jne	L16
	movl	$76, 8(%esp)
	movl	$LC0, 4(%esp)
	movl	$LC1, (%esp)
	call	__assert
L16:
	movl	$0, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %ecx
	movl	-20(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, (%edx)
	addl	$1, -12(%ebp)
	addl	$1, -20(%ebp)
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	jmp	L17
L18:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	$10, 4(%esp)
	movl	%eax, (%esp)
	call	_strchr
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	-20(%ebp), %ecx
	addl	$1, %ecx
	addl	%ecx, %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %edx
	addl	$536870911, %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %ecx
	sall	$3, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %ebx
	addl	$536870911, %ebx
	sall	$3, %ebx
	addl	%ebx, %eax
	movl	(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	movl	%eax, 4(%edx)
	addl	$1, -20(%ebp)
	addl	$1, -12(%ebp)
L17:
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	addl	$1, %eax
	cmpl	-12(%ebp), %eax
	ja	L18
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %edx
	addl	$536870911, %edx
	sall	$3, %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %ecx
	sall	$3, %ecx
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	-12(%ebp), %ebx
	addl	$536870911, %ebx
	sall	$3, %ebx
	addl	%ebx, %eax
	movl	(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	subl	$1, %eax
	movl	%eax, 4(%edx)
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	__Z10STL_FcloseP4File
	.def	__Z10STL_FcloseP4File;	.scl	2;	.type	32;	.endef
__Z10STL_FcloseP4File:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	movl	8(%ebp), %eax
	movl	$0, 16(%eax)
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.ident	"GCC: (GNU) 4.8.1"
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_fopen;	.scl	2;	.type	32;	.endef
	.def	_fstat;	.scl	2;	.type	32;	.endef
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_fread;	.scl	2;	.type	32;	.endef
	.def	_fclose;	.scl	2;	.type	32;	.endef
	.def	_strchr;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
