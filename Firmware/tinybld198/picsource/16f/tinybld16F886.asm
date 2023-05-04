	radix DEC
	LIST      P=16F887, F=INHX8M	; change also: Configure->SelectDevice from Mplab

                        ; auto-start at 4MHz internal osc     
xtal EQU 4000000		; you may also want to change: _HS_OSC _XT_OSC
baud EQU 19200			; standard TinyBld baud rates: 115200 or 19200


	; The above 3 lines can be changed and buid a bootloader for the desired frequency (and PIC type)

	;********************************************************************
	;	Tiny Bootloader		16FxxxA series		Size=100words
	;	claudiu.chiculita@ugal.ro
	;	http://www.etc.ugal.ro/cchiculita/software/picbootloader.htm
	;********************************************************************

	#include "../icdpictypes.inc"	;takes care of: #include "p16fxxxA.inc",  max_flash, IdTypePIC
	#include "../spbrgselect.inc"
	#include "../bankswitch.inc"
	#define first_address max_flash-100 ; 100 word in size

;using the internal osc (4 MHz is default speed).Modified by Gordon W.
__CONFIG _CONFIG1, b'1110000011000100' ;unimplemented use 1
__CONFIG _CONFIG2, b'1111111011111111'
;	__CONFIG    _CONFIG1, _LVP_OFF & _FCMEN_OFF & _IESO_OFF & _BOR_OFF & _CPD_OFF & _CP_OFF & _MCLRE_ON & _PWRTE_ON & _WDT_OFF & _INTRC_OSC_NOCLKOUT
;	__CONFIG    _CONFIG2, _WRT_OFF & _BOR21V

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

;view with TabSize=4
;&&&&&&&&&&&&&&&&&&&&&&&   START     &&&&&&&&&&&&&&&&&
;----------------------  Bootloader  ----------------------
;               
;PC_flash:    C1h          AddrH  AddrL  nr  ...(DataLo DataHi)...  crc
;PIC_response:   id   K                                                 K

	
	ORG first_address
	nop
	nop
	nop
	nop
	org first_address+4
IntrareBootloader
			;init serial port
	clrf	STATUS
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
	clrf	crc
	call	Receive				;H
		bsf STATUS,RP1			;bank2
	movwf	EEADRH
	movwf	flag				;used to detect if is eeprom
	call	Receive				;L
		bsf STATUS,RP1			;bank2
	movwf	EEADR

	call	Receive				;count
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
	
	movf	crc,f				;check checksum
	skpz
	goto	ziieroare
				;write
		bsf STATUS,RP1			;bank switch 0->2
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
		BANK3_					;bank  2->3
	bcf		EECON1,EEPGD
	btfss	flag,6				;is eeprom (or flash)
	bsf		EECON1,EEPGD
	bsf		EECON1,WREN
	movlw	0x55
	movwf	EECON2
	movlw	0xaa
	movwf	EECON2	
	bsf		EECON1,WR
	nop
	nop
waitwre	
;	btfsc	EECON1,WR			;for eeprom writes (wait to finish write)
;	goto	waitwre
	bcf		EECON1,WREN
		BANK2_					;bank2
	incf	EEADR				;does not cross zones
	btfss	flag,6				; if writing to EEPROM, skip first counter dec.
	decf	contor
	decfsz	contor
	goto	writeloop
	
	goto	MainLoop
ziieroare
	SendL 'N'
	goto	mainl
	  

Receive
	clrf	STATUS
	movlw	xtal/2000000+1		; for 20MHz => 11 => 1second
	movwf	cnt1
rpt2						
	clrf	cnt2
rpt3
	clrf	cnt3
rptc
		btfss PIR1,RCIF			;test RX
		goto $+4
		movf RCREG,w			;return in W
		addwf crc,f				;compute checksum
		return
	clrwdt
	decfsz	cnt3
	goto	rptc
	decfsz	cnt2
	goto	rpt3
	decfsz	cnt1
	goto	rpt2
				;timeout:
way_to_exit			;exit in all other cases; must be BANK0/1
	;BANK0_
	bcf	RCSTA,	SPEN	; deactivate UART
	goto	first_address
;*************************************************************
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.

            END
