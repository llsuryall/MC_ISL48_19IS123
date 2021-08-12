	AREA PROG14,CODE,READONLY
ADDR	RN 0
CUR		RN 1
RES		RN 2
UNM		RN 3
LNM		RN 4
LOW		RN 5
HIGH	RN 6
HUN		RN 7
TEN		RN 8
NB		RN 9
ENTRY
	LDR ADDR,=NUM ; load address of NUM memory block to ADDR
	MOV NB,#2 ; number of bytes
	SUB TEN,NB,#1 ; using TEN as a temp register to get NB-1 (Number of bytes-1)
	ADD ADDR,ADDR,TEN ; shift ADDR like ADDR+NB-1 to get address of last byte
	LDRB CUR,[ADDR] ; load the last byte from memory to CUR register
	MOV HUN,#100 ; constant value 100
	MOV TEN,#10 ; constant value 10
	MOV RES,#0 ; initialize with 0
	MOV UNM,#0xF0 ; upper nibble mask - 1111 0000
	MOV LNM,#0x0F ; lower nibble mask - 0000 1111
LOOP
; Note: each nibble is stored in reverse order in memory
; Hence to get the lower 4 bits in our terms, we need to AND with lower nibble mask instead of upper nibble mask
	AND LOW,CUR,LNM ; to get the lower digit
	AND HIGH,CUR,UNM ; to get the upper digit
	LSR HIGH,#4 ; shift HIGH to right as we have something like XXXX 0000.... we need 0000 XXXX
	MUL RES,HUN,RES ; mulyiply 100 to RES to shift left 2 times(in decimal)
	; using CUR as temp variable....cause it will be reinitialized before next iteration
	; so, not a proble
	MLA CUR,HIGH,TEN,LOW ; multiply HIGH(upper digit) with 10 and add LOW(lower digit) then store in CUR
	ADD RES,RES,CUR ; add calculated value CUR to RES
	LDRB CUR,[ADDR,#-1]! ; load next register(but previous in memory)
	SUBS NB,NB,#1 ; decrement number of bytes
	BNE LOOP ; loop until number of bytes is 0
STOP	B STOP ; loop indefinitely

	AREA BCD_NUM,DATA,READONLY
NUM
	DCD 0x00000127
	END