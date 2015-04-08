# preamble

.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	subl $8, %esp
	pushl %ebx
	pushl %esi
	pushl %edi
	movl $0, %ebx
	pushl %ebx
	movl $0, %ebx
	call inject_int
	jne else0
	call inject_int
	jmp endif0
else0:
	call inject_bool
	jne else1
	call inject_bool
	jmp endif1
else1:
	call inject_big
	jne else2
	call inject_big
	jmp endif2
else2:
	call inject_big
	jne else3
	call inject_big
	jmp endif3
else3:
endif3:
endif2:
endif1:
endif0:
	movl %eax, %ecx
	addl $4, %esp
	movl %ecx, %esi
	movl %esi, %edx
	pushl %edx
	call print_any
	addl $4, %esp
	movl $0, %esi
	movl %esi, %eax
	popl %edi
	popl %esi
	popl %ebx
	addl $8, %esp
	leave
	ret
