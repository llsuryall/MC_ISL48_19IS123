	AREA PROG5,CODE,READONLY
EVEN_NUMBER	RN 0
N			RN 1
MEM_ADDR	RN 2
ENTRY
	MOV N,#5
	MOV MEM_ADDR,#0x40000000
	MOV EVEN_NUMBER,#2
LOOP
	STR EVEN_NUMBER,[MEM_ADDR] ; storing even number in memory
	ADD EVEN_NUMBER,EVEN_NUMBER,#2 ; increment even nummber by 2
	SUBS N,N,#1 ; decrement iterative and check if 0
	BNE LOOP ; branch to loop if not 0
STOP	B STOP ; loop indefinitely
	END