		AREA ARMex,	CODE,	READONLY
			ENTRY

Main
		LDR r0, Temp ;�ּ� ����
		
		MOV r1, #1 ; #1�� r1�� ����.
		 
		ADD r2, r1, LSL #3 ; r2=8
		ADD r2, r2, r1, LSL #1
		; r2=10, �Ϲݽ� n(n+10)�� �� n�� 10�̴�
		
		ADD r3, r2, r2 ; r3= r2+r2  (10+10)
		MUL r4, r3, r2; ; r3 = r3*10
		

Temp DCD &00004000

Endline
		STR r4, [r0]
		END
