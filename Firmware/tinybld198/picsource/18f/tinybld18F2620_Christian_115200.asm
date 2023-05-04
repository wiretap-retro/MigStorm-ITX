	radix DEC
	LIST      P=18F2620	; change also: Configure->SelectDevice from Mplab 
xtal EQU 8000000		; you may want to change: _XT_OSC_1H  _HS_OSC_1H  _HSPLL_OSC_1H
baud EQU .16			; for 115200
;baud EQU .34			; for 57600
;baud EQU .52			; for 38400
;baud EQU .103			; for 19200
	; The above 3 lines can be changed and buid a bootloader for the desired frequency (and PIC type)
	
	;********************************************************************
	;	Tiny Bootloader		18F series		Size=100words
	;	claudiu.chiculita@ugal.ro
	;	http://www.etc.ugal.ro/cchiculita/software/picbootloader.htm
	;********************************************************************
	

	#include "icdpictypes.inc"	;takes care of: #include "p18fxxx.inc",  max_flash, IdTypePIC

	#define first_address max_flash-200		;100 words
	CONFIG OSC		= INTIO67
	CONFIG FCMEN	= OFF
	CONFIG IESO		= OFF
	CONFIG PWRT		= ON
	CONFIG WDT		= OFF
	CONFIG WDTPS	= 32
	CONFIG MCLRE	= ON
	CONFIG PBADEN	= OFF
	CONFIG CCP2MX	= PORTBE
	CONFIG STVREN	= OFF
	CONFIG LVP		= OFF
	CONFIG XINST	= OFF
	CONFIG DEBUG	= OFF
	CONFIG CP0		= OFF
	CONFIG CP1		= OFF
	CONFIG CP2		= OFF
	CONFIG CP3		= OFF
	CONFIG CPB		= OFF
	CONFIG CPD		= OFF
	CONFIG WRT0		= OFF
	CONFIG WRT1		= OFF
	CONFIG WRT2		= OFF
	CONFIG WRT3		= OFF
	CONFIG WRTB		= OFF
	CONFIG WRTC		= OFF
	CONFIG WRTD		= OFF
	CONFIG EBTR0	= OFF
	CONFIG EBTR1	= OFF
	CONFIG EBTR2	= OFF
	CONFIG EBTR3	= OFF
	CONFIG EBTRB	= OFF


;----------------------------- PROGRAM ---------------------------------
	cblock 0
	crc
	i
	cnt1
	cnt2
	cnt3
	counter_hi
	counter_lo
	flag
	endc
	cblock 10
	buffer:64
	endc
	
SendL macro car
	movlw car
	movwf TXREG
	endm
	
;0000000000000000000000000 RESET 00000000000000000000000000

	ORG     0x0000
	GOTO    IntrareBootloader

;view with TabSize=4
;&&&&&&&&&&&&&&&&&&&&&&&   START     &&&&&&&&&&&&&&&&&&&&&&
;----------------------  Bootloader  ----------------------
;PC_flash:		C1h				U		H		L		x  ...  <64 bytes>   ...  crc	
;PC_eeprom:		C1h			   	40h   EEADR   EEDATA	0		crc					
;PC_cfg			C1h			U OR 80h	H		L		1		byte	crc
;PIC_response:	   type `K`
	
	ORG first_address		;space to deposit first 4 instr. of user prog.
	nop
	nop
	nop
	nop

	ORG first_address+8

IntrareBootloader
							;switch internal oscillator to 8MHz
	setf OSCCON
							;init serial port
	movlw b'00100100'
	movwf TXSTA
	movlw b'10010000'
	movwf RCSTA
	bsf BAUDCON, BRG16
	movlw baud
	movwf SPBRG
							;wait for computer
	rcall Receive			
	sublw 0xC1				;Expect C1h
	bnz way_to_exit
	SendL IdTypePIC			;send PIC type

MainLoop
	SendL 'K'				; "-Everything OK, ready and waiting."

mainl
	clrf crc
	rcall Receive			;Upper
	movwf TBLPTRU
	movwf flag			;(for EEPROM and CFG cases)
	rcall Receive			;Hi
	movwf TBLPTRH
	movwf EEADR			;(for EEPROM case)
	rcall Receive			;Lo
	movwf TBLPTRL
	movwf EEDATA		;(for EEPROM case)

	rcall Receive			;count
	movwf i
	incf i
	lfsr FSR0, (buffer-1)

rcvoct						;read 64+1 bytes
	movwf TABLAT		;prepare for cfg; => store byte before crc
	rcall Receive
	movwf PREINC0
	decfsz i
	bra rcvoct
	
	tstfsz crc				;check crc
	bra ziieroare
	btfss flag,6		;is EEPROM data?
	bra noeeprom
	movlw b'00000100'	;Setup eeprom
	rcall Write
	bra waitwre

noeeprom
	btfss flag,7		;is CFG data?
	bra noconfig
	tblwt*				;write TABLAT(byte before crc) to TBLPTR***
	movlw b'11000100'	;Setup cfg
	rcall Write
	bra waitwre

noconfig
							;write
eraseloop
	movlw	b'10010100'		; Setup erase
	rcall Write
	TBLRD*-					; point to adr-1
	
writebigloop	
	movlw 8					; 8groups
	movwf counter_hi
	lfsr FSR0,buffer

writesloop
	movlw 8					; 8bytes = 4instr
	movwf counter_lo

writebyte
	movf POSTINC0,w			; put 1 byte
	movwf TABLAT
	tblwt+*
	decfsz counter_lo
	bra writebyte
	
	movlw	b'10000100'		; Setup writes
	rcall Write
	decfsz counter_hi
	bra writesloop

waitwre	
	;btfsc EECON1,WR		;for eeprom writes (wait to finish write)
	;bra waitwre			;no need: round trip time with PC bigger than 4ms
	
	bcf EECON1,WREN			;disable writes
	bra MainLoop
	
ziieroare					;CRC failed
	SendL 'N'
	bra mainl
	  
;******** procedures ******************

Write
	movwf EECON1
	movlw 0x55
	movwf EECON2
	movlw 0xAA
	movwf EECON2
	bsf EECON1,WR			;WRITE
	nop
	;nop
	return

Receive
	movlw xtal/2000000+1	; for 20MHz => 11 => 1second delay
	movwf cnt1

rpt2						
	clrf cnt2

rpt3
	clrf cnt3

rptc
	btfss PIR1,RCIF			;test RX
	bra notrcv
    movf RCREG,w			;return read data in W
    addwf crc,f				;compute crc
	return

notrcv
	decfsz cnt3
	bra rptc
	decfsz cnt2
	bra rpt3
	decfsz cnt1
	bra rpt2
	;timeout:

way_to_exit
	bcf	RCSTA,	SPEN			; deactivate UART
	bra first_address
;*************************************************************
; After reset
; Do not expect the memory to be zero,
; Do not expect registers to be initialised like in catalog.

            END
