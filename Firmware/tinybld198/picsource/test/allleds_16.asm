; WARNING: This program assumes you have some leds connected (with resistors) to some pins;
; Do not tie any pins directly to Vdd or GND when running this program;
; if by accident one is connected, and configured as output, it will be damaged.

	LIST      P=16F876A;, F=INHX8M  
	#include "p16f876a.inc"     

	__CONFIG  _HS_OSC & _CP_OFF & _WDT_OFF & _BODEN_ON & _PWRTE_ON & _LVP_OFF & _DEBUG_OFF & _CPD_OFF

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
	bcf STATUS,IRP			
	bsf     STATUS,RP0     ; select bank 1
	movlw 	6
	movwf	ADCON1
 	clrf	TRISA
 	clrf	TRISB
 	clrf	TRISC
 	bsf	TRISC,	7	; configure UART RX as input, not to collide with MAX232
	; !! also any pins connected to Vdd or GND should be configured as inputs, or else ... 	
 	bcf     STATUS,RP0     ; select bank 0
 	clrf	PORTA
 	clrf	PORTB
 	clrf	PORTC
          

start     
	movlw	d'25'
    	call	Delay
    clrf	PORTA
    clrf	PORTB
    clrf	PORTC
    
	movlw	d'25'
    	call	Delay
    movlw	0xff
    movwf	PORTA
    movwf	PORTB
    movwf	PORTC        
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

