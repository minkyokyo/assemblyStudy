		AREA ARMex,	CODE,	READONLY
			ENTRY

Main
		LDR r0, Address1
		MOV r1, #1
		
		;r1 = 1 X 2
		ADD r1, r1, r1
		
		; r1 = r1 X 3
		ADD r1, r1, r1, LSL #1		
			
		;r1 = r1 X 4
		MOV r1, r1, LSL #2
		
		;r1 = r1 X 5
		ADD r1, r1, r1, LSL #2
		
		; r1 = r1 X 6
		MOV r2, r1 ; r2�� r1�� ����
		ADD r1, r1, LSL #2 ; r1= r1+ r1*4 = r1*5
		ADD r1, r2 ; r1 + (r1*5) = r1*6
		
		; r1 = r1 X 7
		RSB r1, r1, r1, LSL #3
		
		; r1 = r1 X 8
		MOV r1, r1 , LSL #3
		
		; r1= r1 X 9
		ADD r1, r1, r1, LSL #3
		
		; r1= r1 X 10 , 6�� ���Ҷ��� �������� ��Ŀ����
		MOV r2, r1
		ADD r1, r1, LSL #3
		ADD r1, r2
		
		STR r1, [r0]
Endline
		
Address1 DCD &00040000

		END



