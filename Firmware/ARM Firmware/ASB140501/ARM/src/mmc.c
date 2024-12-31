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

// --== based on the work by Dennis van Weeren and Jan Derogee ==--
// 2008-10-03 - adaptation for ARM controller
// 2009-07-23 - clean-up and some optimizations
// 2009-11-22 - multiple sector read implemented


#include "AT91SAM7S256.h"
#include "printf.h"
#include "stringlight.h"
#include "hardware.h"
#include "MMC.h"
#include "FAT.h"
#include "firmware.h"

// variables
unsigned char crc;
unsigned long timeout;
unsigned char response;
unsigned char CardType;

// internal functions
void MMC_CRC(unsigned char c);
unsigned char MMC_Command(unsigned char cmd, unsigned long arg);
unsigned char MMC_CMD12(void);

// init memory card
unsigned char MMC_Init(void)
{
    unsigned char n;
    unsigned char ocr[4];

    AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (120 << 8) | (2 << 24); // init clock 100-400 kHz
    *AT91C_PIOA_SODR = MMC_SEL;  // set output (MMC chip select disabled)

    for (n = 10; n > 0; n--)
        SPI(0xFF); // 80 dummy clocks

    WaitTimer(20); // 20ms delay

    *AT91C_PIOA_CODR = MMC_SEL; // clear output (MMC chip select enabled)

    CardType = CARDTYPE_NONE;

    if (MMC_Command(CMD0, 0) == 0x01)
    { // idle state
        timeout = GetTimer(1000); // initialization timeout 1000 ms
        if (MMC_Command(CMD8, 0x1AA) == 0x01) // check if the card can operate with 2.7-3.6V power
        {   // SDHC card
            for (n = 0; n < 4; n++)
                ocr[n] = SPI(0xFF); // get the rest of R7 response
            if (ocr[2] == 0x01 && ocr[3] == 0xAA)
            { // the card can work at 2.7-3.6V
                printf("SDHC card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 1 << 30) == 0x00) // ACMD41 with HCS bit
                        { // initialization completed
                            if (MMC_Command(CMD58, 0) == 0x00)
                            { // check CCS (Card Capacity Status) bit in the OCR
                                for (n = 0; n < 4; n++)
                                    ocr[n] = SPI(0xFF);

                                CardType = (ocr[0] & 0x40) ? CARDTYPE_SDHC : CARDTYPE_SD; // if CCS set then the card is SDHC compatible
                            }
                            else
                                printf("CMD58 (READ_OCR) failed!\r");

                            DisableCard();

                            // set appropriate SPI speed
                            if (GetSPIMode() == SPIMODE_FAST)
                                AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (2 << 8); // 24 MHz SPI clock (max 25 MHz for SDHC card)
                            else
                                AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (6 << 8); // 8 MHz SPI clock (no SPI mod)

                            return(CardType);
                        }
                    }
                    else
                    {
                        printf("CMD55 (APP_CMD) failed!\r");
                        DisableCard();
                        return(CARDTYPE_NONE);
                    }
                }
                printf("SDHC card initialization timed out!\r");
                DisableCard();
                return(CARDTYPE_NONE);
            }
        }

        // it's not an SDHC card
        if (MMC_Command(CMD55, 0) == 0x01)
        { // CMD55 accepted so it's an SD card (or Kingston 128 MB MMC)
            if (MMC_Command(CMD41, 0) <= 0x01)
            { // SD card detected - wait for the end of initialization
                printf("SD card detected\r");
                while (!CheckTimer(timeout))
                { // now we must wait until CMD41 returns 0 (or timeout elapses)
                    if (MMC_Command(CMD55, 0) == 0x01)
                    { // CMD55 must precede any ACMD command
                        if (MMC_Command(CMD41, 0) == 0x00)
                        { // initialization completed

                            if (MMC_Command(CMD16, 512) != 0x00) //set block length
                                printf("CMD16 (SET_BLOCKLEN) failed!\r");

                            DisableCard();

                            // set appropriate SPI speed
                            if (GetSPIMode() == SPIMODE_FAST)
                                AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (2 << 8); // 24 MHz SPI clock (max 25 MHz for SD card)
                            else
                                AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (6 << 8); // 8 MHz SPI clock (no SPI mod)

                            CardType = CARDTYPE_SD;

                            return(CardType);
                        }
                    }
                    else
                    {
                        printf("CMD55 (APP_CMD) failed!\r");
                        DisableCard();
                        return(CARDTYPE_NONE);
                    }
                }
                printf("SD card initialization timed out!\r");
                DisableCard();
                return(CARDTYPE_NONE);
            }
        }

        // it's not an SD card
        printf("MMC card detected\r");
        while (!CheckTimer(timeout))
        { // now we must wait until CMD1 returns 0 (or timeout elapses)
            if (MMC_Command(CMD1, 0) == 0x00)
            { // initialization completed

                if (MMC_Command(CMD16, 512) != 0x00) // set block length
                    printf("CMD16 (SET_BLOCKLEN) failed!\r");

                DisableCard();

                // set appropriate SPI speed
                if (GetSPIMode() == SPIMODE_FAST)
                    AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (3 << 8); // 16 MHz SPI clock (max 20 MHz for MMC card)
                else
                    AT91C_SPI_CSR[0] = AT91C_SPI_CPOL | (6 << 8); // 8 MHz SPI clock (no SPI mod)

                CardType = CARDTYPE_MMC;

                return(CardType);
            }
        }

        printf("MMC card initialization timed out!\r");
        DisableCard();
        return(CARDTYPE_NONE);
    }

    DisableCard();
    printf("No memory card detected!\r");
    return(CARDTYPE_NONE); 
}

