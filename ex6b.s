	AREA PROG12,CODE,READONLY
L1		RN 0 ; last term
L2		RN 1 ; term before last
L3		RN 2 ; term before L2
ADDR	RN 3 ; to store memory address
N		RN 4 ; n
ENTRY
	MOV N,#10 ; initialize n
	LDR ADDR,=FIBB ; save allocated memory address in register
	MOV L3,#0 ; 1st fib value
	MOV L2,#1 ; 2nd fib value
	CMP N,#0 ; compare with 0
	BEQ STOP ; stop if n=0
	STRB L3,[ADDR] ; write 1st term to memory (byte)
	SUBS N,N,#1 ; decrement n
	BEQ STOP ; stop if n=0
	STRB L2,[ADDR,#1]! ; write 2nd term to memory (byte)
	SUBS N,N,#1 ; decrement n
	BEQ STOP ; stop if n=0
LOOP
	ADD L1,L2,L3 ; calculare next fib term
	STRB L1,[ADDR,#1]! ; store the calculated fib value (byte)
	MOV L3,L2 ; shift L2 to L3
	MOV L2,L1 ; shift L1 to L2
	SUBS N,N,#1 ; decrement n
	BNE LOOP ; branch if n is not 0
STOP	B STOP ; loop indefinitely
	AREA FIBB_NUMS,DATA,READWRITE
FIBB
	DCB	10 ; allocate 10 bytes
	END