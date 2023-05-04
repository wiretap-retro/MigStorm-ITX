; WARNING: This program assumes you have some leds connected (with resistors) to some pins;
; Do not tie any pins directly to Vdd or GND when running this program;
; if by accident one is connected, and configured as output, it will be damaged.

	LIST      P=16F88;, F=INHX8M
	#include "p16f88.inc"        

	__CONFIG    _CONFIG1, _CP_OFF & _CCP1_RB0 & _DEBUG_OFF & _WRT_ENABLE_OFF & _CPD_OFF & _LVP_OFF & _BODEN_ON & _MCLR_OFF & _PWRTE_ON & _WDT_OFF & _HS_OSC
	__CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF


	CBLOCK 0x20
	cnt1
	cnt2
	cnt3
	ax
	ENDC

	ORG       0x0000
	clrf STATUS
	movlw 0x00
	movwf PCLATH
	goto init


;************ initial *******************
init      
	BANKSEL	PORTA 		; select bank of PORTA
	CLRF	PORTA 		; Initialize PORTA by clearing output data latches
	CLRF	PORTB
	BANKSEL ANSEL 		; Select Bank of ANSEL
	CLRF	ANSEL 		; as digital inputs
	CLRF	TRISA
	CLRF	TRISB
	BSF	PORTB,	2	; configure UART RX as input, not to collide with MAX232
	; !! also any pins connected to Vdd or GND should be configured as inputs, or else ... 	
        BANKSEL PORTA 		; select bank of PORTA 

start     
	movlw	d'50'
    call	Delay
    clrf	PORTA
    movlw	0xff
    movwf	PORTB
    
	movlw	d'50'
    call	Delay
    movlw	0xff
    movwf	PORTA
    clrf	PORTB
	goto start

		
Delay				;depends on W parameter  1..255
	movwf cnt1
NewD1
	movlw d'255'
	movwf cnt2
NewD2
	movlw d'255'
	movwf cnt3
NewD3
	decfsz cnt3
	goto NewD3
	
	decfsz cnt2
	goto NewD2	

	decfsz cnt1
	goto NewD1
	return

          END

