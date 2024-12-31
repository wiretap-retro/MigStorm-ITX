/****************************************************************************
*  Copyright (c) 2009 by Michael Fischer. All rights reserved.
*
*  Redistribution and use in source and binary forms, with or without 
*  modification, are permitted provided that the following conditions 
*  are met:
*  
*  1. Redistributions of source code must retain the above copyright 
*     notice, this list of conditions and the following disclaimer.
*  2. Redistributions in binary form must reproduce the above copyright
*     notice, this list of conditions and the following disclaimer in the 
*     documentation and/or other materials provided with the distribution.
*  3. Neither the name of the author nor the names of its contributors may 
*     be used to endorse or promote products derived from this software 
*     without specific prior written permission.
*
*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
*  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
*  THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
*  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
*  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
*  AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
*  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
*  THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
*  SUCH DAMAGE.
*
****************************************************************************
*
*  History:
*
*  25.09.09  mifi   First Version, based on the example from Quantum Leaps 
*                   with some small modifications. The original can be find 
*                   here: http://www.embedded.com/design/200900043
*
*                   For information e.g. how to setup the CPU take a look
*                   in the AT91 Software Packages which can be find here:
*                   http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4343
****************************************************************************/
#define __LOW_LEVEL_INIT_C__

#include <stdint.h>
#include "AT91SAM7S256.h"

extern void UndefHandler (void);
extern void SWIHandler (void);
extern void PAbortHandler (void);
extern void DAbortHandler (void);
extern void IRQHandler (void);
extern void FIQHandler (void);

/*=========================================================================*/
/*  DEFINE: All Structures and Common Constants                            */
/*=========================================================================*/
/* LDR pc, [pc, #0x18] */
#define LDR_PC_PC       0xE59FF018U 
#define MAGIC           0xDEADBEEFU

/* Register Base Address */
#define RSTC_KEY        0xA5000000
#define RSTC_URSTEN     0x00000001

#define MC_FMR_OFF      0x00000060
#define MC_FWS_1FWS     0x00480100

/* Startup time of main oscillator (in number of slow clock ticks). */
#define BOARD_OSCOUNT   (AT91C_CKGR_OSCOUNT & (0x40 << 8))

/* USB PLL divisor value to obtain a 48MHz clock. */
#define BOARD_USBDIV    AT91C_CKGR_USBDIV_1

/* PLL frequency range. */
#define BOARD_CKGR_PLL  AT91C_CKGR_OUT_0

/* PLL startup time (in number of slow clock ticks). */
#define BOARD_PLLCOUNT  (16 << 8)

/* PLL MUL value. */
#define BOARD_MUL       (AT91C_CKGR_MUL & (72 << 16))

/* PLL DIV value. */
#define BOARD_DIV       (AT91C_CKGR_DIV & 14)

/* Master clock prescaler value. */
#define BOARD_PRESCALER AT91C_PMC_PRES_CLK_2


/*=========================================================================*/
/*  DEFINE: Prototypes                                                     */
/*=========================================================================*/

/*=========================================================================*/
/*  DEFINE: Definition of all local Data                                   */
/*=========================================================================*/

/*=========================================================================*/
/*  DEFINE: Definition of all local Procedures                             */
/*=========================================================================*/

