		AREA Strcpy, CODE, READONLY
			ENTRY
;strcpy는 문자2에 문자1 복사하는 것.

Main
	LDR r0, =Table ;load the address of the table
	LDR r1, =Copied ; load the address of the Copied

Loop
	LDRB r2, [r0], #1 ; load the first byte into R2
	CMP r2, #0 ; 문자열 끝인가??
	BEQ Out ;r2==0이면 loop 아웃
	STR r2, [r1], #1 ;끝이아니면 문자 저장
	B Loop
	
Out
	MOV pc, #0 ;return
	
;=====Data1 area
	AREA Data1, DATA
Table
	ALIGN
	DCB "Hello, World", 0

;=====Result Area
	AREA Result, DATA
Copied
	DCB 0
	END