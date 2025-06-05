		AREA 	Problem3, CODE, READONLY
			ENTRY

start
	LDR sp, sAddress
	LDR r11, Address1
	
	MOV r0, #10
	MOV r1, #11
	MOV r2, #12
	MOV r3, #13
	MOV r4, #14
	MOV r5, #15
	MOV r6, #16
	MOV r7, #17
	
	MOV r10, r4 ; r4값 저장
	
	STMFD sp!, {r0-r7} ; 낮은 레지스터가 낮은 주소로 간다. sp는 7*4 만큼 감소.
	BL doRegister ; LR에 BL다음에 실행될 명령어의 주소 저장
	MOV r9 , #160 ; doGCD에 전달할 160을 r9에 저장
	BL doGCD
	ADD r8, r8, r10 ; 최대공약수와 변경되기 전 r4를 더함.
	STR r8, [r11] ; 메모리에 저장
	
	MOV pc,#0 ;끝

doRegister
	; 문제 2와 같이 register들의 값 copy
	LDMFD sp!, {r1}
	LDMFD sp!, {r6}
	LDMFD sp!, {r0}
	LDMFD sp!, {r2}
	LDMFD sp!, {r7}
	LDMFD sp!, {r3-r5}
	; 각 register의 값과 register의 index를 더한 후, r0-r7의 값 return

	ADD r8, r8, r0
	ADD r8, r8, r1
	ADD r8, r8, r2
	ADD r8, r8, r3
	ADD r8, r8, r4
	ADD r8, r8, r5
	ADD r8, r8, r6
	ADD r8, r8, r7
	ADD r8, r8,#28
	
	MOV pc, lr ; doRegister를 호출한 명령어의 다음 명령어를 pc에 넣음.
	
doGCD
	;sum(r8)과 최대 공약수 구하기
	CMP r8, r9
	SUBGT r8,r8,r9 ;r8이 크면 r8= r8-r9
	SUBLT r9, r9, r8 ; r9가 크면 r9=r9-r8
	BNE doGCD 
	MOV pc , lr
	
sAddress DCD &00003000
Address1 DCD &00004000

	END