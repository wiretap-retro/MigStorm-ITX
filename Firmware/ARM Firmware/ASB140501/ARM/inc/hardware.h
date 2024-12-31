#define MCLK 48000000
#define FWS 1 // Flash wait states

#define DISKLED    AT91C_PIO_PA10
#define MMC_CLKEN  AT91C_PIO_PA24
#define MMC_SEL    AT91C_PIO_PA27
#define DIN AT91C_PIO_PA20
#define CCLK AT91C_PIO_PA4
#define PROG_B AT91C_PIO_PA9
#define INIT_B AT91C_PIO_PA7
#define DONE AT91C_PIO_PA8
#define FPGA0 AT91C_PIO_PA26
#define FPGA1 AT91C_PIO_PA25
#define FPGA2 AT91C_PIO_PA15
#define BUTTON AT91C_PIO_PA28

#define DISKLED_ON *AT91C_PIOA_SODR = DISKLED;
#define DISKLED_OFF *AT91C_PIOA_CODR = DISKLED;
// #define RAMFUNC   __attribute__ ((section(".ramsection")))
#define RAMFUNC __attribute__ ((section (".text.fastcode")))
void init_hardware(void);
void USART_Init(unsigned long baudrate);
void USART_Write(unsigned char c);
void USART_Putc(void* p, char c);
RAMFUNC void SPI_Init(void);
RAMFUNC unsigned char SPI(unsigned char outByte);
RAMFUNC void SPI_Wait4XferEnd(void);
RAMFUNC void EnableCard(void);
RAMFUNC void DisableCard(void);
void EnableFpga(void);
void DisableFpga(void);
void EnableOsd(void);
void DisableOsd(void);
unsigned long CheckButton(void);
void Timer_Init(void);
unsigned long GetTimer(unsigned long offset);
unsigned long CheckTimer(unsigned long t);
void WaitTimer(unsigned long time);


