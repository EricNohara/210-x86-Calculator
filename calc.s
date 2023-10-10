	.intel_syntax noprefix
	.section .data
FINAL_VALUE:
	.quad 0x00
	.section .text
	.global _start
_start:
	xor rax, rax	#set the rax register to 0
	#move the address of CALC_DATA_BEGIN to rbx register
	mov rbx, OFFSET CALC_DATA_BEGIN
LOOP:
	cmp BYTE PTR [rbx], 0	#compare value at location in rbx to 0
	je LOOP_END	#exit the loop if first byte of command = 0
AND_TEST:	
	cmp BYTE PTR [rbx], '&' #compare value at location in rbx to '&'
	jne OR_TEST
	add rbx, 8	#advance rbx to command argument (+8 bytes)
	call AND_FUNC
	jmp DONE_COND
OR_TEST:
	cmp BYTE PTR [rbx], '|' #compare value at location in rbx to '|'
	jne SUM_TEST
	add rbx, 8	#advance rbx to command argument (+8 bytes)
	call OR_FUNC
	jmp DONE_COND
SUM_TEST:
	cmp BYTE PTR [rbx], 'S'
	jne UPPER_TEST
	add rbx, 8	#advance rbx to command argument (+8 bytes)
	call SUM_FUNC
	jmp DONE_COND
UPPER_TEST:
	cmp BYTE PTR [rbx], 'U'
	jne ARRAYSUM_TEST
	add rbx, 8
	call UPPER_FUNC
	jmp DONE_COND
ARRAYSUM_TEST:
	cmp BYTE PTR [rbx], 'a'
	jne LISTSUM_TEST
	add rbx, 8
	call ARRAYSUM_FUNC
	jmp DONE_COND
LISTSUM_TEST:
	cmp BYTE PTR [rbx], 'l'
	jne ATOQ_TEST
	add rbx, 8
	call LISTSUM_FUNC
	jmp DONE_COND
ATOQ_TEST:
	cmp BYTE PTR [rbx], 'I'
	jne LOOP_END
	add rbx, 8
	call ATOQ_FUNC
	jmp DONE_COND
DONE_COND:	
	#conditional for upper put here
	call DUMMY_FUNCTION
	jmp LOOP
DUMMY_FUNCTION:
	add rbx, 8	#advance rbx by 8 (to the next command)
	ret
LOOP_END:
	mov FINAL_VALUE, rax	#store value of rax in memory
	#first call to write rax to stout
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET FINAL_VALUE
	mov rdx, 8	#8 is the number of bytes in memory
	syscall
	#second call to write SUM_POSITIVE
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET SUM_POSITIVE
	mov rdx, 8	#number of bytes allocated to SUM_POSITIVE
	syscall
	#third call to write SUM_NEGTIVE
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET SUM_NEGATIVE
	mov rdx, 8      #number of bytes allocated to SUM_POSITIVE
	syscall
	#fourth call to write between CALC_DATA_BEGIN and CALC_DATA_END
	mov r8, OFFSET CALC_DATA_END
	mov r9, OFFSET CALC_DATA_BEGIN
	sub r8, r9	#use r8 and r9 registers to find number of bytes
	mov rax, 1
	mov rdi, 1
	mov rsi, OFFSET CALC_DATA_BEGIN
	mov rdx, r8
	syscall
	#exit the program
	mov rax, 60
	mov rdi, 0
	syscall

	
	
