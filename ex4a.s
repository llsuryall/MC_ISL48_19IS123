	AREA PROG7,CODE,READONLY
A		RN 0 ; initial term
D		RN 1 ; common difference
N		RN 2 ; number of terms to calculate
ADDR 	RN 3 ; reg to address
ENTRY
	MOV A,#3 ; initialize A
	MOV D,#7 ; initialize D
	MOV N,#10 ; initialize N
	LDR ADDR,=MEM ; load address of reserved memory to register
	STR A,[ADDR] ; store first term of AP
	ADD A,A,D ; calculate next term of AP
	SUB N,N,#1 ; decrement counter
LOOP
	STR A,[ADDR,#4]! ; store the next term of ap in the next address, while incrementing address register
	ADD A,A,D ; calculate next term in AP
	SUBS N,N,#1 ; substract counter and flag
	BNE LOOP ; branch until N is 0
STOP 	B STOP ; loop indefinitely

	AREA AP,DATA,READWRITE
MEM
	SPACE 40 ; reserve 40 bytes of memory for 10 integers
	END