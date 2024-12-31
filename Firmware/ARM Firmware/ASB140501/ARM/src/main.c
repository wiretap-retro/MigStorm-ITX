/****************************************************************************
*  Copyright (c) 2006 by Michael Fischer. All rights reserved.
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
*  History:
*
*  30.03.06  mifi   First Version for Insight tutorial
*  26.01.08  mifi   Added variable "d" to test const variable.
*  13.02.10  mifi   Added floating point too.
****************************************************************************/
#define __MAIN_C__
// 2008-10-04   - porting to ARM
// 2008-10-06   - support for 4 floppy drives
// 2008-10-30   - hdd write support
// 2009-05-01   - subdirectory support
// 2009-06-26   - SDHC and FAT32 support
// 2009-08-10   - hardfile selection
// 2009-09-11   - minor changes to hardware initialization routine
// 2009-10-10   - any length fpga core file support
// 2009-11-14   - adapted floppy gap size
//              - changes to OSD labels
// 2009-12-24   - updated version number
// 2010-01-09   - changes to floppy handling
// 2010-07-28   - improved menu button handling
//              - improved FPGA configuration routines
//              - added support for OSD vsync
// 2010-08-15   - support for joystick emulation
// 2010-08-18   - clean-up
// 2012-02-11	- ported to GNU Toolchain
// 2014-04-24   - added page wide file list scroll at joystick left/right
//              - removed OSD fdd error message (for WOMM87/AW72)
//              - added FPGA core file selection (core upload working yet)
#include "AT91SAM7S256.h"
//#include "stdio.h"
//#include "string.h"
#include "printf.h"
#include "stringlight.h"
#include "errors.h"
#include "hardware.h"
#include "MMC.h"
#include "FAT.h"
#include "OSD.h"
#include "FPGA.h"
#include "FDD.h"
#include "HDD.h"
#include "firmware.h"
#include "menu.h"
#include "config.h"

const char version[] = {"$VER:ASB140501"};

extern char *config_filter_msg[];
extern char *config_memory_chip_msg[];
extern char *config_memory_slow_msg[];
extern char *config_scanline_msg[];

configTYPE config;
fileTYPE file;

extern hdfTYPE hdf[2];

unsigned char Error;
char s[40];

void FatalError(unsigned long error)
{
    unsigned long i;

    printf("Fatal error: %lu\r", error);

    while (1)
    {
        for (i = 0; i < error; i++)
        {
            DISKLED_ON;
            WaitTimer(250);
            DISKLED_OFF;
            WaitTimer(250);
        }
        WaitTimer(1000);
    }
}

char UploadKickstart(char *name)
{
    char filename[12];
    strncpy(filename, name, 8); // copy base name
    strcpy(&filename[8], "ROM"); // add extension

    if (FileOpen(&file, filename))
    {
        if (file.size == 0x80000)
        { // 512KB Kickstart ROM
            BootPrint("Uploading 512 KB Kickstart...");
            BootUpload(&file, 0xF8, 0x08);
            return(1);
        }
        else if (file.size == 0x40000)
        { // 256KB Kickstart ROM
            BootPrint("Uploading 256 KB Kickstart...");
            BootUpload(&file, 0xF8, 0x04);
            return(1);
        }
        else
        {
            BootPrint("Unsupported ROM file size!");
        }
    }
    else
    {
        sprintf(s, "No \"%s\" file!", filename);
        BootPrint(s);
    }
    return(0);
}

unsigned char LoadConfiguration(char *filename)
{
    static const char config_id[] = "MNMGCFG0";

    // load configurastion data
    if (FileOpen(&file, filename))
    {
        printf("Configuration file size: %lu\r", file.size);
        if (file.size == sizeof(config))
        {
            FileRead(&file, sector_buffer);

            // check file id and version
            if (strncmp((char*)sector_buffer, config_id, sizeof(config.id)) == 0)
            {
                memcpy((void*)&config, (void*)sector_buffer, sizeof(config));
                return(1);
            }
            else
                printf("Wrong configuration file format!\r");
        }
        else
            printf("Wrong configuration file size: %lu (expected: %u)\r", file.size, sizeof(config));
    }
    else
        printf("Can not open configuration file!\r");

    // set default configuration
    memset((void*)&config, sizeof(config), 0);
    strncpy(config.id, config_id, sizeof(config.id));
    strncpy(config.kickstart.name, "KICK    ", sizeof(config.kickstart.name));
    config.kickstart.long_name[0] = 0;
    config.corefile.long_name[0] = 0;
    config.memory = 0x05;
    config.hardfile[0].enabled = 1;
    strncpy(config.hardfile[0].name, "HARDFILE", sizeof(config.hardfile[0].name));
    return(0);
}

