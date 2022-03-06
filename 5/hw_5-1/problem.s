		AREA ARMex, CODE, READONLY
			ENTRY

Start
	LDR r0, Address1
	LDR sp, StackAddress

LoadFloatNumber
	;�Ǽ� �޸𸮿� �ε�
	MOV r2, #0x3FC00000
	MOV r3, #0x40
	MOV r4, #0x50
	
	STR r2,[r0]
	STRB r3, [r0,#7]
	STRB r4, [r0,#6]
	
Main
	; r12���� ��� ����ũ 0 00000000 11111111111111111111111�� ����.
	ADD r12, r12, #0x700000
	ADD r12, r12, #0xff000
	ADD r12, r12, #0xff0
	
	ADD r1, r1, #0x7f000000 ; r1�� ��������ũ ����,0 11111111 00000000000000000000000
	ADD r1, r1, #0x800000
	
	LDR r2, [r0]
	BL extractBit
	LDMFD sp!, {r6-r8}
	LDR r2, [r0,#4]
	BL extractBit
	LDMFD sp!, {r9-r11}

AddSignbit
	;signbit���� ����
	ADD r6, r6, r9

Shiftnum 
;shfit num�� ������, ū exponent - ���� exponent
	SUB r5, r10, r7
	MOV r5, r5, LSR #22 ;���������� ����Ʈ�ؼ� ���̸� ������ ���� ����.

Normalization
; �Ǽ�1��  ����� ����ȭ
	ADD r8, r8, #0x800000
	MOV r8, r8, LSR #1

ADDMantissa
;�Ǽ�1�� ����� �Ǽ�2�� ��� ����
	ADD r8, r8,r11 
	MOV r8, r8, LSR #1 ;����ȭ
	ADD r5, r5, #1 ; ����ȭ �Ѹ�ŭ r5(shiftnum)�� �����ش�.

Result
	MOV r5, r5, LSL #22 ; shiftnum�� ������ �����ֱ� ���� shift
	ADD r5, r5, #0x3f800000 ;127�� shiftnum ����
	AND r8, r8, r12; Mantissa�� �������ũ�� ����´�
	ADD r6, r6, r5 ; signbit�� exponent�� ������
	ADD r6, r6, r8 ; mantissa�� ������
	
	LDR r0, Address3
	STR r6, [r0] ;0x40000000�� ��� ����
	B Endline

extractBit
Getsignbit
; r2�� �Ǽ��� �����ͼ� �����  r3(signbit����) 0�� �ְ�, ������ 1�� �ִ´�
	CMP r2, #0
	MOVPL r3, #0
	MOVMI r3, #0x80000000
	
Getexponent
; r2�� �Ǽ��� �����ͼ� ��������ũ�� ����´�. r4�� ����
	AND r4, r2, r1

Getmantissa
; ��� ��ũ�� �����, r5�� �����Ѵ�
	AND r5, r2, r12

	STMFD sp!, {r3-r5}
	MOV pc, lr

Endline

StackAddress  & &40002000
Address1 & &40004100
Address3 & &40000000

	END