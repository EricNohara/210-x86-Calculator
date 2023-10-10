	.intel_syntax noprefix
	.section .data
	.global SUM_POSITIVE
SUM_POSITIVE:
	.quad 0x00	#differentiate SUM_POSITIVE from SUM_NEGATIVE
	.global SUM_NEGATIVE
SUM_NEGATIVE:
	.quad 0x00	#add to specify the sixe of memory
	.section .text
	.global SUM_FUNC
SUM_FUNC:
	mov rcx, QWORD PTR [rbx]	#move value at location rbx to rcx
	add rax, rcx	#add operation on rax, rcx, stored in rax
	cmp rcx, 0	#compare rcx with 0
	jl ADD_SUM_NEG	#jump if less than
ADD_SUM_POS:
	add QWORD PTR [SUM_POSITIVE], rcx	#add rcx to SUM_POSITIVE
	jmp DONE	#jump past ADD_SUM_NEGATIVE
ADD_SUM_NEG:
	add QWORD PTR [SUM_NEGATIVE], rcx
DONE:
	ret
