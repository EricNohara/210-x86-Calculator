	.intel_syntax noprefix
	.section .data
	.global STRING_VALUE	#set location to store the string value
FINAL_VALUE:
	.quad 0			#set aside 8 bytes
	.section .text
	.global ATOQ_FUNC
ATOQ_FUNC:
	push rbx	#save pointer stored in rbx for later use
	mov rbx, QWORD PTR [rbx]	#move the address to rbx
	mov r11, rbx	#store beginning of string address
	xor rdx, rdx	# rdx stores the value of the current digit
	xor r9, r9	#r9 stores the number of digits
	xor r8, r8	#if r8 = 0, then positive, else negative
	mov r10, 1	#r10 is the counter for the TRUE_VALUE loop
SIGN_CHECK:
	cmp BYTE PTR [rbx], '-'	#check if number is negative
	jne DIGIT_COUNT
NEGATIVE:
	mov r8, 1
	inc rbx		#move to next ASCii value
	jmp DIGIT_COUNT
RESET_POINTER:
	mov rbx, r11	#reset rbx to point to beginning of the string
	add rbx, r8	#add one if negative
	ret
DIGIT_COUNT:
	cmp BYTE PTR [rbx], '0'	#check if not in digits 0-9
	jb NEXT_STEP
	cmp BYTE PTR [rbx], '9'	#check if not in digits 0-9
	ja NEXT_STEP
	inc r9
	inc rbx
	jmp DIGIT_COUNT
NEXT_STEP:
	call RESET_POINTER	#reset rbx before next loop
FIND_VALUE:
	cmp BYTE PTR [rbx], '0'	#check if not in digits 0-9
	jb DONE
	cmp BYTE PTR [rbx], '9'	#check if not in digits 0-9
	ja DONE
	mov dl, BYTE PTR [rbx]
	sub rdx, '0'    #store the digit of the ASCii number in rdx
	call TRUE_VALUE
	add QWORD PTR[FINAL_VALUE], rdx	#add value of the digit to final value
	inc rbx
	xor rdx, rdx	#reset rdx
	jmp FIND_VALUE	#close the loop
TRUE_VALUE:
	cmp r10, r9	#compare counter to number of digits
	jge RETURN
	imul rdx, 10	#multiply by correct power of ten for the digit
	inc r10		#increment counter
	jmp TRUE_VALUE	#close the loop
RETURN:
	mov r10, 1	#reset counter
	dec r9		#decrement digit count
	cmp r8, 1
	jne POSITIVE
FLIP_SIGN:
	imul rdx, -1	#flip the sign if the number is supposed to be neg
	ret
POSITIVE:
	ret
DONE:
	mov rbx, OFFSET FINAL_VALUE	#point rbx to the value of the string
	call SUM_FUNC
	pop rbx		#restore rbx to correct pointer
	xor r10, r10
	xor r9, r9
	xor r8, r8
	mov QWORD PTR [FINAL_VALUE], 0x00	#reset the final value
	ret
