	AREA PROG9,CODE,READONLY
N		RN 0
ONES	RN 1
ZEROS	RN 2
ADDR	RN 3
ENTRY
	MOV ADDR,#0x40000000 ; some memory address
	MOV N,#10 ; initialize N
	MOV ONES,#0 ; set ONES (no of ones) to 0
	MOV ZEROS,#0 ; set ZEROS (no of zeros) to 0
LOOP
	LSRS N,#1 ; move right most binary digit to carry
	ADDCS ONES,ONES,#1 ; add one to ONES if carry is set
	ADDCC ZEROS,ZEROS,#1 ; add one to ZEROS if carry is not set
	CMP N,#0 ; check if N is exhausted
	BNE LOOP ; otherwise branch to LOOP
	STR ONES,[ADDR] ; store ONES in ADDR
	STR ONES,[ADDR,#4] ; store ZEROS in next ADDR
STOP	B STOP ; loop indefinetely
	END