unsigned char SaveConfiguration(char *filename)
{
    // save configuration data
    if (FileOpen(&file, filename))
    {
        printf("Configuration file size: %lu\r", file.size);
        if (file.size != sizeof(config))
        {
            file.size = sizeof(config);
            if (!UpdateEntry(&file))
                return(0);
        }

        memset((void*)&sector_buffer, 0, sizeof(sector_buffer));
        memcpy((void*)&sector_buffer, (void*)&config, sizeof(config));
        FileWrite(&file, sector_buffer);
        return(1);
    }
    else
    {
        printf("Configuration file not found!\r");
        printf("Trying to create a new one...\r");
        strncpy(file.name, filename, 11);
        file.attributes = 0;
        file.size = sizeof(config);
        if (FileCreate(0, &file))
        {
            printf("File created.\r");
            printf("Trying to write new data...\r");
            memset((void*)sector_buffer, 0, sizeof(sector_buffer));
            memcpy((void*)sector_buffer, (void*)&config, sizeof(config));

            if (FileWrite(&file, sector_buffer))
            {
                printf("File written successfully.\r");
                return(1);
            }
            else
                printf("File write failed!\r");
        }
        else
            printf("File creation failed!\r");
    }
    return(0);
}

void HandleFpga(void)
{
    unsigned char  c1, c2;

    EnableFpga();
    c1 = SPI(0); // cmd request and drive number
    c2 = SPI(0); // track number
    SPI(0);
    SPI(0);
    SPI(0);
    SPI(0);
    DisableFpga();

    HandleFDD(c1, c2);
    HandleHDD(c1, c2);

    UpdateDriveStatus();
}


