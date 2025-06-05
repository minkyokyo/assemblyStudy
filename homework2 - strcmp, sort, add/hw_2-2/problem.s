	AREA ARMex, CODE, READONLY
		ENTRY

Main
		LDR r0, =Array1
		ADD r0, r0, #36  ;배열의 끝에서부터 접근하기 위해 주소에 36을 더해줌.
		LDR r1, Address1
		MOV r4, #10 ; 배열 개수
		
Loop		
		LDR r2, [r0], #-4 ; 배열 끝에서부터 4byte씩 감소시킴.
		STR r2, [r1], #4 
		ADD r3, r3, #1 ; loop수 증가
		CMP r3, r4 ; loop수가 10이니?
		BEQ Endline
		B Loop

Endline

Array1 DCD 10,9,8,7,6,5,4,3,2,1

Address1 DCD &00004000

	END