// Read single 512-byte block
// #pragma section_code_init
// #define RAMFUNC   __attribute__ ((section(".ramsection")))
RAMFUNC unsigned char MMC_Read(unsigned long lba, unsigned char *pReadBuffer)
{
// if pReadBuffer is NULL then use direct to the FPGA transfer mode (FPGA2 asserted)

    unsigned long i;
    unsigned long t;

    if (CardType != CARDTYPE_SDHC) // SDHC cards are addressed in sectors not bytes
        lba = lba << 9; // otherwise convert sector adddress to byte address

    EnableCard();

    if (MMC_Command(CMD17, lba))
    {
        printf("CMD17 (READ_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
        DisableCard();
        return(0);
    }

    // now we are waiting for data token, it takes around 300us
    timeout = 0;
    while (SPI(0xFF) != 0xFE)
    {
        if (timeout++ >= 1000000) // we can't wait forever
        {
            printf("CMD17 (READ_BLOCK): no data token! (lba=%lu)\r", lba);
            DisableCard();
            return(0);
        }
    }

    if (pReadBuffer == NULL)
    {   // in this mode we do not receive data, instead the FPGA captures directly the data stream transmitted by the SD/MMC card
        *AT91C_PIOA_CODR = FPGA2; // enable FPGA2 output
        for (i = 0; i < 512; i++)
        {
            while (!(*AT91C_SPI_SR & AT91C_SPI_TDRE)); // wait until transmiter buffer is empty
            *AT91C_SPI_TDR = 0xFF; // write dummy spi data
        }
        while (!(*AT91C_SPI_SR & AT91C_SPI_TXEMPTY)); // wait for transfer end
        t = *AT91C_SPI_RDR; // dummy read to empty receiver buffer for new data
        *AT91C_PIOA_SODR = FPGA2; // disable FPGA2 output
    }
    else
    {
        *AT91C_PIOA_SODR = AT91C_PA13_MOSI; // set GPIO output register
        *AT91C_PIOA_OER = AT91C_PA13_MOSI;  // GPIO pin as output
        *AT91C_PIOA_PER = AT91C_PA13_MOSI;  // enable GPIO function
        // use SPI PDC (DMA transfer)
        *AT91C_SPI_TPR = (unsigned long) pReadBuffer;
        *AT91C_SPI_TCR = 512;
        *AT91C_SPI_TNCR = 0;
        *AT91C_SPI_RPR = (unsigned long) pReadBuffer;
        *AT91C_SPI_RCR = 512;
        *AT91C_SPI_RNCR = 0;
        *AT91C_SPI_PTCR = AT91C_PDC_RXTEN | AT91C_PDC_TXTEN; // start DMA transfer
        // wait for tranfer end
        while ((*AT91C_SPI_SR & (AT91C_SPI_ENDTX | AT91C_SPI_ENDRX)) != (AT91C_SPI_ENDTX | AT91C_SPI_ENDRX));
        *AT91C_SPI_PTCR = AT91C_PDC_RXTDIS | AT91C_PDC_TXTDIS; // disable transmitter and receiver
        *AT91C_PIOA_PDR = AT91C_PA13_MOSI; // disable GPIO function
    }

    SPI(0xFF); // read CRC lo byte
    SPI(0xFF); // read CRC hi byte

    DisableCard();
    return(1);
}
//#pragma section_no_code_init
// #define RAMFUNC   __attribute__ ((section(".ramsection")))
// read multiple 512-byte blocks
unsigned char MMC_ReadMultiple(unsigned long lba, unsigned char *pReadBuffer, unsigned long nBlockCount)
{
// if pReadBuffer is NULL then use direct to the FPGA transfer mode (FPGA2 asserted)

    unsigned long i;
    unsigned long t;

    if (CardType != CARDTYPE_SDHC) // SDHC cards are addressed in sectors not bytes
        lba = lba << 9; // otherwise convert sector adddress to byte address

    EnableCard();

    if (MMC_Command(CMD18, lba))
    {
        printf("CMD18 (READ_MULTIPLE_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
        DisableCard();
        return(0);
    }

    while (nBlockCount--)
    {
        // now we are waiting for data token, it takes around 300us
        timeout = 0;
        while (SPI(0xFF) != 0xFE)
        {
            if (timeout++ >= 1000000) // we can't wait forever
            {
                printf("CMD18 (READ_MULTIPLE_BLOCK): no data token! (lba=%lu)\r", lba);
                DisableCard();
                return(0);
            }
        }

        if (pReadBuffer == NULL)
        {   // in this mode we do not receive data, instead the FPGA captures directly the data stream transmitted by the SD/MMC card
            *AT91C_PIOA_CODR = FPGA2; // enable FPGA2 output
            for (i = 0; i < 512; i++)
            {
                while (!(*AT91C_SPI_SR & AT91C_SPI_TDRE)); // wait until transmiter buffer is empty
                *AT91C_SPI_TDR = 0xFF; // write dummy spi data
            }
            while (!(*AT91C_SPI_SR & AT91C_SPI_TXEMPTY)); // wait for transfer end
            t = *AT91C_SPI_RDR; // dummy read to empty receiver buffer for new data
            *AT91C_PIOA_SODR = FPGA2; // disable FPGA2 output
        }
        else
        {
            *AT91C_PIOA_SODR = AT91C_PA13_MOSI; // set GPIO output register
            *AT91C_PIOA_OER = AT91C_PA13_MOSI;  // GPIO pin as output
            *AT91C_PIOA_PER = AT91C_PA13_MOSI;  // enable GPIO function
            // use SPI PDC (DMA transfer)
            *AT91C_SPI_TPR = (unsigned long) pReadBuffer;
            *AT91C_SPI_TCR = 512;
            *AT91C_SPI_TNCR = 0;
            *AT91C_SPI_RPR = (unsigned long) pReadBuffer;
            *AT91C_SPI_RCR = 512;
            *AT91C_SPI_RNCR = 0;
            *AT91C_SPI_PTCR = AT91C_PDC_RXTEN | AT91C_PDC_TXTEN; // start DMA transfer
            // wait for tranfer end
            while ((*AT91C_SPI_SR & (AT91C_SPI_ENDTX | AT91C_SPI_ENDRX)) != (AT91C_SPI_ENDTX | AT91C_SPI_ENDRX));
            *AT91C_SPI_PTCR = AT91C_PDC_RXTDIS | AT91C_PDC_TXTDIS; // disable transmitter and receiver
            *AT91C_PIOA_PDR = AT91C_PA13_MOSI; // disable GPIO function

            pReadBuffer += 512; // point to next sector
        }

        SPI(0xFF); // read CRC lo byte
        SPI(0xFF); // read CRC hi byte
    }

    MMC_CMD12(); // stop multi block transmission

    DisableCard();
    return(1);
}

// write 512-byte block
unsigned char MMC_Write(unsigned long lba, unsigned char *pWriteBuffer)
{
    unsigned long i;

   if (CardType != CARDTYPE_SDHC) // SDHC cards are addressed in sectors not bytes
        lba = lba << 9; // otherwise convert sector adddress to byte address

    EnableCard();

    if (MMC_Command(CMD24, lba))
    {
        printf("CMD24 (WRITE_BLOCK): invalid response 0x%02X (lba=%lu)\r", response, lba);
        DisableCard();
        return(0);
    }

    SPI(0xFF); // one byte gap
    SPI(0xFE); // send Data Token

    // send sector bytes
    for (i = 0; i < 512; i++)
         SPI(*(pWriteBuffer++));

    SPI(0xFF); // send CRC lo byte
    SPI(0xFF); // send CRC hi byte

    response = SPI(0xFF); // read packet response
    // Status codes
    // 010 = Data accepted
    // 101 = Data rejected due to CRC error
    // 110 = Data rejected due to write error
    response &= 0x1F;
    if (response != 0x05)
    {
        printf("CMD24 (WRITE_BLOCK): invalid status 0x%02X (lba=%lu)\r", response, lba);
        DisableCard();
        return(0);
    }

    timeout = 0;
    while (SPI(0xFF) == 0x00) // wait until the card is not busy
    {
        if (timeout++ >= 1000000)
        {
            printf("CMD24 (WRITE_BLOCK): busy wait timeout! (lba=%lu)\r", lba);
            DisableCard();
            return(0);
        }
    }

    DisableCard();
    return(1);
}

// #pragma section_code_init
// #define RAMFUNC   __attribute__ ((section(".ramsection")))
RAMFUNC unsigned char MMC_Command(unsigned char cmd, unsigned long arg)
{
    unsigned char c;

    crc = 0;
    SPI(0xFF); // flush SPI-bus

    SPI(cmd);
    MMC_CRC(cmd);

    c = (unsigned char)(arg >> 24);
    SPI(c);
    MMC_CRC(c);

    c = (unsigned char)(arg >> 16);
    SPI(c);
    MMC_CRC(c);

    c = (unsigned char)(arg >> 8);
    SPI(c);
    MMC_CRC(c);

    c = (unsigned char)(arg);
    SPI(c);
    MMC_CRC(c);

    crc <<= 1;
    crc++;
    SPI(crc);

    unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
    do
        response = SPI(0xFF); // get response
    while (response == 0xFF && Ncr--);

    return response;
}
// #pragma section_no_code_init

// stop multi block data transmission
unsigned char MMC_CMD12(void)
{
    SPI(CMD12); // command
    SPI(0x00);
    SPI(0x00);
    SPI(0x00);
    SPI(0x00);
    SPI(0x00); // dummy CRC7
    SPI(0xFF); // skip stuff byte

    unsigned char Ncr = 100;  // Ncr = 0..8 (SD) / 1..8 (MMC)
    do
        response = SPI(0xFF); // get response
    while (response == 0xFF && Ncr--);

    timeout = 0;
    while (SPI(0xFF) == 0x00) // wait until the card is not busy
        if (timeout++ >= 1000000)
        {
            printf("CMD12 (STOP_TRANSMISSION): busy wait timeout!\r");
            DisableCard();
            return(0);
        }

    return response;
}
//#pragma section_code_init
// #define RAMFUNC   __attribute__ ((section(".ramsection")))
RAMFUNC void MMC_CRC(unsigned char c)
{
    unsigned char i;

    for (i = 0; i < 8; i++)
    {
        crc <<= 1;
        if (c & 0x80)
            crc ^= 0x09;
        if (crc & 0x80)
            crc ^= 0x09;
        c <<= 1;
    }
}
// #pragma section_no_code_init




















