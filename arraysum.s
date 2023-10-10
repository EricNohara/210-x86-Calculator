	.intel_syntax noprefix
	.section .data
	.section .text
	.global ARRAYSUM_FUNC
ARRAYSUM_FUNC:
	mov r8, QWORD PTR [rbx]	#copy length of array into r8
	mov r9, 0x00	#set counter to 0
	add rbx, 8	#move to next argument
	push rbx	#save current pointer
	mov rbx, QWORD PTR [rbx]	#copy address of array into rbx
	sub rbx, 8	#set rbx to array address - 8 for the loop to work
LOOP:
	cmp r9, r8	#compare counter to array length
	jge DONE	#exit loop if counter >= arral length
	inc r9		#update counter
	add rbx, 8	#set rbx to the next value in the array
	call SUM_FUNC
	jmp LOOP
DONE:
	xor r8, r8	#reset r8 register
	xor r9, r9	#reset r9 register
	pop rbx		#reset rbx to the correct pointer
	ret		#return
