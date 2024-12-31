/*****************************************************************************
* Product: BLINKY example application
* Date of the Last Update:  Jun 29, 2007
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

OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY {                                       /* memory map of AT91SAM7S256 */
    ROM (rx)  : ORIGIN = 0x00100000, LENGTH = 256k
    RAM (rwx) : ORIGIN = 0x00200000, LENGTH = 64k
    STACK (rw) : ORIGIN = 0x00210000, LENGTH = 0x00000000
}

/* The sizes of the stacks used by the application. NOTE: you need to adjust */
C_STACK_SIZE   = 4096;
IRQ_STACK_SIZE = 0;
FIQ_STACK_SIZE = 0;
SVC_STACK_SIZE = 0;
ABT_STACK_SIZE = 0;
UND_STACK_SIZE = 0;


SECTIONS {

    .reset : {
        *startup.o (.text)  /* startup code (ARM vectors and reset handler) */
        . = ALIGN(0x4);
     } >ROM

    .ramvect : {                        /* used for vectors remapped to RAM */
        __ram_start = .;
        . = 0x40;
    } >RAM

    .fastcode : {
        __fastcode_load = LOADADDR (.fastcode);
        __fastcode_start = .;

        *(.glue_7t) *(.glue_7)
        *isr.o (.text.*)
        *(.text.fastcode)
        *(.text.Blinky_dispatch)
        /* add other modules here ... */

        . = ALIGN (4);
        __fastcode_end = .;
    } >RAM AT>ROM

    .text : {
        CREATE_OBJECT_SYMBOLS
        *(.text .text.* .gnu.linkonce.t.*)
        *(.plt)
        *(.gnu.warning)
        *(.glue_7t) *(.glue_7)         /* NOTE: placed already in .fastcode */

        . = ALIGN (4);
        /* These are for static constructors and destructors under ELF */
        KEEP (*crtbegin.o(.ctors))
        KEEP (*(EXCLUDE_FILE (*crtend.o) .ctors))
        KEEP (*(SORT(.ctors.*)))
        KEEP (*crtend.o(.ctors))
        KEEP (*crtbegin.o(.dtors))
        KEEP (*(EXCLUDE_FILE (*crtend.o) .dtors))
        KEEP (*(SORT(.dtors.*)))
        KEEP (*crtend.o(.dtors))

        *(.rodata .rodata.* .gnu.linkonce.r.*)

        *(.ARM.extab* .gnu.linkonce.armextab.*)
        *(.gcc_except_table)
        *(.eh_frame_hdr)
        *(.eh_frame)

        *(.init)
        *(.fini)

        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP (*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);
        PROVIDE_HIDDEN (__init_array_start = .);
        KEEP (*(SORT(.init_array.*)))
        KEEP (*(.init_array))
        PROVIDE_HIDDEN (__init_array_end = .);
        PROVIDE_HIDDEN (__fini_array_start = .);
        KEEP (*(.fini_array))
        KEEP (*(SORT(.fini_array.*)))
        PROVIDE_HIDDEN (__fini_array_end = .);
    } >ROM

    /* .ARM.exidx is sorted, so has to go in its own output section.  */
    .ARM.exidx : {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } >ROM
    _etext = .;

    .data : {
        __data_load = LOADADDR (.data);
        __data_start = .;
        KEEP(*(.jcr))
        *(.got.plt) *(.got)
        *(.shdata)
        *(.data .data.* .gnu.linkonce.d.*)
        . = ALIGN (4);
        _edata = .;
    } >RAM AT>ROM

    .bss : {
        __bss_start__ = . ;
        *(.shbss)
        *(.bss .bss.* .gnu.linkonce.b.*)
        *(COMMON)
        . = ALIGN (8);
        __bss_end__ = .;
    } >RAM

    .stack : {
        __stack_start__ = . ;

        . += IRQ_STACK_SIZE;
        . = ALIGN (4);
        __irq_stack_top__ = . ;

        . += FIQ_STACK_SIZE;
        . = ALIGN (4);
        __fiq_stack_top__ = . ;

        . += SVC_STACK_SIZE;
        . = ALIGN (4);
        __svc_stack_top__ = . ;

        . += ABT_STACK_SIZE;
        . = ALIGN (4);
        __abt_stack_top__ = . ;

        . += UND_STACK_SIZE;
        . = ALIGN (4);
        __und_stack_top__ = . ;

        . += C_STACK_SIZE;
        . = ALIGN (4);
        __c_stack_top__ = . ;

        __stack_end__ = .;
    } >RAM

    _end = . ;
    __end = . ;
    PROVIDE(end = .);

    .stab 0 (NOLOAD) : {
        *(.stab)
    }

    .stabstr 0 (NOLOAD) : {
        *(.stabstr)
    }

    /* DWARF debug sections.
    * Symbols in the DWARF debugging sections are relative to the beginning
    * of the section so we begin them at 0.
    */
    /* DWARF 1 */
    .debug          0 : { *(.debug) }
    .line           0 : { *(.line) }
    /* GNU DWARF 1 extensions */
    .debug_srcinfo  0 : { *(.debug_srcinfo) }
    .debug_sfnames  0 : { *(.debug_sfnames) }
    /* DWARF 1.1 and DWARF 2 */
    .debug_aranges  0 : { *(.debug_aranges) }
    .debug_pubnames 0 : { *(.debug_pubnames) }
    /* DWARF 2 */
    .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
    .debug_abbrev   0 : { *(.debug_abbrev) }
    .debug_line     0 : { *(.debug_line) }
    .debug_frame    0 : { *(.debug_frame) }
    .debug_str      0 : { *(.debug_str) }
    .debug_loc      0 : { *(.debug_loc) }
    .debug_macinfo  0 : { *(.debug_macinfo) }
    /* SGI/MIPS DWARF 2 extensions */
    .debug_weaknames 0 : { *(.debug_weaknames) }
    .debug_funcnames 0 : { *(.debug_funcnames) }
    .debug_typenames 0 : { *(.debug_typenames) }
    .debug_varnames  0 : { *(.debug_varnames) }
    .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
    .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
    /DISCARD/ : { *(.note.GNU-stack)  }
}
