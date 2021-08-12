	AREA PROG3, CODE, READONLY
ENTRY
	MOV R0,#3 ; first term
	MOV R1,#0 ; iterating variable
	MOV R3,#0 ; to store sum
LOOP
	ADD R3,R3,R0 ; add current term to sum register
	ADD R0,R0,#7 ; find next term by adding common difference
	ADD R1,#1 ; increment register
	CMP R1,#5 ; check if equal to 5(greater than 4)
	BNE LOOP ; branch to loop if true
STOP	B STOP ; loop indefinitely
	END