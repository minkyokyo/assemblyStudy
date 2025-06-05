		AREA ARMex,	CODE,	READONLY
			ENTRY

; unrolling 기법
Main
		LDR r0, Temp ;주소 저장
		
		MOV r1, #1 ; #1을 r1에 저장.
		
		ADD r2, r2, r1, LSL #3
		ADD r2, r2, r1
		; r2=9
		
		; 11 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 9 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 13 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 11 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 15 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 13 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 17 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 15 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 19 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 17 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 21 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 19 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 23 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 21 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 25 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 23 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 27 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 25 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 29 더하기
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 27 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		

Temp DCD &00004000

Endline
		STR r3, [r0]
		END
