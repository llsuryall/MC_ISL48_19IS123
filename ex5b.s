	AREA PROG10,CODE,READONLY
TOTAL	RN 0
ADDR	RN 1
COUNT	RN 2
RES		RN 3
ENTRY
	LDR ADDR,=TABLE ; load address of memory block to register
	LDRH TOTAL,[ADDR] ; load 16 bits from memory to register instead of 32
	MOV COUNT,#9 ; initialize count variable for iteration
LOOP1
	LDRH RES,[ADDR,#2]! ; load next half word from memory
	ADD TOTAL,TOTAL,RES ; add half word to register TOTAL
	SUBS COUNT,COUNT,#1 ; decrement count and set flags
	BNE LOOP1 ; branch if not equal to zero
	MOV RES,#0 ; reinitialize RES to 0
	MOV COUNT,#10 ; reinitialize COUNT to 0
LOOP2
	SUBS TOTAL,TOTAL,COUNT ; substract 10 from TOTAL each time until 0 or -ve(set flags)
	ADDPL RES,RES,#1 ; increment RES if TOTAL-COUNT was positive or 0
	BPL LOOP2 ; loop if TOTAL - COUNT was +ve or 0
	ADDMI TOTAL,TOTAL,COUNT ; add 10 to count if last TOTAL-COUNT was negative to get remainder
STOP	B STOP ; loop indefinitely

	AREA NUMS,DATA,READONLY
TABLE
	DCW 1000,2564,8936,344,5667,908,786,654,9871,456
	END