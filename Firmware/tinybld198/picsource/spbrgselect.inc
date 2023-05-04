RoundResult SET 0				; Rounding function.  RoundResult = Round(aa/bb)
Round	macro aa,bb
	LOCAL rr = aa/bb
	LOCAL d1 = aa - rr*bb
	LOCAL d2 = (rr+1)*bb - aa
RoundResult = rr
	if d1 >= d2
RoundResult++
	endif
	endm

AbsResult SET 0
Abs		macro nr
	if nr>=0
AbsResult = nr
	else
AbsResult = -nr
	endif
	endm
		
	Round xtal,(16*baud)
spbrg_value EQU RoundResult-1

	Round xtal,(16*(spbrg_value+1))
baud_real EQU RoundResult
	Abs(baud_real-baud)
errpercent EQU AbsResult*100/baud
	if errpercent > 4
		ERROR big error in baudrate: #v(errpercent)%
	endif
	if errpercent >= 2
		messg baudrate not exact: #v(errpercent)%
	endif