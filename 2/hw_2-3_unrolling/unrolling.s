		AREA ARMex,	CODE,	READONLY
			ENTRY

; unrolling ���
Main
		LDR r0, Temp ;�ּ� ����
		
		MOV r1, #1 ; #1�� r1�� ����.
		
		ADD r2, r2, r1, LSL #3
		ADD r2, r2, r1
		; r2=9
		
		; 11 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 9 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 13 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 11 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 15 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 13 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 17 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 15 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 19 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 17 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 21 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 19 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 23 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 21 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 25 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 23 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 27 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 25 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		; 29 ���ϱ�
		ADD r2, r2, r1, LSL #1 ; r2= r2+r1 lsl #1 -> r2= 27 + 2
		ADD r3, r3, r2 ; r3=r3+r2
		
		

Temp DCD &00004000

Endline
		STR r3, [r0]
		END
