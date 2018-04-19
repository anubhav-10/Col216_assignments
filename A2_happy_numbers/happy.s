	.equ SWI_Exit, 0x11
	.equ SWI_Open, 0x66  @ File open
	.equ SWI_Close, 0x68 @ File close
	.equ SWI_PrInt, 0x6b @ print integer
	.equ SWI_PrStr, 0x69 @ string

	.text
		divide:
			mov r1,#0
			loop1:
				cmp r0,#10
				blt exit_loop1
				add r1,r1,#1
				sub r0,r0,#10
				b loop1
			exit_loop1:
			bx lr

		numSquareSum:
			mov r2,#0
			loop2:
				@cmp r0,#0
				@ble exit_loop2
				stmfd sp!,{lr}
				bl divide
				ldmfd sp!,{lr}
				mul r7,r0,r0
				add r2,r2,r7
				mov r0,r1
				cmp r0,#0
				bne loop2
			@exit_loop2:
			bx lr	

		happynumber:	
					@r0 in entered as input

			@digit sum in r2
			mov r5, r0 		@slow
			mov r6, r0 		@fast

			loop:
				
				@starting with slow
				stmfd sp! ,{lr}
				mov r0, r5
				mov lr,pc
				b numSquareSum
				mov r5, r2
				ldmfd sp!,{lr}

				@starting with fast
				stmfd sp! ,{lr}
				mov r0, r6
				mov lr,pc
				b numSquareSum
				ldmfd sp!,{lr}

				mov r0, r2
				stmfd sp! ,{lr}
				mov lr,pc
				b numSquareSum
				mov r6, r2
				ldmfd sp!,{lr}

				cmp r5, r6
				bne loop

			bx lr

		main: 

			ldr r0,=OutFile
			mov r1,#1
			swi SWI_Open
			ldr r1,=OutFileHandle
			str r0, [r1]

			mov r9,#1
			happy:
				mov r0,r9 
				mov r8,r0
				mov lr,pc
				b happynumber
				cmp r5,#1
					bne quit

					@printing starts
					ldr r0,=OutFileHandle
					ldr r0, [r0]
					mov r1,r8
					swi SWI_PrInt
					ldr r1,=A
					swi SWI_PrStr
					@printing ends
				quit:
				add r9,r9,#1
				mov r8,#10
				mul r7,r8,r8
				cmp r9,r7
				blt happy
			@cmp r5, #1
			@be
			ldr r0, =OutFile
			ldr r0, [r0]
			swi SWI_Close
	.data
		A: .asciz "\n"
		OutFile: .asciz "output.txt"
		OutFileHandle: .word 0

	swi SWI_Exit