	.intel_syntax noprefix
	.section .data
	.section .text
	.global OR_FUNC
OR_FUNC:
	mov rcx, QWORD PTR [rbx]	#move memory value at rbx to rcx
	or rax, rcx	#or operation on rax, rcx, store in rax
	ret
	
