		AREA ARMex, CODE, READONLY
			ENTRY

; procedure call standard
; return값은 0, argument는 r0~r13
Main
		LDR sp, sAddress
		LDR r1, Address1
		
		
		MOV r2, #10 ; r2은 factorial에 인자로 보내줄 값, parameter
		
		;MOV lr, pc ; save return address
		BL factorial ; lr은 BL 다음에 실행할 명렁어의 주소가 저장.  LR = PC-4...? 
		
		STR r2, [r1]
		MOV pc, #0
		
	
factorial
		CMP r2, #1; 탈출 조건 r1<=1
		MOVLS pc, lr
		; 반환에는  실행 흐름을 호출 명령문의 다음 명령문으로 옮겨야 한다.
		STMFD sp! , {r2,lr} ;매개변수와 lr into STACK, facotorial을 호춣하기 전에 lr을 저장해놔야 된다. 
		SUB r2, r2, #1 ; n  - 1
		BL factorial
		LDMFD sp!,{r4,r5} ; r4에 스택에 넣어놓았던 factorial(n-1) 값과  r5에 factorial(n-1)을 호출할때 저장한 lr을 불러온다
		MUL r2, r4, r2  ; 곱한다
		MOV pc, r5 ; pc를 r5의 값으로 바꾼다.
		

		
sAddress DCD &00003000
Address1 DCD &00004000
	
	END