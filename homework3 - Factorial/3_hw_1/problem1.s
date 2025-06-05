	AREA 	ARMex, CODE, READONLY
			ENTRY

Start
		MOV r0, #16
		MOV r1, #10
		MOV r2, #08
		
		LDR r3, TEMPADDR1
		
		STRB	r0, [r3]
		STRB r1, [r3,#1]
		STRB r2, [r3,#2]
		
		LDRB r4, [r3,#1]
		
		CMP r4,#10
		
		MOVGT r5, #1 ; if( r4-10 > 0 ) z clear, c set
		MOVLT  r5, #2 ; if( r4 -10  < 0) z clear, c set , n set
		MOVEQ r5, # 3 ; if( r4 - 10 ==0 ) z set?
		
		
TEMPADDR1		&	&00001000
		END
		