/*=========================================================================*/
/*  DEFINE: All code exported                                              */
/*=========================================================================*/
/***************************************************************************/
/*  low_level_init                                                         */
/*                                                                         */
/*  This function is invoked by the startup sequence after initializing    */
/*  the C stack, but before initializing the segments in RAM.              */
/*                                                                         */
/*  low_level_init() is invoked in the ARM state. The function gives the   */
/*  application a chance to perform early initializations of the hardware. */
/*  This function cannot rely on initialization of any static variables,   */
/*  because these have not yet been initialized in RAM.                    */
/***************************************************************************/
void low_level_init (void *reset_addr, void *return_addr) 
{
   extern uint8_t __ram_start;
   
   /*
    * The watchdog is enabled after processor reset. Disable it.
    */
   AT91C_BASE_WDTC->WDTC_WDMR = AT91C_WDTC_WDDIS;
   //*AT91C_WDTC_WDMR = AT91C_WDTC_WDDIS; // disable watchdog
   /*
    * Enable user reset: assertion length programmed to 1ms
    */
   AT91C_BASE_RSTC->RSTC_RMR = (RSTC_KEY | RSTC_URSTEN | (4 << 8));
   //*AT91C_RSTC_RMR = (0xA5 << 24) | AT91C_RSTC_URSTEN;   // enable external user reset input
   /*
    * Use 2 cycles for flash access.
    */
   //AT91C_BASE_MC->MC_FMR = MC_FWS_1FWS;
   *AT91C_MC_FMR = 1 << 8; // Flash wait states



   /*
    * Disable all interrupts. Useful for debugging w/o target reset.
    */
   AT91C_BASE_AIC->AIC_EOICR = 0xFFFFFFFF;   
   AT91C_BASE_AIC->AIC_IDCR  = 0xFFFFFFFF;
   
   /*
    * Setup the CPU now...
    */
     
   /* Initialize main oscillator */
   //  AT91C_BASE_PMC->PMC_MOR = BOARD_OSCOUNT | AT91C_CKGR_MOSCEN;
   // while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MOSCS));


   // configure clock generator
   *AT91C_CKGR_MOR = AT91C_CKGR_MOSCEN | (40 << 8);
   while (!(*AT91C_PMC_SR & AT91C_PMC_MOSCS));


   /* Initialize PLL at 96MHz (96.109) and USB clock to 48MHz */
  // AT91C_BASE_PMC->PMC_PLLR = BOARD_USBDIV | BOARD_CKGR_PLL | BOARD_PLLCOUNT
  //                            | BOARD_MUL | BOARD_DIV;
  // while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_LOCK));

   *AT91C_CKGR_PLLR = AT91C_CKGR_OUT_0 | AT91C_CKGR_USBDIV_1 | (25 << 16) | (40 << 8) | 5; // DIV=5 MUL=26 USBDIV=1 (2) PLLCOUNT=40
       while (!(*AT91C_PMC_SR & AT91C_PMC_LOCK));


   /* Wait for the master clock if it was already initialized */
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

   /* Switch to slow clock + prescaler */
   AT91C_BASE_PMC->PMC_MCKR = BOARD_PRESCALER;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));

   /* Switch to fast clock + prescaler */
   AT91C_BASE_PMC->PMC_MCKR |= AT91C_PMC_CSS_PLL_CLK;
   while (!(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY));
   

   /*******************************************************************/
   /*  Warning, warning, warning, warning, warning, warning           */
   /*                                                                 */
   /*  This trick is used to check if we are running from Flash.      */
   /*  In this case __ram_start is set to the RAM start address       */
   /*  of the AT91SAM, which is 0x00200000.                           */
   /*                                                                 */
   /*  Only than, we can map the exception vectors from RAM to Flash. */
   /*******************************************************************/
   if ((uint32_t)&__ram_start == 0x00200000)
   {
      /* 
       * Setup the exception vectors to RAM
       *
       * NOTE: the exception vectors must be in RAM *before* the remap
       * in order to guarantee that the ARM core is provided with valid vectors
       * during the remap operation.
       */
       
      /* Setup the primary vector table in RAM */
      *(uint32_t volatile *)(&__ram_start + 0x00) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x04) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x08) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x0C) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x10) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x14) = MAGIC;
      *(uint32_t volatile *)(&__ram_start + 0x18) = LDR_PC_PC;
      *(uint32_t volatile *)(&__ram_start + 0x1C) = LDR_PC_PC;

      /* setup the secondary vector table in RAM */
      *(uint32_t volatile *)(&__ram_start + 0x20) = (uint32_t)reset_addr;
      *(uint32_t volatile *)(&__ram_start + 0x24) = (uint32_t)UndefHandler;
      *(uint32_t volatile *)(&__ram_start + 0x28) = (uint32_t)SWIHandler;
      *(uint32_t volatile *)(&__ram_start + 0x2C) = (uint32_t)PAbortHandler;
      *(uint32_t volatile *)(&__ram_start + 0x30) = (uint32_t)DAbortHandler;
      *(uint32_t volatile *)(&__ram_start + 0x34) = 0;
      *(uint32_t volatile *)(&__ram_start + 0x38) = (uint32_t)IRQHandler;
      *(uint32_t volatile *)(&__ram_start + 0x3C) = (uint32_t)FIQHandler;

      /* 
       * Check if the Memory Controller has been remapped already 
       */
      if (MAGIC != (*(uint32_t volatile *)0x14)) 
      {
         /* perform Memory Controller remapping */
         *(uint32_t volatile *)(0xFFFFFF00) = 1;
      }
   }      
   
} /* low_level_init */

/*** EOF ***/
