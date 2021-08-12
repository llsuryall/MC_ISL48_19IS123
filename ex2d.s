	AREA PROG4, CODE, READONLY
ENTRY
	MOV R0,#1 ; iterating register
	MOV R1,#0 ; to store square
	MOV R2,#0 ; to store sum
LOOP
	BL SQU ; store current branch location and branch to SQU
	ADD R2,R1 ; add square to sum register
	ADD R0,#1 ; increment register
	CMP R0,#6 ; compare with 6 and set flags (op1-op2)
	BNE LOOP ; branch if not equal to 0(op1-op2)
STOP	B STOP ; loop indefinitely

SQU
	MUL R1,R0,R0 ; square and store
	MOV PC,LR ; return to previous branch
	END