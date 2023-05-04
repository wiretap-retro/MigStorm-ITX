	;it's no longer tiny (100 words), but works with 16f88
	;in this case you must take care yourself not to overwrite the bootloader! (oly the last 100 words are protected by the PC application)
	;Modifications made by Jacques Moulin
	radix DEC
	LIST    P=16F88, F=INHX8M	; change also: Configure->SelectDevice from Mplab 
xtal 	EQU 	8000000			; you may also want to change: _HS_OSC _XT_OSC
baud 	EQU 	19200			; standard TinyBld baud rates: 115200 or 19200
	; The above 3 lines can be changed and buid a bootloader for the desired frequency and PIC type

	;********************************************************************
	;Modifications made after:
	;	Tiny Bootloader		16FxxxA series		Size=192words
	;	claudiu.chiculita@ugal.ro
	;This works for 16f88
	;********************************************************************

	#include "../icdpictypes.inc"	;takes care of: #include "p16fxxxA.inc",  max_flash, IdTypePIC
	#include "../spbrgselect.inc"
	#include "../bankswitch.inc"
	#define adresse_depart max_flash-192
	#define prima_adresa max_flash-100 ; 100 word in size

	__CONFIG    _CONFIG1, _CP_OFF & _CCP1_RB0 & _DEBUG_OFF & _WRT_PROTECT_OFF & _CPD_OFF & _LVP_OFF & _BODEN_OFF & _MCLR_ON & _PWRTE_ON & _WDT_OFF & _INTRC_IO
	__CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF

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
	

SendL 	macro 	car
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

	ORG	adresse_depart
	  
Initb
	bsf	STATUS,RP1				; bank 2-3
	movwf	contor					; # of loops
	clrf	flag					; used in bulkerase
	clrf	EEADR					; prepare flash adress
	clrf	EEADRH
	movlw	buffer					; prepare FSR
	movwf	FSR
	return

writeloop						; write 2 bytes = 1 instruction
	clrwdt
	movf	INDF,w
	movwf	EEDATA
	incf	FSR
	movf	INDF,w
	movwf	EEDATH
	incf	FSR	
		BANK3_					;bank  2->3
	bcf	EECON1,EEPGD
	btfss	flag,6					;is eeprom (or flash)
	bsf	EECON1,EEPGD
	bsf	EECON1,WREN
	movlw	0x55
	movwf	EECON2
	movlw	0xaa
	movwf	EECON2	
	bsf	EECON1,WR
	nop
	nop
waitwre	
	btfsc	EECON1,WR				;for eeprom writes (wait to finish write)
	goto	waitwre
	bcf	EECON1,WREN
		BANK2_					;bank2
	incf	EEADR					;does not cross zones
	btfss	flag,6					; if writing to EEPROM, skip first counter dec.
	decf	contor
	decfsz	contor
	goto	writeloop
	return

ziieroare
	SendL 'N'
	goto	mainl

Receive
	clrf	STATUS
	movlw	xtal/2000000+1				; for 20MHz => 11 => 1second
	movwf	cnt1
rpt2						
	clrf	cnt2
rpt3
	clrf	cnt3
rptc
	btfss PIR1,RCIF					;test RX
	goto $+4
	movf RCREG,w					;return in W
	addwf crc,f					;compute crc
	return
	clrwdt
	decfsz	cnt3
	goto	rptc
	decfsz	cnt2
	goto	rpt3
	decfsz	cnt1
	goto	rpt2
							;timeout:
way_to_exit						;exit in all other cases; must be BANK0/1
	BANK0_						; changed MOJ (RCSTA in bank 0, not bank 1)
	bcf	RCSTA,SPEN				; desactivate UART
	clrf	PCLATH					; added for missing pagesel in most programs
							; when the destination of the first goto is in the same page
	ORG prima_adresa
	nop
	nop
	nop
	nop
	org prima_adresa+4

IntrareBootloader
							;init serial port
	clrf	STATUS
	bsf	STATUS,RP0				;BANK1_
	movlw	b'01110000'				; osc internal 8 Mhz
	movwf	OSCCON
	movlw	b'00100100'
	movwf	TXSTA
	movlw	spbrg_value
	movwf	SPBRG
	BANK0_
	movlw	b'10010000'
	movwf	RCSTA
							;wait for computer
	call	Receive			
	sublw	0xC1					;Expect C1
	skpz
	goto	way_to_exit
	SendL IdTypePIC					;PIC type

; for the 16F87/88, flash memory must be erased before writing
; erasing can only be done by blocks of 32 words, with address = integer x 32
; so : 1. save the 4 first words in buffer
;      2. erase all the user memory (0x000 to 0F40)
;      3. erase the block containing the final jump (block at 0xF80)
;      4. rewrite the 4 first words from buffer
;      5. write the user program & data in flash or eeprom

Readjmp							; first read the 4 first words of program
	movlw	4					; and copy them back after bulkerase
	call	Initb
loopread						; (or direct fill of 8 bytes in buffer)
	bsf	STATUS,RP0				; bank 3
	bsf	EECON1,EEPGD				; select flash
	bsf	EECON1,RD				; select read
	nop
	nop
	bcf	STATUS,RP0
	movf	EEDATA,w				; store bytes in buffer
	movwf	INDF
	incf	FSR
	movf	EEDATH,w
	movwf	INDF
	incf	FSR
	incf	EEADR
	decfsz	contor
	goto	loopread	

Bulkerase						; erase 122 blocks of 32 words
	movlw	(max_flash-192)/32			; from 0x000 to 0xF3F
	call	Initb					; + 1 block at 0xF80
looperase
	bsf	STATUS,RP0
	bsf	EECON1,WREN
	bsf	EECON1,FREE
	movlw	0x55
	movwf	EECON2
	movlw	0xAA
	movwf	EECON2
	bsf	EECON1,WR				; erase 1 block
	nop
	nop
	bcf	EECON1,WREN
	bcf	EECON1,FREE
	bcf	STATUS,RP0
	movlw	32					; add 32 to flash memory pointer
	addwf	EEADR
	btfsc	STATUS,C
	incf	EEADRH
	btfsc	flag,0					; flag cleared in Initb
	goto	Writejmp				; so jump occurs only after block 123
	decfsz	contor
	goto	looperase
	bsf	flag,0					; set flag for block 123
	movlw	0x80
	movwf	EEADR					; set EEADR to 0x80 (EEADRH unchanged)
	goto	looperase				; and erase block 123

Writejmp						; rewrite the 4 first words of program
	movlw	8					
	call	Initb
	call	writeloop

MainLoop						; back to original program
	clrf	STATUS					;bank0
	SendL 'K'
mainl
	clrf	crc
	call	Receive					;H
	bsf 	STATUS,RP1				;bank2
	movwf	EEADRH
	movwf	flag					;used to detect if is eeprom
	call	Receive					;L
	bsf 	STATUS,RP1				;bank2
	movwf	EEADR

	call	Receive					;count
	movwf	contor
	movwf	i
	incf	i
	movlw	buffer-1
	movwf	FSR
rcvoct
	call	Receive
	incf	FSR
	movwf	INDF
	decfsz	i
	goto	rcvoct
	
	movf	crc,f					;check crc
	skpz
	goto	ziieroare
							;write
	bsf 	STATUS,RP1				;bank switch 0->2
	movlw	buffer
	movwf	FSR
	call	writeloop
	goto	MainLoop



;*************************************************************
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.

            END
