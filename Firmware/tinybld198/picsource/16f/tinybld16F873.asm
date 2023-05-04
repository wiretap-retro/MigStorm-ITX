	; modifications made by Allan King
	
	radix DEC
	LIST      P=16F873, F=INHX8M	; change also: Configure->SelectDevice from Mplab 
xtal EQU 20000000		; you may also want to change: _HS_OSC _XT_OSC
baud EQU 115200			; standard TinyBld baud rates: 115200 or 19200
	; The above 3 lines can be changed and buid a bootloader for the desired frequency and PIC type

	;********************************************************************
	;Modifications made after:
	;	Tiny Bootloader		16Fxxx series		Size=100words
	;	claudiu.chiculita@ugal.ro
	;This should work for 16F873
	;	
	;Now working for 16F873
	;Default write must be :	bsf		EECON1,EEPGD
	;Program is high, commenting out other lines made it always write to
	;Data EEPROM not Program.  This logic should be reversed for all similar
	;PICs, then the two lines for Data EE can be taken out if unused for any.
	;
	;Data EE could be brought back in, there are 2 unused words at end.
	;
	;Config is changed for 873 vs 873A.
	;
	;CB is check bank, for bank selects and the high variables.  16F873/4
	;have no common high variables.  Ended up being the EEPGD, but leaving
	;the CB etc in for reference.
	;********************************************************************

	#include "../icdpictypes.inc"	;takes care of: #include "p16fxxx.inc",  max_flash, IdTypePIC
	#include "../spbrgselect.inc"
	#include "../bankswitch.inc"
	#define prima_adresa max_flash-100 ; 100 word in size

	__CONFIG _CP_OFF & _WDT_OFF & _BODEN_ON & _PWRTE_ON & _HS_OSC & _WRT_ENABLE_ON & _LVP_OFF & _CPD_OFF

	errorlevel 1, -305			; suppress warning msg that takes f as default

	
	cblock 0x20
	buffer:80
	endc
	
	cblock 0x78
	crc
	contor
	i
	cnt1
	cnt2
	cnt3
	flag	
	endc
	

SendL macro car
	movlw	car
	movwf	TXREG
	endm

;0000000000000000000000000 RESET 00000000000000000000000000

		ORG     0x0000
		PAGESEL IntrareBootloader
		GOTO    IntrareBootloader

;&&&&&&&&&&&&&&&&&&&&&&&   START     &&&&&&&&&&&&&&&&&
;----------------------  Bootloader  ----------------------
;               
;PC_flash:	C1h			AddrH  AddrL  nr  ...(DataLo DataHi)...  crc
;PIC_response:		id   K								K

	
	ORG prima_adresa
	nop
	nop
	nop
	nop
	org prima_adresa+4
IntrareBootloader
			;init serial port
	clrf	STATUS					;bank0
	bsf		STATUS,RP0			;BANK1_
	movlw	b'00100100'
	movwf	TXSTA
	movlw	spbrg_value
	movwf	SPBRG
	BANK0_
	movlw	b'10010000'
	movwf	RCSTA
			;wait for computer
	call	Receive			
	sublw	0xC1				;Expect C1
	skpz
	goto	way_to_exit
	SendL IdTypePIC				;PIC type
	;SendL IdSoftVer			;firmware ver x
MainLoop
	clrf	STATUS				;bank0
	SendL 'K'
mainl
	clrf	crc				;CB
	call	Receive				;H
		bsf STATUS,RP1			;bank2
	movwf	EEADRH
	movwf	flag			;CB	;used to detect if is eeprom
	bsf	STATUS,RP0		;BANK1	; added for 16F873/4
	movwf	flag			;CB

	call	Receive		;bank0	;L
		bsf STATUS,RP1			;bank2  
	movwf	EEADR

	call	Receive			;bank0	;count
	movwf	contor			;CB
	movwf	i				;CB
	incf	i				;CB
	movlw	buffer-1
	movwf	FSR
rcvoct
	call	Receive			;bank0
	incf	FSR
	movwf	INDF
	decfsz	i				;CB
	goto	rcvoct
	
	movf	crc,f			;CB	;check crc
	skpz
	goto	ziieroare
				;write
		bsf STATUS,RP1		;bank2	;bank switch 0->2
	movlw	buffer
	movwf	FSR
writeloop						; write 2 bytes = 1 instruction
	clrwdt
	movf	INDF,w
	movwf	EEDATA
	incf	FSR
	movf	INDF,w
	movwf	EEDATH
	incf	FSR	
		BANK3_				;bank3	;bank  2->3
	bsf		EECON1,EEPGD			;********set is program, should be default**
	;btfss	flag,6			;CB		;only FLASH write (no more eeprom write)
	;bcf		EECON1,EEPGD
	bsf		EECON1,WREN
	movlw	0x55
	movwf	EECON2
	movlw	0xaa
	movwf	EECON2	
	bsf		EECON1,WR
	nop
	nop
waitwre	
	btfsc	EECON1,WR			;for eeprom writes (wait to finish write)
	goto	waitwre
	bcf		EECON1,WREN
		BANK2_					;bank2
	incf	EEADR				;does not cross zones
	btfss	flag,6				; if writing to EEPROM, skip first counter dec.	;CB
	decf	contor			;CB
	decfsz	contor			;CB
	goto	writeloop
	
	goto	MainLoop
ziieroare
	SendL 'N'
	goto	mainl
	  

Receive
	clrf	STATUS			;CB bank0
	movlw	xtal/2000000+1		; for 20MHz => 11 => 1second
	movwf	cnt1			;CB
rpt2						
	clrf	cnt2			;CB
rpt3
	clrf	cnt3			;CB
rptc
		btfss PIR1,RCIF			;test RX
		goto $+4
		movf RCREG,w			;return in W
		addwf crc,f			;CB	;compute crc
		return
	clrwdt
	decfsz	cnt3			;CB
	goto	rptc
	decfsz	cnt2			;CB
	goto	rpt3
	decfsz	cnt1			;CB
	goto	rpt2
				;timeout:
way_to_exit			;exit in all other cases; must be BANK0/1
	;BANK0_
	bcf	RCSTA,	SPEN	; deactivate UART
	goto	prima_adresa
;*************************************************************
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.

            END
