;********************************************************************
;	Tiny Bootloader		dsPIC series		Size=100words
;	claudiu.chiculita@ugal.ro
;	http://www.etc.ugal.ro/cchiculita/software/picbootloader.htm
;********************************************************************
        .equ __30F3013, 1
        .include "p30f3013.inc"
        
	;config		__FOSC, CSW_FSCM_OFF & HS;FRC & FRC_PLL4
	; fedcba9876543210
	; 11   FOS   FPR//
	;config		__FOSC, 0xC302	;HS
;	config		__FOSC, 0xC703
;	config          __FWDT, WDT_OFF
;	config          __FBORPOR, PBOR_OFF & MCLR_EN
;	config          __FGS, CODE_PROT_OFF
;check also ATIO (below)

.equ Fcy, 7372800
.equ baud, 19200
.equ IdTypePIC, 0x73
.equ max_flash, 0x4000		;dsPIC max address
	
        .global __reset
	
	.section .nbss, "b"
buff:	.space 4
buffer:	.space 128+6
W99:	.space 2

;REGISTRY:
;W0	imediat, param nvmcon
;W1	Receive
;W2	SendL		need?
;W3	count rcv
;W4	memory buffer pointer
;W5	^
;W6	for
;W7	temp
;W8
;W9	Erase/Write Flag
;W10	delay1
;W11	delay2
;W12	EA Write 
;W13	crc
;W14	void(black hole)
;W15	stack

.macro SendL car
	mov.b \car, W2
	mov W2,U1TXREG
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

_init_uart2:
	;Initialize and Enable UART2 for Tx and Rx
	mov	#0x8000, W0	;bit15=UARTEN  bit10=ALTIO
	mov	W0, U1MODE
	mov	#0x0400, W0	;bit10=UTXEN
	mov	W0, U1STA
        ;mov     #(((Fcy/baud) / 16) - 1), W0  ;?Initialize Baud rate (divide INSTRUCTION Cycle)
        mov     #( (2*Fcy)/(baud*16) - 1) / 2, W0
        mov     w0, U1BRG                           ;to 115200 Kbaud #(((7372800/115200) / 16) - 1)
	;2010 [8MHz,FRC=>2e6]/19200 => 6?
	;6014 [7.3MHz,x16,/4=>29.49e6]/115200 => 15
	;xxxx [20MHz,HS=>5e6]/19200 => 15
	;bset	U1MODE, #ALTIO
;	nop

		
			;wait for computer
	mov #buff, W4
	rcall Receive
	sub.b #0xC1, W1				;Expect C1h
	bra NZ, way_to_exit
	SendL #IdTypePIC			;send PIC type
MainLoop:
	SendL #'K'				; "-Everything OK, ready and waiting."
;      L  H  U  C  [c  b  a]+
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
	;test W3.H to find out what to do

	mov #(96+1), W6
dorcvB:	rcall Receive
	dec W6, W6
	bra NZ, dorcvB

	cp0 W13					;check crc
	bra Z, chksumok
ziieroare:					;CRC failed
	SendL #'N'
	bra mainl
chksumok:
	;-----------------------------------------------------
	;ERASE
	TBLWTL W0,[W12]				;dummy
	MOV #0x4041,W0
		clrwdt
	rcall Key_Sequence
	;Load_Write_Latch:
	MOV #buffer,W4
	DO #31, edtbl3
	TBLWTL.B [W4++],[W12++]
	TBLWTL.B [W4++],[W12--]
	TBLWTH.B [W4++],[W12]
edtbl3:	inc2 W12, W12

	MOV #0x4001,W0
	rcall Key_Sequence
	bra MainLoop
	;-----------------------------------------------------	


Key_Sequence:		; Expects a NVMCON value in W0
	MOV W0,NVMCON			
	MOV #0x55,W0		; Write the key sequence
	MOV W0,NVMKEY
	MOV #0xAA,W0
	MOV W0,NVMKEY
	BSET NVMCON,#WR		; Start the write cycle
	NOP
	NOP
	RETURN
	

	
Receive:
	; 1000 * 65536*7/Fcy/62/16
	;mov #(1000 * 65536/Fcy),W10	; ms to wait
	;mov #(500 * (Fcy/1000)/(65550*7)),W10
	mov #(64*Fcy/30000000) ,W10 ; 64 = less than 1s
rpt2:
	mov #0,W11
rpt1:
	btss U1STA, #URXDA
	bra norcv
	mov U1RXREG,W1			;return read data in W
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
	clr U1MODE			; deactivate UART
	bra first_address


.end



