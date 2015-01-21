.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	subl $12,%esp		# make stack space for 3 variables

	call input
	movl %eax, -4(%ebp) # tmp0 is in -4(%ebp)

	movl -4(%ebp), %eax
	negl %eax
	movl %eax, -8(%ebp) # tmp1 is in -8(%ebp)

	movl -8(%ebp), %eax
	addl $2, %eax
	movl %eax, -12(%ebp) # tmp2 is in -12(%ebp)

	pushl -12(%ebp)
	call print_int_nl
	addl $4, %esp # push the argument on the stack

	movl $0, %eax
	leave
	ret
