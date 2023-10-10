	.intel_syntax noprefix
	.section .data
	.section .text
	.global UPPER_FUNC
UPPER_FUNC:
	xor r10, r10	#use the r10 register to store string length
	mov rcx, QWORD PTR [rbx]
LOOP:
	cmp BYTE PTR [rcx], 0
	je LOOP_END
	inc r10		#increment r10 for string length
	cmp BYTE PTR [rcx], 'a'		#check if letter is lowercase
	jb SKIP		#jumps if not a lowercase
	cmp BYTE PTR [rcx], 'z'		#if greater than z, skip
	ja SKIP
	sub BYTE PTR [rcx], 0x20	#convert into upper
	inc rcx		#increment rcx
	jmp LOOP	#jump to beginning of loop
SKIP:
	inc rcx
	jmp LOOP	
LOOP_END:
	add rax, r10	#add length of string to rax
	ret		#return to calc.s
