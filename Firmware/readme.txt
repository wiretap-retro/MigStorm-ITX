
Minimig firmware release 2008-08-04 by Jakub Bednarski.

    FPGA core version      : FYQ080729 
    68K bootloader version : BYQ080717
    PIC firmware version   : PYQ080725

Minimig copyright 2006-2008 by Dennis van Weeren.


How to install:

  - Remove any jumpers from SPARE I/O header.
  - Put "minimig1.bin" on your SD/MMC card.
  - Using Tiny Bootloader application program PIC's flash memory with "firmware.hex" file.
    If you are experiencing problems:
    1. Make sure you have bootloader programmed into your PIC.
    2. Take care about pressing the PGM/RESET button in appropriate moment.


Features:


    Scan doubler:

    - added vertical and horizontal interpolation (selectable independently for hires and lores)
    - semi-transparent osd window with active line highlight


    OSD menu:

    - added alternative control by joystick (up and down signals activated simultaneously invoke menu) 
    - configuration of: (configuration is stored in non-volatile memory inside the PIC)
      * memory options (512KB chip, 1MB chip, 512KB chip/512KB slow, 1MB chip/512KB slow)
      * video interpolation filters (vertical and horizontal interpolation for hires and lowres)
      * kickstart
        - both 256 and 512 KB non-encrypted kickstart files are supported (256KB kickstart takes 512KB of RAM)
        - stored filename is limited to 8 characters of letters A-Z and numbers 0-9
        - if stored kickstat file is missing default "kick.rom" file is loaded
        - kickstart file can be uploaded at run time without its name beeing stored in non-volatile memory (test purposes)
    - system reset from the OSD menu (no need for keyboard)


    New 68K bootloader (with video text mode).

    - displays information about firmware version and chipset configuration
    - allows to monitor the booting process 
    

    Chipset changes:

    - ECS blitter (Agnus is identified as ECS)
    - PAL/NTSC selection support (different FPGA core for initial settings)
    - modified blanking timing (better compatibility)
    - modified display dma engine (better compatibility)
    - modified sprite dma engine (better compatibility)
    - modified copper timing (better compatibility) 
    - modified floppy interface (better read and write support)
    - modified keyboard and mouse interface (better compatibility)
    

    Write support to ADF images:

      Since standard ADF images don't contain the MFM track data only write of sectors which conform to standard sector
    format is supported. It means that any attempt of non-standard sector write (i.e. long tracks) will be rejected
    and appropriate error message will be reported.
      Write protection status is read from the Read-Only file attribute. There is no option to change it on the Minimig.
    

    Action Replay III module:

      It was mandatory developing tool for finding bugs in current and future firmware implementations.
    Maybe someone will find it useful for other applications.
    It requires 256KB "AR3.ROM" file to be present on the SD/MMC card. The latest 3.17 rom version is only compatible
    with kickcstart 1.3 (34.5) and 2.04 (37.175). If the ROM file is missing the module is disabled.
    It can be disabled even though the ROM file is present on the flash card. To do so you need to press and hold 
    the "MENU" button on the Minimig while loading kickstart. It can only be done during initial booting after power-up.
    When enabled it takes one 512KB RAM bank so max. 1MB is available for chip and slow RAM.
    The "FREEZE" button is Ctrl+Break.


Thanks to:
 
     Dennis for his great Minimig
     Loriano for impressive enclosure 
     Darrin and Oscar for their involvement, ideas, support and help
     Toni for his indispensable help and logic analyzer (and WinUAE :-)

