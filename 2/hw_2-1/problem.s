		AREA Strcat, CODE, READONLY
			ENTRY
			
Main
	LDR r0, =string1
	LDR r1, =string2
	LDR r2, resultaddr
	
	
Compare
	LDRB r3, [r0], #1
	LDRB r4, [r1], #1 
	
	ADDS r6, r3, r4
	MOVEQ r5, #10
	BEQ Endline
	
	CMP r3, r4
	BEQ Compare
	MOVNE r5, #11
	B Endline

Endline
	STR r5, [r2]
	MOV pc, lr

string1 DCB "apple",0
string2 DCB "appl",0
resultaddr DCD &40000
		
		END