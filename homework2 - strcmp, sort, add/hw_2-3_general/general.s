		AREA ARMex,	CODE,	READONLY
			ENTRY

Main
		LDR r0, Temp ;주소 저장
		
		MOV r1, #1 ; #1을 r1에 저장.
		 
		ADD r2, r1, LSL #3 ; r2=8
		ADD r2, r2, r1, LSL #1
		; r2=10, 일반식 n(n+10)에 들어갈 n은 10이다
		
		ADD r3, r2, r2 ; r3= r2+r2  (10+10)
		MUL r4, r3, r2; ; r3 = r3*10
		

Temp DCD &00004000

Endline
		STR r4, [r0]
		END
