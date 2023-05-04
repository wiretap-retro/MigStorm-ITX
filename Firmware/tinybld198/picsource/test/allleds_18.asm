; WARNING: This program assumes you have some leds connected (with resistors), and the other pins floating;
; Do not tie any pins directly to Vdd or GND when running this program;
; if by accident one is connected, and configured as output, it will be damaged.

	LIST      P=18F252;, F=INHX8M 
	#include "p18f252.inc"        

		__CONFIG	_CONFIG1H, b'11111010'	;_OSCS_OFF_1H & _HS_OSC_1H
		__CONFIG	_CONFIG2L, _BOR_ON_2L & _BORV_20_2L & _PWRT_ON_2L
		__CONFIG	_CONFIG2H, _WDT_OFF_2H & _WDTPS_128_2H
		__CONFIG	_CONFIG4L, _STVR_ON_4L & _LVP_OFF_4L & _DEBUG_OFF_4L
		__CONFIG	_CONFIG5L, _CP0_OFF_5L & _CP1_OFF_5L & _CP2_OFF_5L & _CP3_OFF_5L
		__CONFIG	_CONFIG5H, _CPB_OFF_5H & _CPD_OFF_5H
		__CONFIG	_CONFIG6L, _WRT0_OFF_6L & _WRT1_OFF_6L & _WRT2_OFF_6L & _WRT3_OFF_6L
		__CONFIG	_CONFIG6H, _WRTC_OFF_6H & _WRTB_OFF_6H & _WRTD_OFF_6H
		__CONFIG	_CONFIG7L, _EBTR0_OFF_7L & _EBTR1_OFF_7L & _EBTR2_OFF_7L & _EBTR3_OFF_7L
		__CONFIG	_CONFIG7H, _EBTRB_OFF_7H		
		
	CBLOCK 0x20
	cnt1
	cnt2
	cnt3
	ENDC

	ORG       0x0000
	goto init
	nop
	nop
	nop

;************ initial *******************
init      
	movlw 	6
	movwf	ADCON1
 	clrf	TRISA
 	clrf	TRISB
 	clrf	TRISC
  	bsf	TRISC,	7	; configure UART RX as input, not to collide with MAX232
	; !! also any pins connected to Vdd or GND should be configured as inputs, or else ... 	

 	clrf	PORTA
 	clrf	PORTB
 	clrf	PORTC
          

start     
	movlw	d'10'
    	rcall	Delay
    comf	PORTA
    comf	PORTB
    comf	PORTC
	bra start

		
Delay				;depends on W parameter  1..255
	movwf cnt1
dl1
	movlw d'255'
	movwf cnt2
dl2
	movlw d'255'
	movwf cnt3
dl3
	nop
	decfsz cnt3
	bra dl3
	decfsz cnt2
	bra dl2
	decfsz cnt1
	bra dl1
	return

          END

