;********************************************************************
;	Tiny Bootloader		dsPIC series		Size=100words
;	claudiu.chiculita@ugal.ro
;	http://www.etc.ugal.ro/cchiculita/software/picbootloader.htm
;********************************************************************
;        .equ __30F6014, 1
	.equ __30F2010, 1
        .include "p30fxxxx.inc"
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++        
;FOSC	; fedcba9876543210
	; 11   FOS   FPR//

;	:(
        .section __FOSC.sec, code
        .global __FOSC
__FOSC: .pword HS
;__FOSC: .pword CSW_FSCM_OFF & XT_PLL4
        .section __FWDT.sec, code
        .global __FWDT
__FWDT: .pword WDT_OFF
        .section __FBORPOR.sec, code
        .global __FBORPOR
__FBORPOR: .pword PBOR_OFF & MCLR_EN
        .section __FGS.sec, code
        .global __FGS
__FGS: .pword CODE_PROT_OFF


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;.equ Fcy, 7372800	; = internal instruction cycle
;.equ baud, 115200

.equ Fcy, 5000000
.equ baud, 19200

			;dsPIC addresses
.ifdef __30F2010
	.equ IdTypePIC, 0x70			;ds2010
	.equ max_flash, 0x2000
.endif


.ifdef __30F6014
	.equ IdTypePIC, 0x71			;ds6014/6012
	.equ max_flash, 0x18000
.endif
.ifdef __30F6012
	.equ IdTypePIC, 0x71
	.equ max_flash, 0x18000
.endif
.ifdef __30F6013
	.equ IdTypePIC, 0x72			;ds6013/6011
	.equ max_flash, 0x16000
.endif
.ifdef __30F6011
	.equ IdTypePIC, 0x72
	.equ max_flash, 0x16000
.endif


.ifdef __30F3013
	.equ IdTypePIC, 0x73			;ds3013/3012
	.equ max_flash, 0x4000
.endif
.ifdef __30F3012
	.equ IdTypePIC, 0x73
	.equ max_flash, 0x4000
	.equ disableADC, 1
.endif
.ifdef __30F2012
	.equ IdTypePIC, 0x74			;ds2012/2011
	.equ max_flash, 0x2000
.endif
.ifdef __30F2011
	.equ IdTypePIC, 0x74
	.equ max_flash, 0x2000
	.equ disableADC, 1
.endif


.ifdef __30F4011
	.equ IdTypePIC, 0x75			;ds4011/4012
	.equ max_flash, 0x8000
.endif
.ifdef __30F4012
	.equ IdTypePIC, 0x75
	.equ max_flash, 0x8000
.endif


;.ifdef __30F3010
;	.equ IdTypePIC, 0x76			;ds3010/3011
;	.equ max_flash, 0x4000
;.endif
;.ifdef __30F3011
;	.equ IdTypePIC, 0x76
;	.equ max_flash, 0x4000
;.endif

	
.equ BootLoaderDelay, 1000			;delay (ms) before bootloader times out
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

        .global __reset
;	.section .nbss, "b"
	.section .nbss, bss, near

buff:	.space 4
buffer:	.space 128+5

;REGISTRY:
;W0	immediate
;W1	Receive
;W2	SendL		need?
;W3	count rcv
;W4	memory buffer pointer
;W5	^
;W6	for
;W7	KeySeq
;W8
;W9
;W10	delay1
;W11	delay2
;W12	EA Write 
;W13	crc
;W14	void(black hole)
;W15	stack

	.irp x,1
	.equ UxMODE, U&x&MODE
	.equ UxSTA, U&x&STA
	.equ UxBRG, U&x&BRG
	.equ UxTXREG, U&x&TXREG
	.equ UxRXREG, U&x&RXREG
	.endr

.macro SendL car
	mov.b \car, W2
	mov W2,UxTXREG
	.endm


.text
	.org	max_flash - 0x100 - ((32*3+4)*2)
first_address:
	clr W0
	clr W0
	clr W0	;nopr
	clr W0	;nopr
__reset:
BootloaderEntry:
        MOV #__SP_init, W15
        MOV #__SPLIM_init, W0
        MOV W0, SPLIM
        NOP
        
.ifdef disableADC
	bset PMD1bits, #0 	;disable adc module - it conflicts with the UART by default
.endif
	mov	#0x8000, W0	;bit15=UARTEN  bit10=ALTIO
	bset	W0, #ALTIO
	mov	W0, UxMODE
	mov	#0x0400, W0	;bit10=UTXEN
	mov	W0, UxSTA
        mov     #(((Fcy/baud) / 16) - 1), W0  ;?Initialize Baud rate (divide INSTRUCTION Cycle)
        mov     w0, UxBRG                           ;to 115200 Kbaud #(((7372800/115200) / 16) - 1)
       	;2010 [8MHz,FRC=>2e6]/19200 => 6?
	;6014 [7.3MHz,x16,/4=>29.49e6]/115200 => 15
	;xxxx [20MHz,HS=>5e6]/19200 => 15

			;wait for computer
	mov #buff, W4
	rcall Receive
	sub.b #0xC1, W1				;Expect C1h
	bra NZ, way_to_exit
	SendL #IdTypePIC			;send PIC type
MainLoop:
	SendL #'K'			; "-Everything OK, ready and waiting."
;flash       L  H  U  96  [c  b  a]+
;eeprom      L  H  7F  2  [l h]
;config      L  H  F8  2  [l h]
;            W12   W3L 
mainl:
	clr W13					;chksum
	mov #buff, W4

	mov #4, W6
dorcv4:	rcall Receive
	dec W6, W6
	bra NZ, dorcv4
	mov buff, W12
	mov buff+2, W3
	mov W3, TBLPAG

	swap W3
	inc.b W3, W6
dorcvB:	rcall Receive
	dec.b W6, W6
	bra NZ, dorcvB

	cp0 W13					;check crc
	bra Z, chksumok
ziieroare:					;CRC failed
	SendL #'N'
	bra mainl
chksumok:

	;ERASE
	TBLWTL W7,[W12]				;dummy
	MOV #0x4041,W7
		clrwdt
	rcall Key_Sequence
	;Load_Write_Latch:
	MOV #buffer,W4
	DO #31, edtbl3
	TBLWTL.B [W4++],[W12++]
	TBLWTL.B [W4++],[W12--]
	TBLWTH.B [W4++],[W12]
edtbl3:	inc2 W12, W12

	MOV #0x4001,W7
	rcall Key_Sequence
	bra MainLoop
	;-----------------------------------------------------	


Key_Sequence:		; Expects a NVMCON value in W0
	MOV W7,NVMCON			
	MOV #0x55,W7		; Write the key sequence
	MOV W7,NVMKEY
	MOV #0xAA,W7
	MOV W7,NVMKEY
	BSET NVMCON,#WR		; Start the write cycle
	NOP
	NOP
	RETURN

;Rcv1:	mov #buff, W4
	
Receive:
	mov #(BootLoaderDelay * (Fcy/1000)/(65550*7)),W10
rpt2:
	mov #0,W11
rpt1:
	btss UxSTA, #URXDA
	bra norcv
	mov UxRXREG,W1			;return read data in W
	mov.b W1,[W4++]
	add.b W1,W13,W13			;compute crc
	return
norcv:
	clrwdt
	dec W11, W11
	bra NZ, rpt1
	dec W10, W10
	bra NZ, rpt2
timeout:
way_to_exit:
	clr UxMODE			; deactivate UART
	bra first_address

.end



