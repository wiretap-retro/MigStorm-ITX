/*
Copyright 2005, 2006, 2007 Dennis van Weeren
Copyright 2008, 2009 Jakub Bednarski

This file is part of Minimig

Minimig is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Minimig is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

// 2009-10-10   - any length (any multiple of 8 bytes) fpga core file support
// 2009-12-10   - changed command header id
// 2010-04-14   - changed command header id

#include "AT91SAM7S256.h"
//#include "stdio.h"
#include "printf.h"
#include "errors.h"
#include "hardware.h"
#include "FAT.h"
#include "FDD.h"

#define CMD_HDRID 0xAA69

extern fileTYPE file;

// single byte serialization of FPGA configuration datastream
void ShiftFpga(unsigned char data)
{
    AT91_REG *ppioa_codr = AT91C_PIOA_CODR;
    AT91_REG *ppioa_sodr = AT91C_PIOA_SODR;

    // bit 0
    *ppioa_codr = DIN | CCLK;
    if (data & 0x80)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 1
    *ppioa_codr = DIN | CCLK;
    if (data & 0x40)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 2
    *ppioa_codr = DIN | CCLK;
    if (data & 0x20)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 3
    *ppioa_codr = DIN | CCLK;
    if (data & 0x10)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 4
    *ppioa_codr = DIN | CCLK;
    if (data & 0x08)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 5
    *ppioa_codr = DIN | CCLK;
    if (data & 0x04)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 6
    *ppioa_codr = DIN | CCLK;
    if (data & 0x02)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

    // bit 7
    *ppioa_codr = DIN | CCLK;
    if (data & 0x01)
        *ppioa_sodr = DIN;
    *ppioa_sodr = CCLK;

}

// FPGA configuration
unsigned char ConfigureFpga(char *CoreName)
{
    unsigned long  t;
    unsigned long  n;
    unsigned char *ptr;
    printf("Filename: %s\n",CoreName);
    // set outputs
    *AT91C_PIOA_SODR = CCLK | DIN | PROG_B;
    // enable outputs
    *AT91C_PIOA_OER = CCLK | DIN | PROG_B;

    // reset FGPA configuration sequence
    // specs: PROG_B pulse min 0.3 us
    t = 15;
    while (--t)
        *AT91C_PIOA_CODR = PROG_B;

    *AT91C_PIOA_SODR = PROG_B;

    // now wait for INIT to go high
    // specs: max 2ms
    t = 100000;
    while (!(*AT91C_PIOA_PDSR & INIT_B))
    {
        if (--t == 0)
        {
            printf("FPGA init is NOT high!\r");
            FatalError(3);
        }
    }

    printf("FPGA init is high\r");

    if (*AT91C_PIOA_PDSR & DONE)
    {
        printf("FPGA done is high before configuration!\r");
        FatalError(3);
    }

    // open bitstream file
    if (FileOpen(&file, CoreName) == 0)
    {
        printf("No FPGA configuration file found!\r");
        FatalError(4);
    }

    printf("FPGA bitstream file opened\r");
    printf("[");

    // send all bytes to FPGA in loop
    t = 0;
    n = file.size >> 3;
    ptr = sector_buffer;
    do
    {
        // read sector if 512 (64*8) bytes done
        if ((t & 0x3F) == 0)
        {
            if (t & (1<<10))
                *AT91C_PIOA_CODR = DISKLED;
            else
                *AT91C_PIOA_SODR = DISKLED;

            if ((t & 0x1FF) == 0)
                printf("*");

            if (!FileRead(&file, sector_buffer))
                return(0);

            ptr = sector_buffer;
        }

        // send data in packets of 8 bytes
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);
        ShiftFpga(*ptr++);

        t++;

        // read next sector if 512 (64*8) bytes done
        if ((t & 0x3F) == 0)
            FileNextSector(&file);

    }
    while (t < n);

    // disable outputs
    *AT91C_PIOA_ODR = CCLK | DIN | PROG_B;

    printf("]\r");
    printf("FPGA bitstream loaded\r");
    *AT91C_PIOA_CODR = DISKLED;

    // check if DONE is high
    if (*AT91C_PIOA_PDSR & DONE)
        return(1);

    printf("FPGA done is NOT high!\r");
    FatalError(5);
    return 0;
}

void SendFile(fileTYPE *file)
{
    unsigned char  c1, c2;
    unsigned long  j;
    unsigned long  n;
    unsigned char *p;

    printf("[");
    n = (file->size + 511) >> 9; // sector count (rounded up)
    while (n--)
    {
        // read data sector from memory card
        FileRead(file, sector_buffer);

        do
        {
            // read FPGA status
            EnableFpga();
            c1 = SPI(0);
            c2 = SPI(0);
            SPI(0);
            SPI(0);
            SPI(0);
            SPI(0);
            DisableFpga();
        }
        while (!(c1 & CMD_RDTRK));

        if ((n & 15) == 0)
            printf("*");

        // send data sector to FPGA
        EnableFpga();
        c1 = SPI(0);
        c2 = SPI(0);
        SPI(0);
        SPI(0);
        SPI(0);
        SPI(0);
        p = sector_buffer;

        for (j = 0; j < 512; j++)
            SPI(*p++);

        DisableFpga();

        FileNextSector(file);
    }
    printf("]\r");
}

// print message on the boot screen
char BootPrint(const char *text)
{
    unsigned char c1, c2, c3, c4;
    unsigned char cmd;
    const char *p;
    unsigned char n;

    p = text;
    n = 0;
    while (*p++ != 0)
        n++; // calculating string length

    cmd = 1;
    while (1)
    {
        EnableFpga();
        c1 = SPI(0x10); // track read command
        c2 = SPI(0x01); // disk present
        SPI(0);
        SPI(0);
        c3 = SPI(0);
        c4 = SPI(0);

        if (c1 & CMD_RDTRK)
        {
            if (cmd)
            { // command phase
                if (c3 == 0x80 && c4 == 0x06) // command packet size must be 12 bytes
                {
                    cmd = 0;
                    SPI(CMD_HDRID >> 8); // command header
                    SPI(CMD_HDRID & 0xFF);
                    SPI(0x00); // cmd: 0x0001 = print text
                    SPI(0x01);
                    // data packet size in bytes
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                    SPI(n+2); // +2 because only even byte count is possible to send and we have to send termination zero byte
                    // don't care
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                    SPI(0x00);
                }
                else
                    break;
            }
            else
            { // data phase
                if (c3 == 0x80 && c4 == ((n + 2) >> 1))
                {
                    p = text;
                    n = c4 << 1;
                    while (n--)
                    {
                        c4 = *p;
                        SPI(c4);
                        if (c4) // if current character is not zero go to next one
                            p++;
                    }
                    DisableFpga();
                    return 1;
                }
                else
                    break;
            }
        }
        DisableFpga();
    }
    DisableFpga();
    return 0;
}

char BootUpload(fileTYPE *file, unsigned char base, unsigned char size)
// this function sends given file to Minimig's memory
// base - memory base address (bits 23..16)
// size - memory size (bits 23..16)
{
    unsigned char c1, c2, c3, c4;
    unsigned char cmd = 1;

    while (1)
    {
        EnableFpga();
        c1 = SPI(0x10); // track read command
        c2 = SPI(0x01); // disk present
        SPI(0);
        SPI(0);
        c3 = SPI(0);
        c4 = SPI(0);

        if (c1 & CMD_RDTRK)
        {
            if (cmd)
            { // command phase
                if (c3 == 0x80 && c4 == 0x06) // command packet size 12 bytes
                {
                    cmd = 0;
                    SPI(CMD_HDRID >> 8); // command header
                    SPI(CMD_HDRID & 0xFF);
                    SPI(0x00);
                    SPI(0x02); // cmd: 0x0002 = upload memory
                    // memory base address
                    SPI(0x00);
                    SPI(base);
                    SPI(0x00);
                    SPI(0x00);
                    // memory size
                    SPI(0x00);
                    SPI(size);
                    SPI(0x00);
                    SPI(0x00);
                }
                else
                    break;
            }
            else
            { // data phase
                DisableFpga();
                printf("uploading ROM file...\r");
                // send rom image to FPGA
                SendFile(file);
                printf("ROM file uploaded.\r");
                return 0;
            }
        }
        DisableFpga();
    }
    DisableFpga();
    return -1;
}

void BootExit(void)
{
    unsigned char c1, c2, c3, c4;

    while (1)
    {
        EnableFpga();
        c1 = SPI(0x10); // track read command
        c2 = SPI(0x01); // disk present
        SPI(0);
        SPI(0);
        c3 = SPI(0);
        c4 = SPI(0);
        if (c1 & CMD_RDTRK)
        {
            if (c3 == 0x80 && c4 == 0x06) // command packet size 12 bytes
            {
                SPI(CMD_HDRID >> 8); // command header
                SPI(CMD_HDRID & 0xFF);
                SPI(0x00); // cmd: 0x0003 = restart
                SPI(0x03);
                // don't care
                SPI(0x00);
                SPI(0x00);
                SPI(0x00);
                SPI(0x00);
                // don't care
                SPI(0x00);
                SPI(0x00);
                SPI(0x00);
                SPI(0x00);
            }
            DisableFpga();
            return;
        }
        DisableFpga();
    }
}

void ClearMemory(unsigned long base, unsigned long size)
{
    unsigned char c1, c2, c3, c4;

    while (1)
    {
        EnableFpga();
        c1 = SPI(0x10); // track read command
        c2 = SPI(0x01); // disk present
        SPI(0);
        SPI(0);
        c3 = SPI(0);
        c4 = SPI(0);
        if (c1 & CMD_RDTRK)
        {
            if (c3 == 0x80 && c4 == 0x06)// command packet size 12 bytes
            {
                SPI(CMD_HDRID >> 8); // command header
                SPI(CMD_HDRID & 0xFF);
                SPI(0x00); // cmd: 0x0004 = clear memory
                SPI(0x04);
                // memory base
                SPI((unsigned char)(base >> 24));
                SPI((unsigned char)(base >> 16));
                SPI((unsigned char)(base >> 8));
                SPI((unsigned char)base);
                // memory size
                SPI((unsigned char)(size >> 24));
                SPI((unsigned char)(size >> 16));
                SPI((unsigned char)(size >> 8));
                SPI((unsigned char)size);
            }
            DisableFpga();
            return;
        }
        DisableFpga();
    }
}

unsigned char GetFPGAStatus(void)
{
    unsigned char status;

    EnableFpga();
    status = SPI(0);
    SPI(0);
    SPI(0);
    SPI(0);
    SPI(0);
    SPI(0);
    DisableFpga();

    return status;
}
