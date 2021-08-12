	AREA PROG8,CODE,READONLY
N		RN 0 ; to store n
TEMP	RN 1 ; temporary register
RES		RN 2 ; to store result
ENTRY
; NOTE: sum of n cube formula is square of (n(n+1)/2)
	MOV N,#5 ; initialize
	ADD TEMP,N,#1 ; storing N+1 in temp reg
	MUL RES,N,TEMP ; storeing n(n+1) in result
	MOV TEMP,RES,LSR #1 ; dividing RES by 2 and storing in temp reg
	MUL RES,TEMP,TEMP ; squaring temp register and storing in RES
STOP	B STOP ; loop indefinitely
	END