int main(void)
{
    unsigned char rc;
    unsigned char key;
    unsigned long time;
    unsigned short spiclk;
    //unsigned char CSD[16];
    // init_hardware();

    DISKLED_ON;

    Timer_Init();
    init_printf(NULL, USART_Putc); // Initialise printf
    USART_Init(115200);

    printf("\rMinimig by Dennis van Weeren");
    printf("\rARM Controller by Jakub Bednarski\r\r");
    printf("Version %s\r\r", version+5);
    printf("\rGCC Port\r\r");
    SPI_Init();

    if (CheckButton()) // if menu button pressed fall back to slow SPI mode
       SetSPIMode(SPIMODE_NORMAL);

    if (!MMC_Init())
        FatalError(1);

    spiclk = MCLK / ((AT91C_SPI_CSR[0] & AT91C_SPI_SCBR) >> 8) / 1000000;
    printf("spiclk: %u MHz\r", spiclk);

    if (!FindDrive())
        FatalError(2);

    ChangeDirectory(DIRECTORY_ROOT);

    time = GetTimer(0);
    if ((*AT91C_PIOA_PDSR & 1))
    {
    if (ConfigureFpga("MINIMIG1BIN"))
    {
        time = GetTimer(0) - time;
        printf("FPGA configured in %lu ms\r", time >> 20);
    }
    else
    {
        printf("FPGA configuration failed\r");
        FatalError(3);
    }
    }
    WaitTimer(100); // let's wait some time till reset is inactive so we can get a valid keycode

    key = OsdGetCtrl();
    rc = LoadConfiguration("MINIMIG CFG");

    if (key == KEY_F1)
       config.chipset |= CONFIG_NTSC; // force NTSC mode if F1 pressed

    if (key == KEY_F2)
       config.chipset &= ~CONFIG_NTSC; // force PAL mode if F2 pressed

    ConfigChipset(config.chipset | CONFIG_TURBO); // set CPU in turbo mode

    OsdReset(RESET_BOOTLOADER);

    ConfigFloppy(1, CONFIG_FLOPPY2X); // set floppy speed

    sprintf(s, "** ARM firmware %s **\n", version + 5);
    BootPrint(s);

    sprintf(s, "SPI clock: %u MHz\n", spiclk);
    BootPrint(s);

    if (!rc)
        BootPrint("Configuration file not found...\n");

    sprintf(s, "CPU clock     : %s", config.chipset & 0x01 ? "turbo" : "normal");
    BootPrint(s);
    sprintf(s, "Chip RAM size : %s", config_memory_chip_msg[config.memory & 0x03]);
    BootPrint(s);
    sprintf(s, "Slow RAM size : %s", config_memory_slow_msg[config.memory >> 2 & 0x03]);
    BootPrint(s);

    sprintf(s, "Floppy drives : %u", config.floppy.drives + 1);
    BootPrint(s);
    sprintf(s, "Floppy speed  : %s", config.floppy.speed ? "fast": "normal");
    BootPrint(s);

    BootPrint("");

    if (!UploadKickstart(config.kickstart.name))
    {
        strcpy(config.kickstart.name, "KICK    ");
        if (!UploadKickstart(config.kickstart.name))
            FatalError(6);
    }

    if (!CheckButton() && !config.disable_ar3) // if menu button pressed don't load Action Replay
    {
        if (FileOpen(&file, "AR3     ROM"))
        {
            if (file.size == 0x40000)
            { // 256 KB Action Replay 3 ROM
                BootPrint("\nUploading Action Replay ROM...");
                BootUpload(&file, 0x40, 0x04);
                ClearMemory(0x440000, 0x40000);
            }
            else
            {
                BootPrint("\nUnsupported AR3.ROM file size!!!");
                FatalError(6);
            }
        }
    }

    if (OpenHardfile(0))
    {

        sprintf(s, "\nHardfile 0: %.8s.%.3s", hdf[0].file.name, &hdf[0].file.name[8]);
        BootPrint(s);
        sprintf(s, "CHS: %u.%u.%u", hdf[0].cylinders, hdf[0].heads, hdf[0].sectors);
        BootPrint(s);
        sprintf(s, "Size: %lu MB", ((((unsigned long) hdf[0].cylinders) * hdf[0].heads * hdf[0].sectors) >> 11));
        BootPrint(s);
    }

    if (OpenHardfile(1))
    {

        sprintf(s, "\nHardfile 1: %.8s.%.3s", hdf[1].file.name, &hdf[1].file.name[8]);
        BootPrint(s);
        sprintf(s, "CHS: %u.%u.%u", hdf[1].cylinders, hdf[1].heads, hdf[1].sectors);
        BootPrint(s);
        sprintf(s, "Size: %lu MB", ((((unsigned long) hdf[1].cylinders) * hdf[1].heads * hdf[1].sectors) >> 11));
        BootPrint(s);
    }

    sprintf(s, "\nA600 IDE HDC is %s.", config.enable_ide ? "enabled" : "disabled");
    BootPrint(s);
    sprintf(s, "Master HDD is %s.", config.hardfile[0].present ? config.hardfile[0].enabled ? "enabled" : "disabled" : "not present");
    BootPrint(s);
    sprintf(s, "Slave HDD is %s.", config.hardfile[1].present ? config.hardfile[1].enabled ? "enabled" : "disabled" : "not present");
    BootPrint(s);

    if (cluster_size < 64)
    {
        BootPrint("\n***************************************************");
        BootPrint(  "*  It's recommended to reformat your memory card  *");
        BootPrint(  "*   using 32 KB clusters to improve performance   *");
        BootPrint(  "***************************************************");
    }

    ConfigIDE(config.enable_ide, config.hardfile[0].present && config.hardfile[0].enabled, config.hardfile[1].present && config.hardfile[1].enabled);
    WaitTimer(1000);

    printf("Bootloading is complete.\r");

    BootPrint("\nExiting bootloader...");
    WaitTimer(500);

    ConfigMemory(config.memory);
    ConfigFloppy(config.floppy.drives, config.floppy.speed);

    BootExit();

    ConfigChipset(config.chipset);
    ConfigFilter(config.filter.lores, config.filter.hires);
    ConfigScanlines(config.scanlines);

    while (1)
    {
        HandleFpga();
        HandleUI();
    }


  /*
   * This return here make no sense.
   * But to prevent the compiler warning:
   * "return type of 'main' is not 'int'
   * we use an int as return :-)
   */ 
  return(0);
}

/*** EOF ***/
