		AREA ARMex, CODE, READONLY
			ENTRY

Start
	LDR r0, Address1
	LDR sp, StackAddress

LoadFloatNumber
	;실수 메모리에 로드
	MOV r2, #0x3FC00000
	MOV r3, #0x40
	MOV r4, #0x50
	
	STR r2,[r0]
	STRB r3, [r0,#7]
	STRB r4, [r0,#6]
	
Main
	; r12에는 기수 마스크 0 00000000 11111111111111111111111가 들어간다.
	ADD r12, r12, #0x700000
	ADD r12, r12, #0xff000
	ADD r12, r12, #0xff0
	
	ADD r1, r1, #0x7f000000 ; r1에 지수마스크 저장,0 11111111 00000000000000000000000
	ADD r1, r1, #0x800000
	
	LDR r2, [r0]
	BL extractBit
	LDMFD sp!, {r6-r8}
	LDR r2, [r0,#4]
	BL extractBit
	LDMFD sp!, {r9-r11}

AddSignbit
	;signbit끼리 더함
	ADD r6, r6, r9

Shiftnum 
;shfit num을 구해줌, 큰 exponent - 작은 exponent
	SUB r5, r10, r7
	MOV r5, r5, LSR #22 ;오른쪽으로 쉬프트해서 차이를 적합한 수로 만듬.

Normalization
; 실수1의  기수부 정규화
	ADD r8, r8, #0x800000
	MOV r8, r8, LSR #1

ADDMantissa
;실수1의 기수와 실수2의 기수 덧셈
	ADD r8, r8,r11 
	MOV r8, r8, LSR #1 ;정규화
	ADD r5, r5, #1 ; 정규화 한만큼 r5(shiftnum)에 더해준다.

Result
	MOV r5, r5, LSL #22 ; shiftnum과 지수를 더해주기 위해 shift
	ADD r5, r5, #0x3f800000 ;127과 shiftnum 덧셈
	AND r8, r8, r12; Mantissa에 기수마스크를 끼얹는다
	ADD r6, r6, r5 ; signbit와 exponent를 더해줌
	ADD r6, r6, r8 ; mantissa를 더해줌
	
	LDR r0, Address3
	STR r6, [r0] ;0x40000000에 결과 저장
	B Endline

extractBit
Getsignbit
; r2에 실수를 가져와서 양수면  r3(signbit저장) 0을 넣고, 음수면 1을 넣는다
	CMP r2, #0
	MOVPL r3, #0
	MOVMI r3, #0x80000000
	
Getexponent
; r2에 실수를 가져와서 지수마스크를 끼얹는다. r4에 저장
	AND r4, r2, r1

Getmantissa
; 기수 마크를 끼얹고, r5에 저장한다
	AND r5, r2, r12

	STMFD sp!, {r3-r5}
	MOV pc, lr

Endline

StackAddress  & &40002000
Address1 & &40004100
Address3 & &40000000

	END