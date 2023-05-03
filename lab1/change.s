	.file	"lab1.c"
	.text
	.globl	rdtsc
	.type	rdtsc, @function
rdtsc:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 11 "lab1.c" 1
	rdtsc
	shl $32, %rdx
	or %rdx, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	rdtsc, .-rdtsc
	.globl	heatMem
	.type	heatMem, @function
heatMem:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	$8000, %edi
	call	malloc
	movq	%rax, -48(%rbp)
	movl	$8000, %edi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$8000, %edi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L4
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$4000, %edi
	call	malloc
	movq	%rax, (%rbx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$4000, %edi
	call	malloc
	movq	%rax, (%rbx)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$4000, %edi
	call	malloc
	movq	%rax, (%rbx)
	addl	$1, -20(%rbp)
.L4:
	cmpl	$999, -20(%rbp)
	jle	.L5
	movl	$0, -24(%rbp)
	jmp	.L6
.L9:
	movl	$0, -28(%rbp)
	jmp	.L7
.L8:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$1, (%rax)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$2, (%rax)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$0, (%rax)
	addl	$1, -28(%rbp)
.L7:
	cmpl	$999, -28(%rbp)
	jle	.L8
	addl	$1, -24(%rbp)
.L6:
	cmpl	$999, -24(%rbp)
	jle	.L9
	movl	$0, -32(%rbp)
	jmp	.L10
.L15:
	movl	$0, -36(%rbp)
	jmp	.L11
.L14:
	movl	$0, -40(%rbp)
	jmp	.L12
.L13:
	movl	-32(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rdx), %rdx
	movl	-36(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rdx
	movl	(%rdx), %ecx
	movl	-32(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rsi
	movq	-48(%rbp), %rdx
	addq	%rsi, %rdx
	movq	(%rdx), %rdx
	movl	-40(%rbp), %esi
	movslq	%esi, %rsi
	salq	$2, %rsi
	addq	%rsi, %rdx
	movl	(%rdx), %esi
	movl	-40(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rdi
	movq	-56(%rbp), %rdx
	addq	%rdi, %rdx
	movq	(%rdx), %rdx
	movl	-36(%rbp), %edi
	movslq	%edi, %rdi
	salq	$2, %rdi
	addq	%rdi, %rdx
	movl	(%rdx), %edx
	imull	%esi, %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addl	$1, -40(%rbp)
.L12:
	cmpl	$999, -40(%rbp)
	jle	.L13
	addl	$1, -36(%rbp)
.L11:
	cmpl	$999, -36(%rbp)
	jle	.L14
	addl	$1, -32(%rbp)
.L10:
	cmpl	$999, -32(%rbp)
	jle	.L15
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	heatMem, .-heatMem
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"result.txt"
.LC2:
	.string	"%ld ticks\n"
.LC3:
	.string	"addsd latency: %lf\n\n"
.LC4:
	.string	"addsd throughput: %lf\n\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	movq	%rax, -80(%rbp)
	movl	$15, -88(%rbp)
	movl	$15, -92(%rbp)
	movl	$1, -4(%rbp)
	movl	$3, -96(%rbp)
        movl	$1000000, -84(%rbp)
	call	heatMem
     
        movsd	-96(%rbp), %xmm0
        movsd	-4(%rbp), %xmm1
        movsd	-104(%rbp), %xmm2
        movl	-84(%rbp), %ebx
        
       	call	rdtsc
        movq	%rax, %xmm2
	movl	$0, %eax
       	jmp	.L17
.L18:
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
        addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
        addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm1
	addl	$1, %eax
.L17:
	cmpl	%ebx, %eax
	jl	.L18
	movl	$0, %eax
	call	rdtsc
	movq	%rax, -112(%rbp)
	movq	%xmm2, %rax
	movq	-112(%rbp), %rdx
	subq	%rax, %rdx
	movq	-80(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	%xmm2, %rax
	movq	-112(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	testq	%rax, %rax
	js	.L19
	cvtsi2sdq	%rax, %xmm0
	jmp	.L20
.L19:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L20:
	cvtsi2sd	-84(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	cvtsi2sd	-88(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movq	-80(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf
	movl	$1, -12(%rbp)
	movl	$2, -16(%rbp)
	movl	$3, -20(%rbp)
	movl	$4, -24(%rbp)
	movl	$5, -28(%rbp)
	movl	$6, -32(%rbp)
	movl	$7, -36(%rbp)
	movl	$8, -40(%rbp)
	movl	$9, -44(%rbp)
	movl	$10, -48(%rbp)
	movl	$11, -52(%rbp)
	movl	$12, -56(%rbp)
	movl	$13, -60(%rbp)
	movl	$14, -64(%rbp)
	movl	$15, -68(%rbp)
	movl	$0, %eax
        movsd   -96(%rbp), %xmm0
        movsd   -12(%rbp), %xmm1
        movsd   -16(%rbp), %xmm2
        movsd   -20(%rbp), %xmm3
        movsd   -24(%rbp), %xmm4
        movsd   -28(%rbp), %xmm5
        movsd   -32(%rbp), %xmm6
        movsd   -36(%rbp), %xmm7
        movsd   -40(%rbp), %xmm8
        movsd   -44(%rbp), %xmm9
        movsd   -48(%rbp), %xmm10
        movsd   -52(%rbp), %xmm11
        movsd   -56(%rbp), %xmm12
        movsd   -60(%rbp), %xmm13
        movsd   -64(%rbp), %xmm14
        movsd   -68(%rbp), %xmm15

	call	rdtsc
	movq	%rax, -104(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L21
.L22:
	addsd	%xmm0, %xmm1
	addsd	%xmm0, %xmm2
	addsd	%xmm0, %xmm3
	addsd	%xmm0, %xmm4
	addsd	%xmm0, %xmm5
	addsd	%xmm0, %xmm6
	addsd	%xmm0, %xmm7
	addsd	%xmm0, %xmm8
	addsd	%xmm0, %xmm9
	addsd	%xmm0, %xmm10
	addsd	%xmm0, %xmm11
	addsd	%xmm0, %xmm12
	addsd	%xmm0, %xmm13
	addsd	%xmm0, %xmm14
	addsd	%xmm0, %xmm15
	addl	$1, -72(%rbp)
.L21:
	movl	-72(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L22
	movl	$0, %eax
	call	rdtsc
	movq	%rax, -112(%rbp)
	movq	-104(%rbp), %rax
	movq	-112(%rbp), %rdx
	subq	%rax, %rdx
	movq	-80(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-104(%rbp), %rax
	movq	-112(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	testq	%rax, %rax
	js	.L23
	cvtsi2sdq	%rax, %xmm0
	jmp	.L24
.L23:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L24:
	cvtsi2sd	-84(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	cvtsi2sd	-92(%rbp), %xmm1
	divsd	%xmm1, %xmm0
	movq	-80(%rbp), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
