	.equ SWI_Exit, 0x11
	.text

		arr: .word 4, 10, 6, 19, 3, 12, 35, 67
		ldr r1, =arr
		mov r6,r1	@r6 = n-1
		add r6,r6,#28
		mov r5,r1	@r5 = n
		add r5,r5,#32
loop1:	mov r2,r1	@r1 = i and r2 = j
		add r2,r2,#4

loop2:	ldr r3,[r1]
		ldr r4,[r2]
		cmp r4,r3
		bge dontswap
			str r3,[r2]
			str r4,[r1]

dontswap:
		
		add r2,r2,#4
		cmp r2,r5
		blt loop2
		add r1,r1,#4
		cmp r1,r6
		blt loop1

		ldr r2,=arr
printArray:
		mov r0,#1
		ldr r1,[r2]
		swi 0x6b	
		add r2,r2,#4
		cmp r2,r5
		blt printArray	

		@ldr r7, =arr
		@ldr r8, [r7,#8]

	swi SWI_Exit
	.data
AA:	.space 400
	.end