	AREA PROG13,CODE,READONLY
NUM	RN 0
DIV	RN 1
ANS	RN 2
RES	RN 3
ENTRY
	MOV RES,#0 ; inititalize RES where sum of digits will be stored
	MOV DIV,#10 ; set divisor to find mod 10
	LDR NUM,=12345 ; set number to find sum of digits
LOOP
	MOV ANS,#0 ; set ANS to 0 each time (quotient)
	BL DIVIDE ; branch to DIVIDE and save current location in link register
	ADD RES,NUM,RES ; add the resulting mod 10 to RES(where sum is stored)
	MOV NUM,ANS ; replace the remainder in NUM(remainder) with ANS(quotient)
	CMP NUM,#0 ; compare NUM with 0
	BNE LOOP ; loop if NUM is not 0
STOP	B STOP ; loop indefinitely
DIVIDE
	SUBS NUM,NUM,DIV ; substract NUM with DIV(10) and set flags
	ADDPL ANS,ANS,#1 ; add 1 to ANS if last SUBS was +ve
	BPL DIVIDE ; loop if SUBS resulted +ve
	ADDMI NUM,NUM,DIV ; add DIV to NUM if last SUBS was -ve
	BX LR ; branch back to link register that we saved
	END