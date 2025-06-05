		AREA Strcpy, CODE, READONLY
			ENTRY
;strcpy�� ����2�� ����1 �����ϴ� ��.

Main
	LDR r0, =Table ;load the address of the table
	LDR r1, =Copied ; load the address of the Copied

Loop
	LDRB r2, [r0], #1 ; load the first byte into R2
	CMP r2, #0 ; ���ڿ� ���ΰ�??
	BEQ Out ;r2==0�̸� loop �ƿ�
	STR r2, [r1], #1 ;���̾ƴϸ� ���� ����
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