		AREA 	Problem2, CODE, READONLY
			ENTRY

start
	LDR sp, sAddress
	
	MOV r0, #0
	MOV r1, #1
	MOV r2, #2
	MOV r3, #3
	MOV r4, #4
	MOV r5, #5
	MOV r6, #6
	MOV r7, #7
	
	STMFD sp!, {r0-r7} ; 낮은 레지스터가 낮은 주소로 간다. sp는 7*4 만큼 감소.

	
	LDMFD sp!, {r1}
	LDMFD sp!, {r6}
	LDMFD sp!, {r0}
	LDMFD sp!, {r2}
	LDMFD sp!, {r7}
	LDMFD sp!, {r3-r5}

	MOV pc, #0

sAddress DCD &00003000

	END