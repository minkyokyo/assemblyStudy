			AREA ARMex, CODE, READONLY
			ENTRY
			
start
	LDR r0, Address1
	MOV r1, #1
	MOV r2, #2
	
	MUL r3, r1, r2 ; r3= 1*2
	ADD r2, r2, #1
	
	MUL r4, r3, r2 ; r4= r3*3
	ADD r2, r2, #1
	
	MUL r3, r4, r2 ; r3= r4*4
	ADD r2, r2, #1
	
	MUL r4, r3, r2 ; r4= r3*5
	ADD r2, r2, #1
	
	MUL r3, r4, r2; r3= r4*6
	ADD r2, r2, #1
	
	MUL r4, r3, r2; r4= r3*7
	ADD r2,r2, #1
	
	MUL r3,r4,r2 ; r3= r4*8
	ADD r2, r2, #1
	
	MUL r4, r3,r2 ;r4=r3*9
	ADD r2, r2, #1
	
	MUL r3, r4, r2 ; r3 = r4*10
	
	STR r3, [r0]

Address1 & &00040000
	END