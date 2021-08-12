	AREA PROG1, CODE, READONLY
ENTRY
	MOV R0,#1 ; iterating register
	MOV R1,#1 ; to store sum
LOOP
	ADD R1,R1,R0 ; add iterating register to sum
	ADD R0,R0,#1 ; increment register
	CMP R0,#6 ; compare iterating register with 6
	BNE LOOP ; return to LOOP unless R0 is greater than 5
STOP	B STOP ; loop indefinitely
	END