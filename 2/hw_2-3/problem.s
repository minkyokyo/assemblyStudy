		AREA ARMex,	CODE,	READONLY
			ENTRY

Main
		LDR r0, Temp ;주소 저장
		
		MOV r1, #1 ; #1을 r1에 저장.
		MOV r2, #10; 연산 횟수는 10.
		
		ADD r3, r1, LSL #3 ; r3=8
		ADD r3, r3, r1 ; r3=9	
			
		
Loop
		ADD r3, r3, r1, LSL #1 ; r3= r3+2
		ADD r4, r4, r3 ; r4=r4+r3
		
		ADD r5,r5,#1
		CMP r5,r2 ;r5-r2 loop가 10인가? 
		BEQ Endline
		B Loop


Temp DCD &00004000

Endline
		STR r4, [r0]
		END
