	radix DEC
	LIST      P=16F88, F=INHX8M	; change also: Configure->SelectDevice from Mplab 
	radix dec
xtal EQU 8000000		; _INTRC_IO internal osc; can select other internal freq using OSCCON
baud EQU 19200			; 
;xtal EQU 20000000		; _HS_OSC external quarz
;baud EQU 115200

	;********************************************************************
	;	Tiny Bootloader		16F88 series		Size=100words
	;	claudiu.chiculita@ugal.ro
	;	http://www.etc.ugal.ro/cchiculita/software/picbootloader.htm
	;********************************************************************

	#include "../icdpictypes.inc"
	#include "../spbrgselect.inc"
	#include "../bankswitch.inc"
	#define prima_adresa max_flash-100 ; 100 word in size
	
	;CP    CCPMX   DEBUG   WRT1 WRT0 CPD   LVP   BOREN   MCLRE   FOSC2   PWRTEN   WDTEN  FOSC1   FOSC0
	;1=off  0?     1=off   off=1  1  1    0=off  1=on    1=on     1      0=on     0=off    0      0
	__CONFIG    _CONFIG1, _INTRC_IO  & _CP_OFF & _CCP1_RB0 & _DEBUG_OFF & _WRT_PROTECT_OFF & _CPD_OFF & _LVP_OFF & _BODEN_ON & _MCLR_ON & _PWRTE_ON & _WDT_OFF
;	__CONFIG    _CONFIG1,   _HS_OSC  & _CP_OFF & _CCP1_RB0 & _DEBUG_OFF & _WRT_PROTECT_OFF & _CPD_OFF & _LVP_OFF & _BODEN_ON & _MCLR_ON & _PWRTE_ON & _WDT_OFF
	__CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF

	errorlevel 1, -305
	
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
	;startupd	
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
;               |
;	C1			H  L  nr  ...(lo hi)...  crc
;	   id  K	
	
	ORG prima_adresa
	nop
	nop
	nop
	nop
	org prima_adresa+4
IntrareBootloader
	bsf	STATUS,RP0	;BANK1_
	movlw	b'01111000'				; osc internal 8 Mhz
	movwf	OSCCON
		;btfss	OSCCON,IOFS; buggy IOFS, canot be relied on, errata
		;goto $-1
	call	Receive		;uart is not started yet
				;for _HS_OSC mode this delay is not necessary

							;init serial port
	;clrf	STATUS		;BANK0
	movlw	b'10010000'
	movwf	RCSTA
	bsf	STATUS,RP0	;BANK1_
	movlw	b'00100100'
	movwf	TXSTA
	movlw	spbrg_value
	movwf	SPBRG
			;wait for computer
	call	Receive			
	sublw	0xC1				;Expect C1
	skpz
	goto	way_to_exit
	SendL	IdTypePIC			;PIC type

MainLoop
	clrf	STATUS				;bank0
	SendL 'K'
mainl
	clrf	crc
	call	Receive				;H
		bsf STATUS,RP1			;bank2
	movwf	EEADRH
	call	Receive				;L
		bsf STATUS,RP1			;bank2
	movwf	EEADR

	call	Receive				;count
	movwf	contor				;=1,eeprom  =even,flash
	movwf	i
	movlw	buffer-1
	movwf	FSR
rcvoct
	call	Receive
	incf	FSR
	movwf	INDF
	decfsz	i
	goto	rcvoct
	
		call	Receive
	skpz	; Z is fresh from Receive (check sum)
	goto	ziieroare
				;write
	movlw	buffer
	movwf	FSR
;EECON1
;	7	6	5	4	3	2	1	0
;   EEPGD                    FREE   WRERR    WREN      WR      RD
; prog.mem                  erase           allow    init  readEE

	;first erase (or write EEprom); I am in bank2
	bsf STATUS,RP1			;bank switch 0->2
	movlw	0x94
	btfss	contor,0
	call	KeySequence
writeloop					; write 2 bytes = 1 instruction
	movf	INDF,w
	movwf	EEDATA
	incf	FSR
	movf	INDF,w
	movwf	EEDATH
	incf	FSR	

	movlw	0x04		;EEPROM
	btfss	contor,0
	movlw	0x84		;WREN+EEPGD
	call	KeySequence	
	
	incf	EEADR				;does not cross zones
	btfss	contor,0				; if writing to EEPROM, skip first counter dec.
	decf	contor
	decfsz	contor
	goto	writeloop
	
	goto	MainLoop
ziieroare
	SendL 'N'
	goto	mainl

KeySequence	; Expects W, bank2
	BANK3_
	movwf	EECON1
	movlw	0x55
	movwf	EECON2
	movlw	0xaa
	movwf	EECON2	
	bsf	EECON1,WR
innofensive0
	bcf	EECON1,WREN;nop ;PIR1,CCP1IF
	goto	$+1;nop
	BANK2_
	;clrwdt
justaret
	return




Receive	; always exits on bank0		; we wish approx 600ms (or more)
	movlw	xtal/4000000+1		;
	movwf	cnt3
rpt3	clrf	cnt2	;this goes 458000 cy
rpt2	clrf	cnt1
rpt1
		clrf	STATUS
		btfss PIR1,RCIF			;test RX
		goto $+4
		movf RCREG,w			;return in W
		addwf crc,f			;compute crc
		return
	decfsz	cnt1
	goto	rpt1
	decfsz	cnt2
	goto	rpt2
	decfsz	cnt3
	goto	rpt3						
						;timeout:
	btfss	RCSTA,	SPEN			;this is for startup delay
	return
way_to_exit					;exit in all other cases; must be BANK0
	bcf	RCSTA,	SPEN			; deactivate UART
	goto	prima_adresa
;*************************************************************
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.

            END
