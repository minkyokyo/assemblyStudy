		AREA 	Problem3, CODE, READONLY
			ENTRY

start
	LDR sp, sAddress
	LDR r11, Address1
	
	MOV r0, #10
	MOV r1, #11
	MOV r2, #12
	MOV r3, #13
	MOV r4, #14
	MOV r5, #15
	MOV r6, #16
	MOV r7, #17
	
	MOV r10, r4 ; r4�� ����
	
	STMFD sp!, {r0-r7} ; ���� �������Ͱ� ���� �ּҷ� ����. sp�� 7*4 ��ŭ ����.
	BL doRegister ; LR�� BL������ ����� ��ɾ��� �ּ� ����
	MOV r9 , #160 ; doGCD�� ������ 160�� r9�� ����
	BL doGCD
	ADD r8, r8, r10 ; �ִ������� ����Ǳ� �� r4�� ����.
	STR r8, [r11] ; �޸𸮿� ����
	
	MOV pc,#0 ;��

doRegister
	; ���� 2�� ���� register���� �� copy
	LDMFD sp!, {r1}
	LDMFD sp!, {r6}
	LDMFD sp!, {r0}
	LDMFD sp!, {r2}
	LDMFD sp!, {r7}
	LDMFD sp!, {r3-r5}
	; �� register�� ���� register�� index�� ���� ��, r0-r7�� �� return

	ADD r8, r8, r0
	ADD r8, r8, r1
	ADD r8, r8, r2
	ADD r8, r8, r3
	ADD r8, r8, r4
	ADD r8, r8, r5
	ADD r8, r8, r6
	ADD r8, r8, r7
	ADD r8, r8,#28
	
	MOV pc, lr ; doRegister�� ȣ���� ��ɾ��� ���� ��ɾ pc�� ����.
	
doGCD
	;sum(r8)�� �ִ� ����� ���ϱ�
	CMP r8, r9
	SUBGT r8,r8,r9 ;r8�� ũ�� r8= r8-r9
	SUBLT r9, r9, r8 ; r9�� ũ�� r9=r9-r8
	BNE doGCD 
	MOV pc , lr
	
sAddress DCD &00003000
Address1 DCD &00004000

	END