	AREA ARMex, CODE, READONLY
		ENTRY

Main
		LDR r0, =Array1
		ADD r0, r0, #36  ;�迭�� ���������� �����ϱ� ���� �ּҿ� 36�� ������.
		LDR r1, Address1
		MOV r4, #10 ; �迭 ����
		
Loop		
		LDR r2, [r0], #-4 ; �迭 ���������� 4byte�� ���ҽ�Ŵ.
		STR r2, [r1], #4 
		ADD r3, r3, #1 ; loop�� ����
		CMP r3, r4 ; loop���� 10�̴�?
		BEQ Endline
		B Loop

Endline

Array1 DCD 10,9,8,7,6,5,4,3,2,1

Address1 DCD &00004000

	END