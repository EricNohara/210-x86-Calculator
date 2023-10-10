	.intel_syntax noprefix
	.section .data
	.section .text
	.global LISTSUM_FUNC
LISTSUM_FUNC:
	push rbx	#save pointer for later use
	mov rbx, QWORD PTR [rbx]
LOOP:
	call SUM_FUNC
	add rbx, 8	#move to address of next item in list
	cmp QWORD PTR [rbx], 0	#see if at the end of the list
	je DONE		#if next address = 0, exit loop
	mov rbx, QWORD PTR [rbx]	#move to next item in list
	jmp LOOP	#close the loop
DONE:
	pop rbx		#restore correct pointer to rbx
	ret
