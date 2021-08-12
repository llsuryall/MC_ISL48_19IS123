	AREA PROG2, CODE, READONLY
ENTRY
	MOV R0,#1 ; current add
	MOV R1,#0 ; to store sum
	MOV R2,#0 ; iterating register
LOOP
	ADD R1,R1,R0 ; accumalate sum
	ADD R0,R0,#2 ; add 2 to register
	ADD R2,#1 ; increment register
	CMP R2,#10 ; check if iterating register is greater than 9
	BNE LOOP ; return to loop if not equal
STOP	B STOP ; loop indefinitely
	END