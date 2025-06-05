		AREA ARMex, CODE, READONLY
			ENTRY

; procedure call standard
; return°ªÀº 0, argument´Â r0~r13
Main
		LDR sp, sAddress
		LDR r1, Address1
		
		
		MOV r2, #10 ; r2Àº factorial¿¡ ÀÎÀÚ·Î º¸³»ÁÙ °ª, parameter
		
		;MOV lr, pc ; save return address
		BL factorial ; lrÀº BL ´ÙÀ½¿¡ ½ÇÇàÇÒ ¸í··¾îÀÇ ÁÖ¼Ò°¡ ÀúÀå.  LR = PC-4...? 
		
		STR r2, [r1]
		MOV pc, #0
		
	
factorial
		CMP r2, #1; Å»Ãâ Á¶°Ç r1<=1
		MOVLS pc, lr
		; ¹İÈ¯¿¡´Â  ½ÇÇà Èå¸§À» È£Ãâ ¸í·É¹®ÀÇ ´ÙÀ½ ¸í·É¹®À¸·Î ¿Å°Ü¾ß ÇÑ´Ù.
		STMFD sp! , {r2,lr} ;¸Å°³º¯¼ö¿Í lr into STACK, facotorialÀ» È£­„ÇÏ±â Àü¿¡ lrÀ» ÀúÀåÇØ³ö¾ß µÈ´Ù. 
		SUB r2, r2, #1 ; n  - 1
		BL factorial
		LDMFD sp!,{r4,r5} ; r4¿¡ ½ºÅÃ¿¡ ³Ö¾î³õ¾Ò´ø factorial(n-1) °ª°ú  r5¿¡ factorial(n-1)À» È£ÃâÇÒ¶§ ÀúÀåÇÑ lrÀ» ºÒ·¯¿Â´Ù
		MUL r2, r4, r2  ; °öÇÑ´Ù
		MOV pc, r5 ; pc¸¦ r5ÀÇ °ªÀ¸·Î ¹Ù²Û´Ù.
		

		
sAddress DCD &00003000
Address1 DCD &00004000
	
	END