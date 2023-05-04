;IdTypePIC
;bits      7   6   5   4   3  2  1  0
;meaning:   type16/18/ds |  model_nr
;
;
;If you want to work with another model that is not on the list
;find one model that is similar to yours and has THE SAME amount
;of flash and replace its "IFDEF __XXXXXX" and 
;"#include "ZZZZZZZZZ.inc"", but the ID must remain.
;Each IdTypePIC has one corespondent in the PC application,
;if you add new ones they will not be recognized.

IdTypePIC SET 0

	IFDEF __16F876A
		#include "p16f876a.inc"
IdTypePIC = 0x31		
		#define max_flash 0x2000
	ENDIF
	IFDEF __16F877A
		#include "p16f877a.inc"
IdTypePIC = 0x31		
		#define max_flash 0x2000
	ENDIF

	IFDEF __16F873A
		#include "p16f873a.inc"
IdTypePIC = 0x32		
		#define max_flash 0x1000
	ENDIF
	IFDEF __16F874A
		#include "p16f874a.inc"
IdTypePIC = 0x32		
		#define max_flash 0x1000
	ENDIF

	IFDEF __16F87
		#include "p16f87.inc"
IdTypePIC = 0x33		
		#define max_flash 0x1000
	ENDIF
	IFDEF __16F88
		#include "p16f88.inc"
IdTypePIC = 0x33		
		#define max_flash 0x1000
	ENDIF

	IFDEF __16F886
		#include "p16f886.inc"
IdTypePIC = 0x36
		#define max_flash 0x2000
	ENDIF
	
	IFDEF __16F887
		#include "p16f887.inc"
IdTypePIC = 0x36		
		#define max_flash 0x2000
	ENDIF


;---------- 18F -------------

	; 28/40pin
	IFDEF __18F252
		#include "p18f252.inc"
IdTypePIC = 0x41
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F452
		#include "p18f452.inc"
IdTypePIC = 0x41
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F242
		#include "p18f242.inc"
IdTypePIC = 0x42
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F442
		#include "p18f442.inc"
IdTypePIC = 0x42
		#define max_flash 0x4000
	ENDIF



	IFDEF __18F2520
		#include "p18f2520.inc"
IdTypePIC = 0x41
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F4520
		#include "p18f4520.inc"
IdTypePIC = 0x41
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F2420
		#include "p18f2420.inc"
IdTypePIC = 0x42
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F4420
		#include "p18f4420.inc"
IdTypePIC = 0x42
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F4431
		#include "p18f4431.inc"
IdTypePIC = 0x42
		#define max_flash 0x4000
	ENDIF

	; 28/40pin  can2.0
	IFDEF __18F258
		#include <p18f258.inc>
IdTypePIC = 0x43
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F2580
		#include <p18f2580.inc>
IdTypePIC = 0x43
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F458
		#include <p18f458.inc>
IdTypePIC = 0x43
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F4580
		#include <p18f4580.inc>
IdTypePIC = 0x43
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F248
		#include <p18f248.inc>
IdTypePIC = 0x44
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F2480
		#include <p18f2480.inc>
IdTypePIC = 0x44
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F448
		#include <p18f448.inc>
IdTypePIC = 0x44
		#define max_flash 0x4000
	ENDIF
	IFDEF __18F4480
		#include <p18f4480.inc>
IdTypePIC = 0x44
		#define max_flash 0x4000
	ENDIF


	; 18/28pin 6pwm  (some:I2C/SPI)
	IFDEF __18F1320
		#include <p18f1320.inc>
IdTypePIC = 0x45
		#define max_flash 0x2000
	ENDIF
	IFDEF __18F2320
		#include <p18f2320.inc>
IdTypePIC = 0x45
		#define max_flash 0x2000
	ENDIF
	IFDEF __18F2331
		#include <p18f2331.inc>
IdTypePIC = 0x45
		#define max_flash 0x2000
	ENDIF
	IFDEF __18F1220
		#include <p18f1220.inc>
