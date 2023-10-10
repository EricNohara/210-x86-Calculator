	.intel_syntax noprefix
	.section .data
	.section .text
	.global AND_FUNC
AND_FUNC:
	mov rcx, QWORD PTR [rbx]	#move value in memory at rbx to rcx
	and rax, rcx		#and operation rax, rcx, stored in rax
	ret
