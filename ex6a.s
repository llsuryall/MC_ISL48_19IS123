	AREA PROG11,CODE,READONLY
N		RN 0 ; n
FACT	RN 1 ; to store factorial
ENTRY
	MOV N,#8 ; set n
	CMP N,#0 ; in compare we do op1-op2 and set zero and -/+ve flags
	ADDEQ N,N,#1 ; add 1 to n if it is 0
	MOV FACT,N ; set equal to n itslef
LOOP
	SUBS N,N,#1 ; decrement n and set flags
	ADDEQ N,N,#1 ; add 1 to n if it is 0
	MUL FACT,N,FACT ; multiply n-1
	BNE LOOP ; branch if not 0 in last SUBS where we set flags
STOP	B STOP ; loop indefinitely
	END