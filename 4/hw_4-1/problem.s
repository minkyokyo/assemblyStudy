		AREA ARMex, CODE, READONLY
			ENTRY

; procedure call standard
; return���� 0, argument�� r0~r13
Main
		LDR sp, sAddress
		LDR r1, Address1
		
		
		MOV r2, #10 ; r2�� factorial�� ���ڷ� ������ ��, parameter
		
		;MOV lr, pc ; save return address
		BL factorial ; lr�� BL ������ ������ ������ �ּҰ� ����.  LR = PC-4...? 
		
		STR r2, [r1]
		MOV pc, #0
		
	
factorial
		CMP r2, #1; Ż�� ���� r1<=1
		MOVLS pc, lr
		; ��ȯ����  ���� �帧�� ȣ�� ��ɹ��� ���� ��ɹ����� �Űܾ� �Ѵ�.
		STMFD sp! , {r2,lr} ;�Ű������� lr into STACK, facotorial�� ȣ���ϱ� ���� lr�� �����س��� �ȴ�. 
		SUB r2, r2, #1 ; n  - 1
		BL factorial
		LDMFD sp!,{r4,r5} ; r4�� ���ÿ� �־���Ҵ� factorial(n-1) ����  r5�� factorial(n-1)�� ȣ���Ҷ� ������ lr�� �ҷ��´�
		MUL r2, r4, r2  ; ���Ѵ�
		MOV pc, r5 ; pc�� r5�� ������ �ٲ۴�.
		

		
sAddress DCD &00003000
Address1 DCD &00004000
	
	END