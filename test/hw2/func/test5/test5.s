.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	subl $52, %esp
	call input
	movl %eax, -4(%ebp)
	movl -4(%ebp), %eax
	movl %eax, -8(%ebp)
	addl $5, -8(%ebp)
	movl -8(%ebp), %eax
	movl %eax, -12(%ebp)
	call input
	movl %eax, -16(%ebp)
	movl -12(%ebp), %eax
	movl %eax, -20(%ebp)
	movl -16(%ebp), %eax
	addl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	movl %eax, -24(%ebp)
	movl $0, -28(%ebp)
	movl -12(%ebp), %eax
	movl %eax, -32(%ebp)
	movl -28(%ebp), %eax
	addl %eax, -32(%ebp)
	movl -32(%ebp), %eax
	movl %eax, -36(%ebp)
	movl -36(%ebp), %eax
	movl %eax, -40(%ebp)
	movl -24(%ebp), %eax
	addl %eax, -40(%ebp)
	call input
	movl %eax, -44(%ebp)
	movl -44(%ebp), %eax
	movl %eax, -48(%ebp)
	negl -48(%ebp)
	movl -40(%ebp), %eax
	movl %eax, -52(%ebp)
	movl -48(%ebp), %eax
	addl %eax, -52(%ebp)
	pushl -52(%ebp)
	call print_int_nl
	addl $4, %esp
	movl $0, %eax
	leave
	ret
