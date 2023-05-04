
BANK0	macro
        bcf     STATUS,RP0	; select register bank 0
        bcf     STATUS,RP1
	endm
BANK1	macro
        bsf     STATUS,RP0	; select register bank 1
        bcf		STATUS,RP1
	endm
BANK2	macro
        bcf     STATUS,RP0	; select register bank 0
        bsf     STATUS,RP1
	endm
BANK3	macro
        bsf     STATUS,RP0	; select register bank 0
        bsf     STATUS,RP1
	endm
BANK1_ macro	; switch only from BANK0 to BANK1
        bsf     STATUS,RP0
	endm
BANK0_ macro	; switch only from BANK1 to BANK0
        bcf     STATUS,RP0
	endm
BANK3_ macro	; switch only from BANK2 to BANK3
        bsf     STATUS,RP0
	endm
BANK2_ macro	; switch only from BANK3 to BANK2
        bcf     STATUS,RP0
	endm