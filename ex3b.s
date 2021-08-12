	AREA PROG6,CODE,READONLY
A	RN 0
D	RN 1
N	RN 2
MEM	RN 3
ENTRY
	MOV A,#3 ; initial term
	MOV D,#2 ; common difference
	MOV N,#5 ; initialize N
	MOV MEM,#0x40000000 ; some memory address
LOOP
	STR A,[MEM],#4 ; store current term in GP to memory and increment MEM register by 4(size of int)
	MUL R4,A,D ; find next term of GP and store in reg 4
	MOV A,R4 ; copy reg 4 value to A
	SUBS N,N,#1 ; decrement iterative and check if 0
	BNE LOOP ; bracnh to loop if not 0
STOP	B STOP ; loop indefinitely
	END