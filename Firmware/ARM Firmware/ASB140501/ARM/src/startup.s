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
****************************************************************************/

/*****************************************************************************
* Product: Generic startup code for ARM with GNU toolset
* Date of the Last Update:  Jun 12, 2007
*
*                    Q u a n t u m     L e a P s
*                    ---------------------------
*                    innovating embedded systems
*
* Copyright (C) 2007 Quantum Leaps, LLC. All rights reserved.
*
* Contact information:
* Quantum Leaps Web site:  http://www.quantum-leaps.com
* e-mail:                  info@quantum-leaps.com
*****************************************************************************/

/* Standard definitions of Mode bits and Interrupt (I & F) flags in PSRs */

    .equ    I_BIT,          0x80      /* when I bit is set, IRQ is disabled */
    .equ    F_BIT,          0x40      /* when F bit is set, FIQ is disabled */

    .equ    USR_MODE,       0x10
    .equ    FIQ_MODE,       0x11
    .equ    IRQ_MODE,       0x12
    .equ    SVC_MODE,       0x13
    .equ    ABT_MODE,       0x17
    .equ    UND_MODE,       0x1B
    .equ    SYS_MODE,       0x1F

/* constant to pre-fill the stack */
    .equ    STACK_FILL,     0xAAAAAAAA

/*****************************************************************************
* The starupt code must be linked at the start of ROM, which is NOT
* necessarily address zero.
*/
    .text
    .code 32

    .global _start
    .func   _start

_start:

    /* Vector table
    * NOTE: used only very briefly until RAM is remapped to address zero
    */
    LDR     pc, ResetAddr    /* Reset                 */
    LDR     pc, UndefAddr    /* Undefined instruction */
    LDR     pc, SWIAddr      /* Software interrupt    */
    LDR     pc, PAbortAddr   /* Prefetch abort        */
    LDR     pc, DAbortAddr   /* Data abort            */
    LDR     pc, ReservedAddr /* Reserved              */
    LDR     pc, IRQAddr      /* IRQ interrupt         */
    LDR     pc, FIQAddr      /* FIQ interrupt         */
    
ResetAddr:     .word _reset
UndefAddr:     .word UndefHandler
SWIAddr:       .word SWIHandler
PAbortAddr:    .word PAbortHandler
DAbortAddr:    .word DAbortHandler
ReservedAddr:  .word 0
IRQAddr:       .word IRQHandler
FIQAddr:       .word FIQHandler

    .align 4             /* Align to the word boundary */


/*****************************************************************************
* _reset
*/
_reset:

    /* Call the platform-specific low-level initialization routine
    *
    * NOTE: The ROM is typically NOT at its linked address before the remap,
    * so the branch to low_level_init() must be relative (position
    * independent code). The low_level_init() function must continue to
    * execute in ARM state. Also, the function low_level_init() cannot rely
    * on uninitialized data being cleared and cannot use any initialized
    * data, because the .bss and .data sections have not been initialized yet.
    */
    LDR     r0,=_reset           /* pass the reset address as the 1st argument */
    LDR     r1,=_cstartup        /* pass the return address as the 2nd argument */
    MOV     lr,r1                /* set the return address after the remap */
    LDR     sp,=__stack_end__    /* set the temporary stack pointer */
    B       init_hardware       /* relative branch enables remap */


    /* NOTE: after the return from low_level_init() the ROM is remapped
    * to its linked address so the rest of the code executes at its linked
    * address.
    */

_cstartup:
    /* Relocate .fastcode section (copy from ROM to RAM) */
    LDR     r0,=__fastcode_load
    LDR     r1,=__fastcode_start
    LDR     r2,=__fastcode_end
1:
    CMP     r1,r2
    LDMLTIA r0!,{r3}
    STMLTIA r1!,{r3}
    BLT     1b


    /* Relocate the .data section (copy from ROM to RAM) */
    LDR     r0,=__data_load
    LDR     r1,=__data_start
    LDR     r2,=_edata
1:
    CMP     r1,r2
    LDMLTIA r0!,{r3}
    STMLTIA r1!,{r3}
    BLT     1b


    /* Clear the .bss section (zero init) */
    LDR     r1,=__bss_start__
    LDR     r2,=__bss_end__
    MOV     r3,#0
1:
    CMP     r1,r2
    STMLTIA r1!,{r3}
    BLT     1b


    /* Fill the .stack section */
    LDR     r1,=__stack_start__
    LDR     r2,=__stack_end__
    LDR     r3,=STACK_FILL
1:
    CMP     r1,r2
    STMLTIA r1!,{r3}
    BLT     1b

    /* Initialize stack pointers for all ARM modes */
    MSR     CPSR_c,#(IRQ_MODE | I_BIT | F_BIT)
    LDR     sp,=__irq_stack_top__                /* set the IRQ stack pointer */

    MSR     CPSR_c,#(FIQ_MODE | I_BIT | F_BIT)
    LDR     sp,=__fiq_stack_top__                /* set the FIQ stack pointer */

    MSR     CPSR_c,#(SVC_MODE | I_BIT | F_BIT)
    LDR     sp,=__svc_stack_top__                /* set the SVC stack pointer */

    MSR     CPSR_c,#(ABT_MODE | I_BIT | F_BIT)
    LDR     sp,=__abt_stack_top__                /* set the ABT stack pointer */

    MSR     CPSR_c,#(UND_MODE | I_BIT | F_BIT)
    LDR     sp,=__und_stack_top__                /* set the UND stack pointer */

    MSR     CPSR_c,#(SYS_MODE | I_BIT | F_BIT)
    LDR     sp,=__c_stack_top__                  /* set the C stack pointer */


#if 0
    /* Invoke the static constructors */
    LDR     r12,=__libc_init_array
    MOV     lr,pc           /* set the return address */
    BX      r12             /* the target code can be ARM or THUMB */
#endif    


    /* Enter the C/C++ code */
    LDR     r12,=main
    MOV     lr,pc           /* set the return address */
    BX      r12             /* the target code can be ARM or THUMB */
    
ExitFunction:
    NOP
    NOP
    NOP
    b       ExitFunction   
    
    .size   _start, . - _start
    .endfunc
    
/****************************************************************************/
/*                         Default interrupt handler                        */
/****************************************************************************/

UndefHandler:
   b UndefHandler
   
SWIHandler:
   b SWIHandler

PAbortHandler:
   b PAbortHandler

DAbortHandler:
   b DAbortHandler
   
IRQHandler:
   b IRQHandler
   
FIQHandler:
   b FIQHandler
   
   .weak ExitFunction
   .weak UndefHandler, SWIHandler, PAbortHandler, DAbortHandler
   .weak IRQHandler, FIQHandler
    
   .end

/*** EOF ***/