IdTypePIC = 0x46
		#define max_flash 0x1000
	ENDIF
	IFDEF __18F2220
		#include <p18f2220.inc>
IdTypePIC = 0x46
		#define max_flash 0x1000
	ENDIF

	
	; 40pin  6pwm
	IFDEF __18F4320
		#include <p18f4320.inc>
IdTypePIC = 0x47
		#define max_flash 0x2000
	ENDIF
	IFDEF __18F4331
		#include <p18f4331.inc>
IdTypePIC = 0x47
		#define max_flash 0x2000
	ENDIF

	IFDEF __18F4220
		#include <p18f4220.inc>
IdTypePIC = 0x48
		#define max_flash 0x1000
	ENDIF
	
	
	; 64/80pin TQFP 2usart
	IFDEF __18F6720
		#include <p18f6720.inc>
IdTypePIC = 0x4A
		#define max_flash 0x20000
	ENDIF
	IFDEF __18F8720
		#include <p18f8720.inc>
IdTypePIC = 0x4A
		#define max_flash 0x20000
	ENDIF
	IFDEF __18F6620
		#include <p18f6620.inc>
IdTypePIC = 0x4B
		#define max_flash 0x10000
	ENDIF
	IFDEF __18F8620
		#include <p18f8620.inc>
IdTypePIC = 0x4B
		#define max_flash 0x10000
	ENDIF
	IFDEF __18F6520
		#include <p18f6520.inc>
IdTypePIC = 0x4C
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F8520
		#include <p18f8520.inc>
IdTypePIC = 0x4C
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F8680
		#include <p18f8680.inc>
IdTypePIC = 0x4D
		#define max_flash 0x10000
	ENDIF


	;PIC18F 2525/2620/4525/4620  EA-USART, nanoWatt, intOSC

	IFDEF __18F2525
		#include "p18f2525.inc"
IdTypePIC = 0x4E
		#define max_flash 0xC000
	ENDIF
	IFDEF __18F2585
		#include "p18f2585.inc"
IdTypePIC = 0x4E
		#define max_flash 0xC000
	ENDIF
	IFDEF __18F4525
		#include "p18f4525.inc"
IdTypePIC = 0x4E
		#define max_flash 0xC000
	ENDIF
	IFDEF __18F4585
		#include "p18f4585.inc"
IdTypePIC = 0x4E
		#define max_flash 0xC000
	ENDIF
	IFDEF __18F2620
		#include "p18f2620.inc"
IdTypePIC = 0x4F
		#define max_flash 0x10000
	ENDIF
	IFDEF __18F2680
		#include "p18f2680.inc"
IdTypePIC = 0x4F
		#define max_flash 0x10000
	ENDIF
	IFDEF __18F4620
		#include "p18f4620.inc"
IdTypePIC = 0x4F
		#define max_flash 0x10000
	ENDIF
	IFDEF __18F4680
		#include "p18f4680.inc"
IdTypePIC = 0x4F
		#define max_flash 0x10000
	ENDIF

;---------------- USB ------------------------------

	IFDEF __18F2550
		#include "p18f2550.inc"
IdTypePIC = 0x55
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F4550
		#include "p18f4550.inc"
IdTypePIC = 0x55
		#define max_flash 0x8000
	ENDIF
	IFDEF __18F2455
		#include "p18f2455.inc"
IdTypePIC = 0x56
		#define max_flash 0x6000
	ENDIF
	IFDEF __18F4455
		#include "p18f4455.inc"
IdTypePIC = 0x56
		#define max_flash 0x6000
	ENDIF
	IFDEF __18F4685
		#include "p18f4685.inc"
IdTypePIC = 0x57
		#define max_flash 0x18000
	ENDIF

	if IdTypePIC==0
		error "Pic not yet implemeted"
	endif



    IFDEF __18F2685
            #include <p18f2685.inc>
IdTypePIC = 0x57
            #define max_flash 0x18000 ; 18000
    ENDIF	
