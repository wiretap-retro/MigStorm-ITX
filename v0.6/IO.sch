EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 4 4
Title "MigStorm-ITX"
Date "2024-05-17"
Rev "0.6"
Comp "wiretap"
Comment1 "Based on the Minimig 1.1 by Dennis van Weeren"
Comment2 "Partial schematics used from \"Renee\" on EasyEDA"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SamacSys_Parts:PIC18F26K20-I_SP IC7
U 1 1 625313AB
P 2000 1550
F 0 "IC7" H 3600 1815 50  0000 C CNN
F 1 "PIC18F26K20-I_SP" H 3600 1724 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 5050 1650 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/PIC18F26K20-I_SP.pdf" H 5050 1550 50  0001 L CNN
F 4 "Microchip PIC18F26K20-I/SP, 8bit PIC Microcontroller, 64MHz, 64 kB, 1024 B Flash, 28-Pin SPDIP" H 5050 1450 50  0001 L CNN "Description"
F 5 "5.08" H 5050 1350 50  0001 L CNN "Height"
F 6 "579-PIC18F26K20-I/SP" H 5050 1250 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Microchip-Technology/PIC18F26K20-I-SP?qs=m0k4GMPB8clZ53RipODs%252Bw%3D%3D" H 5050 1150 50  0001 L CNN "Mouser Price/Stock"
F 8 "Microchip" H 5050 1050 50  0001 L CNN "Manufacturer_Name"
F 9 "PIC18F26K20-I/SP" H 5050 950 50  0001 L CNN "Manufacturer_Part_Number"
	1    2000 1550
	1    0    0    -1  
$EndComp
Text Notes 2900 1100 0    79   ~ 16
PIC/SuperPIC/ARM Socket
Text GLabel 1050 1550 0    50   Input ~ 0
MCLR
Text GLabel 1050 1650 0    50   Input ~ 0
MCC_CLKEN
Text GLabel 1050 1750 0    50   Input ~ 0
FPGA_SEL0
Text GLabel 1050 1850 0    50   Input ~ 0
PROG_B
Text GLabel 1050 1950 0    50   Input ~ 0
INIT_B
NoConn ~ 2000 2050
NoConn ~ 2000 2650
NoConn ~ 2000 2750
NoConn ~ 5200 2150
NoConn ~ 5200 2050
$Comp
L Device:R_Small R15
U 1 1 62534A89
P 1900 1250
F 0 "R15" H 1959 1296 50  0000 L CNN
F 1 "4.7k" H 1959 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 1250 50  0001 C CNN
F 3 "~" H 1900 1250 50  0001 C CNN
	1    1900 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 62535BD0
P 1650 1250
F 0 "R14" H 1709 1296 50  0000 L CNN
F 1 "4.7k" H 1709 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1650 1250 50  0001 C CNN
F 3 "~" H 1650 1250 50  0001 C CNN
	1    1650 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 62535DFA
P 1400 1250
F 0 "R10" H 1459 1296 50  0000 L CNN
F 1 "4.7k" H 1459 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 1250 50  0001 C CNN
F 3 "~" H 1400 1250 50  0001 C CNN
	1    1400 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0124
U 1 1 62537114
P 1650 1000
F 0 "#PWR0124" H 1650 850 50  0001 C CNN
F 1 "+3.3V" H 1665 1173 50  0000 C CNN
F 2 "" H 1650 1000 50  0001 C CNN
F 3 "" H 1650 1000 50  0001 C CNN
	1    1650 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1350 1900 1550
Connection ~ 1900 1550
Wire Wire Line
	1900 1550 2000 1550
Wire Wire Line
	1900 1150 1900 1050
Wire Wire Line
	1900 1050 1650 1050
Wire Wire Line
	1650 1050 1650 1000
Wire Wire Line
	1650 1150 1650 1050
Connection ~ 1650 1050
Wire Wire Line
	1400 1150 1400 1050
Wire Wire Line
	1400 1050 1650 1050
$Comp
L Device:R_Small R7
U 1 1 62537DBC
P 1200 1850
F 0 "R7" V 1150 1950 50  0000 C CNN
F 1 "270" V 1200 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 1850 50  0001 C CNN
F 3 "~" H 1200 1850 50  0001 C CNN
	1    1200 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 6253892E
P 1200 1950
F 0 "R8" V 1150 2050 50  0000 C CNN
F 1 "270" V 1200 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 1950 50  0001 C CNN
F 3 "~" H 1200 1950 50  0001 C CNN
	1    1200 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 62538AD8
P 1200 2150
F 0 "R9" V 1150 2250 50  0000 C CNN
F 1 "270" V 1200 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1200 2150 50  0001 C CNN
F 3 "~" H 1200 2150 50  0001 C CNN
	1    1200 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R25
U 1 1 62539234
P 5750 1550
F 0 "R25" V 5700 1650 50  0000 C CNN
F 1 "270" V 5750 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 1550 50  0001 C CNN
F 3 "~" H 5750 1550 50  0001 C CNN
	1    5750 1550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R26
U 1 1 62539645
P 5750 1950
F 0 "R26" V 5700 2050 50  0000 C CNN
F 1 "270" V 5750 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 1950 50  0001 C CNN
F 3 "~" H 5750 1950 50  0001 C CNN
	1    5750 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R27
U 1 1 62539A4F
P 5750 2050
F 0 "R27" V 5700 2150 50  0000 C CNN
F 1 "270" V 5750 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5750 2050 50  0001 C CNN
F 3 "~" H 5750 2050 50  0001 C CNN
	1    5750 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 1550 1900 1550
Wire Wire Line
	1050 1650 2000 1650
Wire Wire Line
	1050 1750 2000 1750
Wire Wire Line
	1300 1850 1400 1850
Wire Wire Line
	1300 1950 1650 1950
Wire Wire Line
	1050 1850 1100 1850
Wire Wire Line
	1050 1950 1100 1950
Wire Wire Line
	1400 1350 1400 1850
Connection ~ 1400 1850
Wire Wire Line
	1400 1850 2000 1850
Wire Wire Line
	1650 1350 1650 1950
Connection ~ 1650 1950
Wire Wire Line
	1650 1950 2000 1950
Text GLabel 1050 2150 0    50   Input ~ 0
CCLK
$Comp
L power:GND #PWR0126
U 1 1 6254072C
P 2000 2250
F 0 "#PWR0126" H 2000 2000 50  0001 C CNN
F 1 "GND" V 2005 2122 50  0000 R CNN
F 2 "" H 2000 2250 50  0001 C CNN
F 3 "" H 2000 2250 50  0001 C CNN
	1    2000 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 2150 2000 2150
Wire Wire Line
	1050 2150 1100 2150
Text GLabel 1050 2550 0    50   Input ~ 0
MCC_SEL
Text GLabel 1050 2850 0    50   Input ~ 0
SPI_CLK
Wire Wire Line
	1050 2550 2000 2550
Wire Wire Line
	1050 2850 2000 2850
$Comp
L SamacSys_Parts:LFXTAL035939Reel Y1
U 1 1 62542883
P 1650 3300
F 0 "Y1" V 1896 3428 50  0000 L CNN
F 1 "LFXTAL035939Reel" V 1987 3428 50  0000 L CNN
F 2 "LFXTAL020423CUTT" H 2300 3400 50  0001 L CNN
F 3 "https://www.mouser.mx/datasheet/2/741/LFXTAL035939Reel-998435.pdf" H 2300 3300 50  0001 L CNN
F 4 "Crystals 20MHz 22pF -20C 70C" H 2300 3200 50  0001 L CNN "Description"
F 5 "4.3" H 2300 3100 50  0001 L CNN "Height"
F 6 "449-LFXTAL035939REEL" H 2300 3000 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/IQD/LFXTAL035939Reel?qs=GJ%2F2ZGcr5uMy5rFA599rDA%3D%3D" H 2300 2900 50  0001 L CNN "Mouser Price/Stock"
F 8 "IQD" H 2300 2800 50  0001 L CNN "Manufacturer_Name"
F 9 "LFXTAL035939Reel" H 2300 2700 50  0001 L CNN "Manufacturer_Part_Number"
	1    1650 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C33
U 1 1 62545184
P 1300 3200
F 0 "C33" V 1071 3200 50  0000 C CNN
F 1 "47pf" V 1162 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 3200 50  0001 C CNN
F 3 "~" H 1300 3200 50  0001 C CNN
	1    1300 3200
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C34
U 1 1 62545E44
P 1900 3200
F 0 "C34" V 1671 3200 50  0000 C CNN
F 1 "47pf" V 1762 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 3200 50  0001 C CNN
F 3 "~" H 1900 3200 50  0001 C CNN
	1    1900 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 625484B2
P 2150 3250
F 0 "#PWR0127" H 2150 3000 50  0001 C CNN
F 1 "GND" H 2155 3077 50  0000 C CNN
F 2 "" H 2150 3250 50  0001 C CNN
F 3 "" H 2150 3250 50  0001 C CNN
	1    2150 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 62548B34
P 1050 3250
F 0 "#PWR0121" H 1050 3000 50  0001 C CNN
F 1 "GND" H 1055 3077 50  0000 C CNN
F 2 "" H 1050 3250 50  0001 C CNN
F 3 "" H 1050 3250 50  0001 C CNN
	1    1050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3250 2150 3200
Wire Wire Line
	2150 3200 2000 3200
Wire Wire Line
	1650 3300 1650 3200
Wire Wire Line
	1650 2450 2000 2450
Wire Wire Line
	1550 3300 1550 3200
Wire Wire Line
	1550 2350 2000 2350
Wire Wire Line
	1400 3200 1550 3200
Connection ~ 1550 3200
Wire Wire Line
	1550 3200 1550 2350
Wire Wire Line
	1650 3200 1800 3200
Connection ~ 1650 3200
Wire Wire Line
	1650 3200 1650 2450
Wire Wire Line
	1200 3200 1050 3200
Wire Wire Line
	1050 3200 1050 3250
Text GLabel 6100 1550 2    50   Input ~ 0
DIN
Text GLabel 6100 1650 2    50   Input ~ 0
FPGA_SEL2
Text GLabel 6100 1750 2    50   Input ~ 0
FPGA_SEL1
Text GLabel 6100 1850 2    50   Input ~ 0
DISKLED
Text GLabel 6100 1950 2    50   Input ~ 0
DONE
$Comp
L Device:R_Small R24
U 1 1 6254CD57
P 5400 1250
F 0 "R24" H 5459 1296 50  0000 L CNN
F 1 "4.7k" H 5459 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5400 1250 50  0001 C CNN
F 3 "~" H 5400 1250 50  0001 C CNN
	1    5400 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0139
U 1 1 6254D337
P 5400 1000
F 0 "#PWR0139" H 5400 850 50  0001 C CNN
F 1 "+3.3V" H 5415 1173 50  0000 C CNN
F 2 "" H 5400 1000 50  0001 C CNN
F 3 "" H 5400 1000 50  0001 C CNN
	1    5400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1000 5400 1150
Wire Wire Line
	5850 1550 6100 1550
Wire Wire Line
	5200 1550 5650 1550
Wire Wire Line
	5200 1650 6100 1650
Wire Wire Line
	5200 1750 6100 1750
Wire Wire Line
	5200 1850 6100 1850
Wire Wire Line
	5850 1950 6100 1950
Wire Wire Line
	5200 1950 5400 1950
Text GLabel 6100 2050 2    50   Input ~ 0
BUTTON
Wire Wire Line
	5200 2250 5300 2250
Wire Wire Line
	5300 2250 5300 2050
Wire Wire Line
	5300 2050 5650 2050
Wire Wire Line
	5850 2050 6100 2050
Text GLabel 6100 2850 2    50   Input ~ 0
SPI_DOUT
Text GLabel 6100 2750 2    50   Input ~ 0
SPI_DIN
$Comp
L Device:C_Small C41
U 1 1 6255929B
P 5600 2300
F 0 "C41" H 5692 2346 50  0000 L CNN
F 1 "100nF" H 5692 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5600 2300 50  0001 C CNN
F 3 "~" H 5600 2300 50  0001 C CNN
	1    5600 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2350 5400 2350
Wire Wire Line
	5400 2350 5400 2150
Wire Wire Line
	5400 2150 5600 2150
Wire Wire Line
	5200 2450 5600 2450
Wire Wire Line
	5600 2450 5600 2400
Wire Wire Line
	5600 2150 5600 2200
$Comp
L power:+3.3V #PWR0140
U 1 1 6255F57B
P 6100 2150
F 0 "#PWR0140" H 6100 2000 50  0001 C CNN
F 1 "+3.3V" V 6115 2278 50  0000 L CNN
F 2 "" H 6100 2150 50  0001 C CNN
F 3 "" H 6100 2150 50  0001 C CNN
	1    6100 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 6256041D
P 6100 2450
F 0 "#PWR0141" H 6100 2200 50  0001 C CNN
F 1 "GND" V 6105 2322 50  0000 R CNN
F 2 "" H 6100 2450 50  0001 C CNN
F 3 "" H 6100 2450 50  0001 C CNN
	1    6100 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5600 2450 6100 2450
Connection ~ 5600 2450
Wire Wire Line
	5600 2150 6100 2150
Connection ~ 5600 2150
Text GLabel 6100 2650 2    50   Input ~ 0
TXD_MCU
Text GLabel 6100 2550 2    50   Input ~ 0
RXD
Wire Wire Line
	5200 2550 6100 2550
Wire Wire Line
	5200 2650 6100 2650
Wire Wire Line
	5200 2750 6100 2750
Wire Wire Line
	5200 2850 6100 2850
Wire Wire Line
	5400 1350 5400 1950
Connection ~ 5400 1950
Wire Wire Line
	5400 1950 5650 1950
$Comp
L SamacSys_Parts:SN74HC4060NSR IC1
U 1 1 62567F35
P 1100 4700
F 0 "IC1" H 1650 4965 50  0000 C CNN
F 1 "SN74HC4060NSR" H 1650 4874 50  0000 C CNN
F 2 "SOIC127P780X200-16N" H 2050 4800 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/SN74HC4060" H 2050 4700 50  0001 L CNN
F 4 "14-Stage Asynchronous Binary Counters And Oscillators" H 2050 4600 50  0001 L CNN "Description"
F 5 "2" H 2050 4500 50  0001 L CNN "Height"
F 6 "595-SN74HC4060NSR" H 2050 4400 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/SN74HC4060NSR?qs=AgY10sKTvDKvS3GIt%252B6t8Q%3D%3D" H 2050 4300 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 2050 4200 50  0001 L CNN "Manufacturer_Name"
F 9 "SN74HC4060NSR" H 2050 4100 50  0001 L CNN "Manufacturer_Part_Number"
	1    1100 4700
	1    0    0    -1  
$EndComp
NoConn ~ 1100 4700
NoConn ~ 1100 4800
NoConn ~ 1100 4900
NoConn ~ 1100 5300
NoConn ~ 1100 5200
NoConn ~ 1100 5100
NoConn ~ 1100 5000
$Comp
L power:GND #PWR0122
U 1 1 62571C44
P 1100 5400
F 0 "#PWR0122" H 1100 5150 50  0001 C CNN
F 1 "GND" V 1105 5272 50  0000 R CNN
F 2 "" H 1100 5400 50  0001 C CNN
F 3 "" H 1100 5400 50  0001 C CNN
	1    1100 5400
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0130
U 1 1 62571D38
P 2600 4700
F 0 "#PWR0130" H 2600 4550 50  0001 C CNN
F 1 "+3.3V" H 2615 4873 50  0000 C CNN
F 2 "" H 2600 4700 50  0001 C CNN
F 3 "" H 2600 4700 50  0001 C CNN
	1    2600 4700
	1    0    0    -1  
$EndComp
NoConn ~ 2200 5000
NoConn ~ 2200 4900
NoConn ~ 2200 4800
$Comp
L power:GND #PWR0128
U 1 1 625755C4
P 2200 5100
F 0 "#PWR0128" H 2200 4850 50  0001 C CNN
F 1 "GND" V 2205 4972 50  0000 R CNN
F 2 "" H 2200 5100 50  0001 C CNN
F 3 "" H 2200 5100 50  0001 C CNN
	1    2200 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C36
U 1 1 625768A6
P 2400 4800
F 0 "C36" H 2500 4850 50  0000 L CNN
F 1 "100nF" H 2500 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 4800 50  0001 C CNN
F 3 "~" H 2400 4800 50  0001 C CNN
	1    2400 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 4700 2400 4700
Wire Wire Line
	2400 4700 2600 4700
Connection ~ 2400 4700
$Comp
L power:GND #PWR0129
U 1 1 6257FD56
P 2400 4900
F 0 "#PWR0129" H 2400 4650 50  0001 C CNN
F 1 "GND" H 2405 4727 50  0000 C CNN
F 2 "" H 2400 4900 50  0001 C CNN
F 3 "" H 2400 4900 50  0001 C CNN
	1    2400 4900
	1    0    0    -1  
$EndComp
Text GLabel 2300 5400 2    50   Input ~ 0
MCLK
Wire Wire Line
	2200 5400 2300 5400
$Comp
L Device:R_Small R17
U 1 1 62582925
P 3050 5300
F 0 "R17" V 3000 5400 50  0000 C CNN
F 1 "1M" V 3050 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3050 5300 50  0001 C CNN
F 3 "~" H 3050 5300 50  0001 C CNN
	1    3050 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 5300 2650 5300
$Comp
L Device:R_Small R16
U 1 1 62584A38
P 2650 5450
F 0 "R16" H 2709 5496 50  0000 L CNN
F 1 "2.2k" H 2709 5405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 5450 50  0001 C CNN
F 3 "~" H 2650 5450 50  0001 C CNN
	1    2650 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5300 2650 5350
$Comp
L Device:C_Small C37
U 1 1 62586B52
P 2650 5800
F 0 "C37" H 2742 5846 50  0000 L CNN
F 1 "100pF" H 2742 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2650 5800 50  0001 C CNN
F 3 "~" H 2650 5800 50  0001 C CNN
	1    2650 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C39
U 1 1 625870FC
P 3400 5800
F 0 "C39" H 3492 5846 50  0000 L CNN
F 1 "22pF" H 3492 5755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3400 5800 50  0001 C CNN
F 3 "~" H 3400 5800 50  0001 C CNN
	1    3400 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 62589215
P 2650 6050
F 0 "#PWR0131" H 2650 5800 50  0001 C CNN
F 1 "GND" H 2655 5877 50  0000 C CNN
F 2 "" H 2650 6050 50  0001 C CNN
F 3 "" H 2650 6050 50  0001 C CNN
	1    2650 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 62589AC1
P 3400 6050
F 0 "#PWR0132" H 3400 5800 50  0001 C CNN
F 1 "GND" H 3405 5877 50  0000 C CNN
F 2 "" H 3400 6050 50  0001 C CNN
F 3 "" H 3400 6050 50  0001 C CNN
	1    3400 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5900 3400 6050
Wire Wire Line
	2650 5900 2650 6050
Wire Wire Line
	2650 5700 2650 5650
Wire Wire Line
	3400 5300 3400 5650
$Comp
L Device:Crystal Y2
U 1 1 62590C52
P 3050 5650
F 0 "Y2" H 3200 5700 50  0000 C CNN
F 1 "4.433619" H 3100 5800 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 3050 5650 50  0001 C CNN
F 3 "~" H 3050 5650 50  0001 C CNN
F 4 "ABLS-4.433619MHZ-B4-T" H 3050 5650 50  0001 C CNN "Note"
	1    3050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5300 3400 5300
Wire Wire Line
	3200 5650 3400 5650
Connection ~ 3400 5650
Wire Wire Line
	3400 5650 3400 5700
Wire Wire Line
	2900 5650 2650 5650
Connection ~ 2650 5650
Wire Wire Line
	2650 5650 2650 5550
Connection ~ 2650 5300
Wire Wire Line
	2650 5300 2950 5300
Text Notes 2800 4250 2    79   ~ 16
Clock Generator
$Comp
L Connector_Generic:Conn_01x03 J5
U 1 1 625AC23F
P 4650 3950
F 0 "J5" H 4730 3992 50  0000 L CNN
F 1 "Video Mode" H 4730 3901 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4650 3950 50  0001 C CNN
F 3 "~" H 4650 3950 50  0001 C CNN
	1    4650 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 625AD248
P 4300 4200
F 0 "#PWR0133" H 4300 3950 50  0001 C CNN
F 1 "GND" H 4305 4027 50  0000 C CNN
F 2 "" H 4300 4200 50  0001 C CNN
F 3 "" H 4300 4200 50  0001 C CNN
	1    4300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3950 4300 3950
Wire Wire Line
	4300 3950 4300 4050
Wire Wire Line
	4450 4050 4300 4050
Connection ~ 4300 4050
Wire Wire Line
	4300 4050 4300 4200
Text GLabel 4300 3850 0    50   Input ~ 0
15KHZ
Wire Wire Line
	4450 3850 4300 3850
Text Notes 5200 3650 2    79   ~ 16
15KHz/31KHz Jumper
Wire Wire Line
	2200 5200 3400 5200
Wire Wire Line
	3400 5200 3400 5300
Connection ~ 3400 5300
$Comp
L Device:R_Small R19
U 1 1 62427A7F
P 4400 5350
F 0 "R19" H 4459 5396 50  0000 L CNN
F 1 "330" H 4459 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4400 5350 50  0001 C CNN
F 3 "~" H 4400 5350 50  0001 C CNN
	1    4400 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R20
U 1 1 624290FB
P 4950 5350
F 0 "R20" H 5009 5396 50  0000 L CNN
F 1 "330" H 5009 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4950 5350 50  0001 C CNN
F 3 "~" H 4950 5350 50  0001 C CNN
	1    4950 5350
	1    0    0    -1  
$EndComp
Text GLabel 4300 5050 0    50   Input ~ 0
PWRLED
Text GLabel 4850 5050 0    50   Input ~ 0
DISKLED
Wire Wire Line
	4850 5050 4950 5050
Wire Wire Line
	4950 5050 4950 5250
Wire Wire Line
	4300 5050 4400 5050
Wire Wire Line
	4400 5050 4400 5250
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 6242F689
P 4200 5800
F 0 "J4" H 4350 5750 50  0000 C CNN
F 1 "PWRLED" H 4200 5950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4200 5800 50  0001 C CNN
F 3 "~" H 4200 5800 50  0001 C CNN
	1    4200 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J6
U 1 1 62432433
P 4750 5800
F 0 "J6" H 4900 5750 50  0000 C CNN
F 1 "DISKLED" H 4750 5950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4750 5800 50  0001 C CNN
F 3 "~" H 4750 5800 50  0001 C CNN
	1    4750 5800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 624347BB
P 4400 6050
F 0 "#PWR0134" H 4400 5800 50  0001 C CNN
F 1 "GND" H 4405 5877 50  0000 C CNN
F 2 "" H 4400 6050 50  0001 C CNN
F 3 "" H 4400 6050 50  0001 C CNN
	1    4400 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 62434CE5
P 4950 6050
F 0 "#PWR0135" H 4950 5800 50  0001 C CNN
F 1 "GND" H 4955 5877 50  0000 C CNN
F 2 "" H 4950 6050 50  0001 C CNN
F 3 "" H 4950 6050 50  0001 C CNN
	1    4950 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5450 4400 5700
Wire Wire Line
	4400 5800 4400 6050
Wire Wire Line
	4950 5450 4950 5700
Wire Wire Line
	4950 5800 4950 6050
Text Notes 4150 4850 0    79   ~ 16
Case LEDs
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 62449413
P 6950 4200
F 0 "J8" H 7030 4192 50  0000 L CNN
F 1 "PROGRAM" H 7030 4101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6950 4200 50  0001 C CNN
F 3 "~" H 6950 4200 50  0001 C CNN
	1    6950 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 6244A964
P 6950 5600
F 0 "J9" H 7030 5592 50  0000 L CNN
F 1 "MENU" H 7030 5501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6950 5600 50  0001 C CNN
F 3 "~" H 6950 5600 50  0001 C CNN
	1    6950 5600
	1    0    0    -1  
$EndComp
Text GLabel 6300 3800 0    50   Input ~ 0
MCLR
Text GLabel 6300 5200 0    50   Input ~ 0
BUTTON
$Comp
L SamacSys_Parts:FSM4JH S1
U 1 1 6244D2D7
P 5750 4200
F 0 "S1" H 6150 4465 50  0000 C CNN
F 1 "FSM4JH" H 6150 4374 50  0000 C CNN
F 2 "FSM4JH" H 6400 4300 50  0001 L CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F1825910%7FC9%7Fpdf%7FEnglish%7FENG_CD_1825910_C9.pdf%7F1825910-6" H 6400 4200 50  0001 L CNN
F 4 "6x6mm tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 50 mA@ 24 V dc 1.4mm" H 6400 4100 50  0001 L CNN "Description"
F 5 "" H 6400 4000 50  0001 L CNN "Height"
F 6 "506-FSM4JH" H 6400 3900 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/TE-Connectivity-Alcoswitch/FSM4JH?qs=g%252BEszo6zu8OwVWrHD2r3Rw%3D%3D" H 6400 3800 50  0001 L CNN "Mouser Price/Stock"
F 8 "TE Connectivity" H 6400 3700 50  0001 L CNN "Manufacturer_Name"
F 9 "FSM4JH" H 6400 3600 50  0001 L CNN "Manufacturer_Part_Number"
	1    5750 4200
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:FSM4JH S2
U 1 1 6244EAF7
P 5750 5600
F 0 "S2" H 6150 5865 50  0000 C CNN
F 1 "FSM4JH" H 6150 5774 50  0000 C CNN
F 2 "FSM4JH" H 6400 5700 50  0001 L CNN
F 3 "http://www.te.com/commerce/DocumentDelivery/DDEController?Action=showdoc&DocId=Customer+Drawing%7F1825910%7FC9%7Fpdf%7FEnglish%7FENG_CD_1825910_C9.pdf%7F1825910-6" H 6400 5600 50  0001 L CNN
F 4 "6x6mm tactile switch,5mm H 1.6N Black Button Tactile Switch, SPST-NO 50 mA@ 24 V dc 1.4mm" H 6400 5500 50  0001 L CNN "Description"
F 5 "" H 6400 5400 50  0001 L CNN "Height"
F 6 "506-FSM4JH" H 6400 5300 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/TE-Connectivity-Alcoswitch/FSM4JH?qs=g%252BEszo6zu8OwVWrHD2r3Rw%3D%3D" H 6400 5200 50  0001 L CNN "Mouser Price/Stock"
F 8 "TE Connectivity" H 6400 5100 50  0001 L CNN "Manufacturer_Name"
F 9 "FSM4JH" H 6400 5000 50  0001 L CNN "Manufacturer_Part_Number"
	1    5750 5600
	1    0    0    -1  
$EndComp
NoConn ~ 5750 4200
NoConn ~ 5750 4300
NoConn ~ 5750 5600
NoConn ~ 5750 5700
Wire Wire Line
	6300 3800 6550 3800
Wire Wire Line
	6550 3800 6550 4200
Wire Wire Line
	6550 4200 6750 4200
Connection ~ 6550 4200
Wire Wire Line
	6300 5200 6550 5200
Wire Wire Line
	6550 5200 6550 5600
Wire Wire Line
	6550 5600 6750 5600
Connection ~ 6550 5600
$Comp
L power:GND #PWR0142
U 1 1 624715CB
P 6550 4450
F 0 "#PWR0142" H 6550 4200 50  0001 C CNN
F 1 "GND" H 6555 4277 50  0000 C CNN
F 2 "" H 6550 4450 50  0001 C CNN
F 3 "" H 6550 4450 50  0001 C CNN
	1    6550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0143
U 1 1 62471C39
P 6550 5850
F 0 "#PWR0143" H 6550 5600 50  0001 C CNN
F 1 "GND" H 6555 5677 50  0000 C CNN
F 2 "" H 6550 5850 50  0001 C CNN
F 3 "" H 6550 5850 50  0001 C CNN
	1    6550 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4300 6550 4450
Wire Wire Line
	6750 4300 6550 4300
Connection ~ 6550 4300
Wire Wire Line
	6750 5700 6550 5700
Wire Wire Line
	6550 5700 6550 5850
Connection ~ 6550 5700
Text Notes 6100 5000 0    79   ~ 16
Menu Button
Text Notes 6000 3600 0    79   ~ 16
Program Button
$Comp
L SamacSys_Parts:87427-2442 J2
U 1 1 624816B7
P 2450 7450
F 0 "J2" H 2900 7715 50  0000 C CNN
F 1 "87427-2442" H 2900 7624 50  0000 C CNN
F 2 "87427-2442" H 3200 7550 50  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/874270242_sd.pdf" H 3200 7450 50  0001 L CNN
F 4 "Mini-Fit Jr. Header, 4.20mm Pitch, Vertical, without Flange, 24 Circuits, Tin (Sn) over Nickel (Ni) Plating, Bulk Packaging" H 3200 7350 50  0001 L CNN "Description"
F 5 "12.8" H 3200 7250 50  0001 L CNN "Height"
F 6 "538-87427-2442" H 3200 7150 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Molex/87427-2442?qs=%2FB1RQGSXGA82sT1m8JTtlQ%3D%3D" H 3200 7050 50  0001 L CNN "Mouser Price/Stock"
F 8 "Molex" H 3200 6950 50  0001 L CNN "Manufacturer_Name"
F 9 "87427-2442" H 3200 6850 50  0001 L CNN "Manufacturer_Part_Number"
	1    2450 7450
	1    0    0    -1  
$EndComp
Text Notes 2400 7000 0    79   ~ 16
24-pin ATX Power
Text GLabel 2200 8550 0    50   Input ~ 0
3.3V
Text GLabel 2200 8450 0    50   Input ~ 0
3.3V
Text GLabel 2200 8350 0    50   Input ~ 0
GND
Text GLabel 2200 8250 0    50   Input ~ 0
5VDC
Text GLabel 2200 8150 0    50   Input ~ 0
GND
Text GLabel 2200 8050 0    50   Input ~ 0
5VDC
Text GLabel 2200 7950 0    50   Input ~ 0
GND
Text GLabel 2200 7850 0    50   Input ~ 0
PWROK
Text GLabel 2200 7750 0    50   Input ~ 0
5VSB
Text GLabel 2200 7650 0    50   Input ~ 0
12VDC
Text GLabel 2200 7550 0    50   Input ~ 0
12VDC
Text GLabel 2200 7450 0    50   Input ~ 0
3.3V
Text GLabel 3600 8550 2    50   Input ~ 0
3.3V
Text GLabel 3600 8450 2    50   Input ~ 0
-12V
Text GLabel 3600 8350 2    50   Input ~ 0
GND
Text GLabel 3600 8250 2    50   Input ~ 0
PS_ON
Text GLabel 3600 8150 2    50   Input ~ 0
GND
Text GLabel 3600 8050 2    50   Input ~ 0
GND
Text GLabel 3600 7950 2    50   Input ~ 0
GND
Text GLabel 3600 7850 2    50   Input ~ 0
-5V
Text GLabel 3600 7750 2    50   Input ~ 0
5VDC
Text GLabel 3600 7650 2    50   Input ~ 0
5VDC
Text GLabel 3600 7550 2    50   Input ~ 0
5VDC
Text GLabel 3600 7450 2    50   Input ~ 0
GND
Wire Wire Line
	2200 7450 2450 7450
Wire Wire Line
	2200 7550 2450 7550
Wire Wire Line
	2200 7650 2450 7650
Wire Wire Line
	2200 7750 2450 7750
Wire Wire Line
	2200 7850 2450 7850
Wire Wire Line
	2200 7950 2450 7950
Wire Wire Line
	2200 8050 2450 8050
Wire Wire Line
	2200 8150 2450 8150
Wire Wire Line
	2200 8250 2450 8250
Wire Wire Line
	2200 8350 2450 8350
Wire Wire Line
	2200 8450 2450 8450
Wire Wire Line
	2200 8550 2450 8550
Wire Wire Line
	3350 8550 3600 8550
Wire Wire Line
	3350 8450 3600 8450
Wire Wire Line
	3350 8350 3600 8350
Wire Wire Line
	3350 8250 3600 8250
Wire Wire Line
	3350 8150 3600 8150
Wire Wire Line
	3350 8050 3600 8050
Wire Wire Line
	3350 7950 3600 7950
Wire Wire Line
	3350 7850 3600 7850
Wire Wire Line
	3350 7750 3600 7750
Wire Wire Line
	3350 7650 3600 7650
Wire Wire Line
	3350 7550 3600 7550
Wire Wire Line
	3350 7450 3600 7450
$Comp
L power:+3.3V #PWR0119
U 1 1 624EAB15
P 950 7800
F 0 "#PWR0119" H 950 7650 50  0001 C CNN
F 1 "+3.3V" H 965 7973 50  0000 C CNN
F 2 "" H 950 7800 50  0001 C CNN
F 3 "" H 950 7800 50  0001 C CNN
	1    950  7800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0120
U 1 1 624EB846
P 950 8200
F 0 "#PWR0120" H 950 8050 50  0001 C CNN
F 1 "+5V" H 965 8373 50  0000 C CNN
F 2 "" H 950 8200 50  0001 C CNN
F 3 "" H 950 8200 50  0001 C CNN
	1    950  8200
	1    0    0    -1  
$EndComp
Text GLabel 1250 7900 2    50   Input ~ 0
3.3V
Text GLabel 1250 8300 2    50   Input ~ 0
5VDC
Wire Wire Line
	950  7800 950  7900
Wire Wire Line
	950  7900 1250 7900
Wire Wire Line
	950  8200 950  8300
Wire Wire Line
	950  8300 1250 8300
Text GLabel 3700 9650 2    50   Input ~ 0
PS_ON
Text Notes 3600 9050 2    79   ~ 16
Latching Power Switch
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 62561263
P 2000 9550
F 0 "J3" H 2080 9542 50  0000 L CNN
F 1 "PWRSWCH" H 2080 9451 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2000 9550 50  0001 C CNN
F 3 "~" H 2000 9550 50  0001 C CNN
	1    2000 9550
	-1   0    0    1   
$EndComp
$Comp
L SamacSys_Parts:KMDGX-6S_6S-S4N1 J7
U 1 1 6263FD0B
P 5600 7600
F 0 "J7" H 6100 7865 50  0000 C CNN
F 1 "KMDGX-6S_6S-S4N1" H 6100 7774 50  0000 C CNN
F 2 "KMDGX6S6SS4N1" H 6450 7700 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/KMDGX-6S_6S-S4N1.pdf" H 6450 7600 50  0001 L CNN
F 4 "Circular DIN Connectors MINI-DIN PANEL MNT 6P SNAP&LOCK 1270 W" H 6450 7500 50  0001 L CNN "Description"
F 5 "28.3" H 6450 7400 50  0001 L CNN "Height"
F 6 "806-KMDGX-6S/6S-S4N1" H 6450 7300 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=806-KMDGX-6S%2F6S-S4N1" H 6450 7200 50  0001 L CNN "Mouser Price/Stock"
F 8 "Kycon" H 6450 7100 50  0001 L CNN "Manufacturer_Name"
F 9 "KMDGX-6S/6S-S4N1" H 6450 7000 50  0001 L CNN "Manufacturer_Part_Number"
	1    5600 7600
	1    0    0    -1  
$EndComp
Text Notes 6650 7150 2    79   ~ 16
Keyboard / Mouse\nConnector    
$Comp
L Device:R_Small R21
U 1 1 62649873
P 5350 7700
F 0 "R21" V 5275 7700 50  0000 C CNN
F 1 "270" V 5350 7700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 7700 50  0001 C CNN
F 3 "~" H 5350 7700 50  0001 C CNN
	1    5350 7700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R22
U 1 1 6264A381
P 5350 8100
F 0 "R22" V 5275 8100 50  0000 C CNN
F 1 "270" V 5350 8100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 8100 50  0001 C CNN
F 3 "~" H 5350 8100 50  0001 C CNN
	1    5350 8100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R28
U 1 1 62652032
P 6850 7700
F 0 "R28" V 6925 7700 50  0000 C CNN
F 1 "270" V 6850 7700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 7700 50  0001 C CNN
F 3 "~" H 6850 7700 50  0001 C CNN
	1    6850 7700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R23
U 1 1 62659C98
P 5350 8200
F 0 "R23" V 5425 8200 50  0000 C CNN
F 1 "270" V 5350 8200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 8200 50  0001 C CNN
F 3 "~" H 5350 8200 50  0001 C CNN
	1    5350 8200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 626DA7FA
P 6700 8550
F 0 "#PWR0144" H 6700 8300 50  0001 C CNN
F 1 "GND" H 6705 8377 50  0000 C CNN
F 2 "" H 6700 8550 50  0001 C CNN
F 3 "" H 6700 8550 50  0001 C CNN
	1    6700 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7900 6700 7900
Wire Wire Line
	6700 7900 6700 8000
Wire Wire Line
	6600 8300 6700 8300
Connection ~ 6700 8300
Wire Wire Line
	6700 8300 6700 8550
Wire Wire Line
	6600 8200 6700 8200
Connection ~ 6700 8200
Wire Wire Line
	6700 8200 6700 8300
Wire Wire Line
	6600 8100 6700 8100
Connection ~ 6700 8100
Wire Wire Line
	6700 8100 6700 8200
Wire Wire Line
	6600 8000 6700 8000
Connection ~ 6700 8000
Wire Wire Line
	6700 8000 6700 8100
$Comp
L power:GND #PWR0138
U 1 1 6270B46A
P 5100 7800
F 0 "#PWR0138" H 5100 7550 50  0001 C CNN
F 1 "GND" V 5105 7672 50  0000 R CNN
F 2 "" H 5100 7800 50  0001 C CNN
F 3 "" H 5100 7800 50  0001 C CNN
	1    5100 7800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 6270C29C
P 5100 8400
F 0 "#PWR0145" H 5100 8150 50  0001 C CNN
F 1 "GND" V 5105 8272 50  0000 R CNN
F 2 "" H 5100 8400 50  0001 C CNN
F 3 "" H 5100 8400 50  0001 C CNN
	1    5100 8400
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 7800 5600 7800
Wire Wire Line
	5100 8400 5600 8400
Text GLabel 5050 7700 0    50   Input ~ 0
KBDDAT
Text GLabel 5050 8100 0    50   Input ~ 0
KBDCLK
Wire Wire Line
	5050 7700 5250 7700
Wire Wire Line
	5050 8200 5250 8200
Wire Wire Line
	5050 8100 5250 8100
Text GLabel 5050 8200 0    50   Input ~ 0
MSDAT
Text GLabel 7150 7700 2    50   Input ~ 0
MSCLK
Wire Wire Line
	6950 7700 7150 7700
$Comp
L power:+5V #PWR0136
U 1 1 62768EA3
P 5300 7900
F 0 "#PWR0136" H 5300 7750 50  0001 C CNN
F 1 "+5V" V 5300 8000 50  0000 L CNN
F 2 "" H 5300 7900 50  0001 C CNN
F 3 "" H 5300 7900 50  0001 C CNN
	1    5300 7900
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0137
U 1 1 6276A177
P 6850 7600
F 0 "#PWR0137" H 6850 7450 50  0001 C CNN
F 1 "+5V" V 6850 7700 50  0000 L CNN
F 2 "" H 6850 7600 50  0001 C CNN
F 3 "" H 6850 7600 50  0001 C CNN
	1    6850 7600
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 7900 5600 7900
Wire Wire Line
	6600 7600 6850 7600
$Comp
L Device:LED_Small D1
U 1 1 624B87A3
P 1050 8700
F 0 "D1" H 1050 8493 50  0000 C CNN
F 1 "BrdPwr" H 1050 8584 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" V 1050 8700 50  0001 C CNN
F 3 "~" V 1050 8700 50  0001 C CNN
	1    1050 8700
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 624BB2EB
P 1450 8700
F 0 "R11" V 1254 8700 50  0000 C CNN
F 1 "1k" V 1345 8700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1450 8700 50  0001 C CNN
F 3 "~" H 1450 8700 50  0001 C CNN
	1    1450 8700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 624C79E2
P 1700 8750
F 0 "#PWR0125" H 1700 8500 50  0001 C CNN
F 1 "GND" H 1705 8577 50  0000 C CNN
F 2 "" H 1700 8750 50  0001 C CNN
F 3 "" H 1700 8750 50  0001 C CNN
	1    1700 8750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0118
U 1 1 624C8454
P 800 8650
F 0 "#PWR0118" H 800 8500 50  0001 C CNN
F 1 "+5V" H 815 8823 50  0000 C CNN
F 2 "" H 800 8650 50  0001 C CNN
F 3 "" H 800 8650 50  0001 C CNN
	1    800  8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  8650 800  8700
Wire Wire Line
	800  8700 950  8700
Wire Wire Line
	1150 8700 1350 8700
Wire Wire Line
	1550 8700 1700 8700
Wire Wire Line
	1700 8700 1700 8750
$Comp
L SamacSys_Parts:SP3232EUCN U8
U 1 1 62514500
P 8750 1800
F 0 "U8" H 8750 2031 50  0000 C CNN
F 1 "SP3232EUCN" H 8750 1940 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 8750 2050 50  0001 C CNN
F 3 "" H 8750 2050 50  0001 C CNN
	1    8750 1800
	1    0    0    -1  
$EndComp
Text Notes 8400 1300 0    79   ~ 16
Serial Port
$Comp
L SamacSys_Parts:L77SDE09S1ACO4R J14
U 1 1 625229F8
P 10500 2700
F 0 "J14" V 11700 2700 50  0000 L CNN
F 1 "L77SDE09S1ACO4R" V 11600 2350 50  0000 L CNN
F 2 "L77SDE09S1ACO4R" H 11350 3000 50  0001 L CNN
F 3 "https://www.mouser.at/datasheet/2/18/Amphenol_11052018_LxxxSDxxxxxxCHxx-1501162.pdf" H 11350 2900 50  0001 L CNN
F 4 "D-Sub Standard Connectors Dsub, Stamped Signal 3A, Right Angle PCB Thru Hole, FP=10.40mm (.409in), Row Pitch 2.54mm, 09 Socket, Flash Gold, Bright Tin Shell, 4-40 Rear Insert, Ground Tab with Clear Hole Without Boardlock" H 11350 2800 50  0001 L CNN "Description"
F 5 "15.93" H 11350 2700 50  0001 L CNN "Height"
F 6 "523-L77SDE09S1ACO4R" H 11350 2600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Amphenol-Commercial-Products/L77SDE09S1ACO4R?qs=f9yNj16SXrIlAEvUcwItFg%3D%3D" H 11350 2500 50  0001 L CNN "Mouser Price/Stock"
F 8 "Amphenol" H 11350 2400 50  0001 L CNN "Manufacturer_Name"
F 9 "L77SDE09S1ACO4R" H 11350 2300 50  0001 L CNN "Manufacturer_Part_Number"
	1    10500 2700
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C45
U 1 1 6258C019
P 9100 1600
F 0 "C45" H 9192 1646 50  0000 L CNN
F 1 "100nF" H 9192 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9100 1600 50  0001 C CNN
F 3 "~" H 9100 1600 50  0001 C CNN
	1    9100 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C48
U 1 1 6258E7DA
P 9450 1600
F 0 "C48" H 9542 1646 50  0000 L CNN
F 1 "100nF" H 9542 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9450 1600 50  0001 C CNN
F 3 "~" H 9450 1600 50  0001 C CNN
	1    9450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1950 9250 1950
Wire Wire Line
	9250 1950 9250 1750
Wire Wire Line
	9250 1750 9100 1750
Wire Wire Line
	9100 1750 9100 1700
Wire Wire Line
	9200 2050 9450 2050
Wire Wire Line
	9450 2050 9450 1700
Wire Wire Line
	9100 1500 9100 1350
Wire Wire Line
	9100 1350 9300 1350
Wire Wire Line
	9450 1350 9450 1500
$Comp
L power:GND #PWR0155
U 1 1 625C5689
P 9400 1200
F 0 "#PWR0155" H 9400 950 50  0001 C CNN
F 1 "GND" V 9405 1072 50  0000 R CNN
F 2 "" H 9400 1200 50  0001 C CNN
F 3 "" H 9400 1200 50  0001 C CNN
	1    9400 1200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 1350 9300 1200
Wire Wire Line
	9300 1200 9400 1200
Connection ~ 9300 1350
Wire Wire Line
	9300 1350 9450 1350
$Comp
L power:GND #PWR0159
U 1 1 625D4666
P 10700 1700
F 0 "#PWR0159" H 10700 1450 50  0001 C CNN
F 1 "GND" V 10705 1572 50  0000 R CNN
F 2 "" H 10700 1700 50  0001 C CNN
F 3 "" H 10700 1700 50  0001 C CNN
	1    10700 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0160
U 1 1 625D535B
P 10700 2700
F 0 "#PWR0160" H 10700 2450 50  0001 C CNN
F 1 "GND" V 10705 2572 50  0000 R CNN
F 2 "" H 10700 2700 50  0001 C CNN
F 3 "" H 10700 2700 50  0001 C CNN
	1    10700 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10500 1700 10700 1700
Wire Wire Line
	10500 2700 10700 2700
$Comp
L power:GND #PWR0154
U 1 1 625F2E84
P 8750 2850
F 0 "#PWR0154" H 8750 2600 50  0001 C CNN
F 1 "GND" H 8755 2677 50  0000 C CNN
F 2 "" H 8750 2850 50  0001 C CNN
F 3 "" H 8750 2850 50  0001 C CNN
	1    8750 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C42
U 1 1 625F441A
P 8050 1950
F 0 "C42" V 7950 1850 50  0000 L CNN
F 1 "100nF" V 7950 2000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 1950 50  0001 C CNN
F 3 "~" H 8050 1950 50  0001 C CNN
	1    8050 1950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C43
U 1 1 62602E1A
P 8050 2150
F 0 "C43" V 7950 2050 50  0000 L CNN
F 1 "100nF" V 7950 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8050 2150 50  0001 C CNN
F 3 "~" H 8050 2150 50  0001 C CNN
	1    8050 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 1950 8150 1950
Wire Wire Line
	7950 1950 7800 1950
Wire Wire Line
	7800 1950 7800 2050
Wire Wire Line
	7800 2050 8300 2050
Wire Wire Line
	8300 2150 8150 2150
Wire Wire Line
	7950 2150 7800 2150
Wire Wire Line
	7800 2150 7800 2250
Wire Wire Line
	7800 2250 8300 2250
Text GLabel 8100 2450 0    50   Input ~ 0
RTS
Text GLabel 8100 2550 0    50   Input ~ 0
RXD
Text GLabel 8100 2650 0    50   Input ~ 0
CTS
Wire Wire Line
	8100 2450 8300 2450
Wire Wire Line
	8100 2550 8300 2550
Wire Wire Line
	8100 2650 8300 2650
Wire Wire Line
	8750 1750 8750 1450
Wire Wire Line
	8750 1450 8350 1450
$Comp
L Device:C_Small C44
U 1 1 626A1D36
P 8150 1450
F 0 "C44" V 8050 1500 50  0000 L CNN
F 1 "100nF" V 8050 1200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8150 1450 50  0001 C CNN
F 3 "~" H 8150 1450 50  0001 C CNN
	1    8150 1450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 626C2CA5
P 7950 1500
F 0 "#PWR0150" H 7950 1250 50  0001 C CNN
F 1 "GND" H 7955 1327 50  0000 C CNN
F 2 "" H 7950 1500 50  0001 C CNN
F 3 "" H 7950 1500 50  0001 C CNN
	1    7950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 1450 7950 1450
Wire Wire Line
	7950 1450 7950 1500
$Comp
L power:+3.3V #PWR0151
U 1 1 626DD2A3
P 8350 1150
F 0 "#PWR0151" H 8350 1000 50  0001 C CNN
F 1 "+3.3V" H 8365 1323 50  0000 C CNN
F 2 "" H 8350 1150 50  0001 C CNN
F 3 "" H 8350 1150 50  0001 C CNN
	1    8350 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1150 8350 1450
Connection ~ 8350 1450
Wire Wire Line
	8350 1450 8250 1450
$Comp
L Connector_Generic:Conn_01x03 J10
U 1 1 626EE797
P 7250 2350
F 0 "J10" H 7168 2025 50  0000 C CNN
F 1 "Serial" H 7168 2116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7250 2350 50  0001 C CNN
F 3 "~" H 7250 2350 50  0001 C CNN
	1    7250 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 2350 8300 2350
Text GLabel 7450 1900 0    50   Input ~ 0
TXD_MCU
Text GLabel 7450 2700 0    50   Input ~ 0
TXD
Wire Wire Line
	7450 1900 7600 1900
Wire Wire Line
	7600 1900 7600 2250
Wire Wire Line
	7600 2250 7450 2250
Wire Wire Line
	7450 2700 7600 2700
Wire Wire Line
	7600 2700 7600 2450
Wire Wire Line
	7600 2450 7450 2450
$Comp
L power:GND #PWR0156
U 1 1 6273AF84
P 10000 2000
F 0 "#PWR0156" H 10000 1750 50  0001 C CNN
F 1 "GND" V 10005 1872 50  0000 R CNN
F 2 "" H 10000 2000 50  0001 C CNN
F 3 "" H 10000 2000 50  0001 C CNN
	1    10000 2000
	0    1    1    0   
$EndComp
NoConn ~ 11000 2100
NoConn ~ 10000 2400
Text Notes 10300 2050 0    50   ~ 0
GND
Text Notes 10300 2450 0    50   ~ 0
CD
Text Notes 10300 2350 0    50   ~ 0
RXD
Text Notes 10300 2250 0    50   ~ 0
TXD
Text Notes 10300 2150 0    50   ~ 0
DTR
Text Notes 10600 2150 0    50   ~ 0
RI
Text Notes 10550 2250 0    50   ~ 0
CTS
Text Notes 10550 2350 0    50   ~ 0
RTS
Text Notes 10550 2450 0    50   ~ 0
DSR
Wire Wire Line
	10000 2100 9750 2100
Wire Wire Line
	9750 2100 9750 2800
Wire Wire Line
	9750 2800 11150 2800
Wire Wire Line
	11150 2800 11150 2400
Wire Wire Line
	11150 2400 11000 2400
Wire Wire Line
	9200 2250 9700 2250
Wire Wire Line
	9700 2250 9700 2850
Wire Wire Line
	9700 2850 11200 2850
Wire Wire Line
	11200 2850 11200 2300
Wire Wire Line
	11200 2300 11000 2300
Wire Wire Line
	9200 2450 9650 2450
Wire Wire Line
	9650 2450 9650 2900
Wire Wire Line
	9650 2900 11250 2900
Wire Wire Line
	11250 2900 11250 2200
Wire Wire Line
	11250 2200 11000 2200
Wire Wire Line
	9200 2350 9900 2350
Wire Wire Line
	9900 2350 9900 2300
Wire Wire Line
	9900 2300 10000 2300
Wire Wire Line
	9200 2150 9900 2150
Wire Wire Line
	9900 2150 9900 2200
Wire Wire Line
	9900 2200 10000 2200
$Comp
L SamacSys_Parts:178-009-613R571 J13
U 1 1 62556DC8
P 9000 4900
F 0 "J13" H 9000 5992 50  0000 C CNN
F 1 "178-009-613R571" H 9000 5901 50  0000 C CNN
F 2 "178-009-613R571" H 9000 4900 50  0001 L BNN
F 3 "" H 9000 4900 50  0001 L BNN
	1    9000 4900
	1    0    0    -1  
$EndComp
Text Notes 8350 3600 0    79   ~ 16
Joystick Ports (Stacked)
NoConn ~ 9300 5700
NoConn ~ 9300 4500
$Comp
L power:GND #PWR0152
U 1 1 6257D49B
P 8700 4300
F 0 "#PWR0152" H 8700 4050 50  0001 C CNN
F 1 "GND" V 8705 4172 50  0000 R CNN
F 2 "" H 8700 4300 50  0001 C CNN
F 3 "" H 8700 4300 50  0001 C CNN
	1    8700 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 6257D9D5
P 8700 5500
F 0 "#PWR0153" H 8700 5250 50  0001 C CNN
F 1 "GND" V 8705 5372 50  0000 R CNN
F 2 "" H 8700 5500 50  0001 C CNN
F 3 "" H 8700 5500 50  0001 C CNN
	1    8700 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R43
U 1 1 6257E31A
P 9550 4100
F 0 "R43" V 9500 4000 50  0000 C CNN
F 1 "270" V 9500 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4100 50  0001 C CNN
F 3 "~" H 9550 4100 50  0001 C CNN
	1    9550 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R44
U 1 1 62580809
P 9550 4200
F 0 "R44" V 9500 4100 50  0000 C CNN
F 1 "270" V 9500 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4200 50  0001 C CNN
F 3 "~" H 9550 4200 50  0001 C CNN
	1    9550 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R45
U 1 1 62591AAC
P 9550 4300
F 0 "R45" V 9500 4200 50  0000 C CNN
F 1 "270" V 9500 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4300 50  0001 C CNN
F 3 "~" H 9550 4300 50  0001 C CNN
	1    9550 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R46
U 1 1 625A2CE2
P 9550 4400
F 0 "R46" V 9500 4300 50  0000 C CNN
F 1 "270" V 9500 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 4400 50  0001 C CNN
F 3 "~" H 9550 4400 50  0001 C CNN
	1    9550 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R34
U 1 1 625B40C1
P 8450 4100
F 0 "R34" V 8400 4000 50  0000 C CNN
F 1 "270" V 8400 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8450 4100 50  0001 C CNN
F 3 "~" H 8450 4100 50  0001 C CNN
	1    8450 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R35
U 1 1 625D6550
P 8450 4400
F 0 "R35" V 8400 4300 50  0000 C CNN
F 1 "270" V 8400 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8450 4400 50  0001 C CNN
F 3 "~" H 8450 4400 50  0001 C CNN
	1    8450 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R36
U 1 1 625E7BE2
P 8450 5300
F 0 "R36" V 8400 5200 50  0000 C CNN
F 1 "270" V 8400 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8450 5300 50  0001 C CNN
F 3 "~" H 8450 5300 50  0001 C CNN
	1    8450 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R37
U 1 1 6260A2E5
P 8450 5600
F 0 "R37" V 8400 5500 50  0000 C CNN
F 1 "270" V 8400 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8450 5600 50  0001 C CNN
F 3 "~" H 8450 5600 50  0001 C CNN
	1    8450 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R47
U 1 1 6261B923
P 9550 5300
F 0 "R47" V 9500 5200 50  0000 C CNN
F 1 "270" V 9500 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5300 50  0001 C CNN
F 3 "~" H 9550 5300 50  0001 C CNN
	1    9550 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R48
U 1 1 6262CCF3
P 9550 5400
F 0 "R48" V 9500 5300 50  0000 C CNN
F 1 "270" V 9500 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5400 50  0001 C CNN
F 3 "~" H 9550 5400 50  0001 C CNN
	1    9550 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R49
U 1 1 6263DFC2
P 9550 5500
F 0 "R49" V 9500 5400 50  0000 C CNN
F 1 "270" V 9500 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5500 50  0001 C CNN
F 3 "~" H 9550 5500 50  0001 C CNN
	1    9550 5500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R50
U 1 1 6264F2A7
P 9550 5600
F 0 "R50" V 9500 5500 50  0000 C CNN
F 1 "270" V 9500 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 5600 50  0001 C CNN
F 3 "~" H 9550 5600 50  0001 C CNN
	1    9550 5600
	0    1    1    0   
$EndComp
Text GLabel 9850 5300 2    50   Input ~ 0
JOYB3
Text GLabel 9850 5400 2    50   Input ~ 0
JOYB2
Text GLabel 9850 5500 2    50   Input ~ 0
JOYB1
Text GLabel 9850 5600 2    50   Input ~ 0
JOYB0
Text GLabel 8200 5300 0    50   Input ~ 0
JOYB4
Text GLabel 8200 5600 0    50   Input ~ 0
JOYB5
$Comp
L power:+5V #PWR0149
U 1 1 62696879
P 7750 4000
F 0 "#PWR0149" H 7750 3850 50  0001 C CNN
F 1 "+5V" H 7765 4173 50  0000 C CNN
F 2 "" H 7750 4000 50  0001 C CNN
F 3 "" H 7750 4000 50  0001 C CNN
	1    7750 4000
	1    0    0    -1  
$EndComp
Text GLabel 9850 4100 2    50   Input ~ 0
JOYA3
Text GLabel 9850 4200 2    50   Input ~ 0
JOYA2
Text GLabel 9850 4300 2    50   Input ~ 0
JOYA1
Text GLabel 9850 4400 2    50   Input ~ 0
JOYA0
Text GLabel 8200 4100 0    50   Input ~ 0
JOYA4
Text GLabel 8200 4400 0    50   Input ~ 0
JOYA5
Wire Wire Line
	8550 4100 8700 4100
Wire Wire Line
	8550 4400 8700 4400
Wire Wire Line
	8200 4400 8350 4400
Wire Wire Line
	8200 4100 8350 4100
Wire Wire Line
	9300 4100 9450 4100
Wire Wire Line
	9300 4200 9450 4200
Wire Wire Line
	9300 4300 9450 4300
Wire Wire Line
	9300 4400 9450 4400
Wire Wire Line
	9650 4400 9850 4400
Wire Wire Line
	9650 4300 9850 4300
Wire Wire Line
	9650 4200 9850 4200
Wire Wire Line
	9650 4100 9850 4100
Wire Wire Line
	9650 5300 9850 5300
Wire Wire Line
	9650 5400 9850 5400
Wire Wire Line
	9650 5500 9850 5500
Wire Wire Line
	9650 5600 9850 5600
Wire Wire Line
	9300 5300 9450 5300
Wire Wire Line
	9300 5400 9450 5400
Wire Wire Line
	9300 5500 9450 5500
Wire Wire Line
	9300 5600 9450 5600
Wire Wire Line
	8550 5300 8700 5300
Wire Wire Line
	8200 5300 8350 5300
Wire Wire Line
	8200 5600 8350 5600
Wire Wire Line
	8550 5600 8700 5600
Wire Wire Line
	7750 4000 7750 4200
Wire Wire Line
	7750 4200 8700 4200
Wire Wire Line
	7750 4200 7750 5400
Wire Wire Line
	7750 5400 8700 5400
Connection ~ 7750 4200
Text Notes 9250 6950 0    79   ~ 16
Audio
$Comp
L Device:R_Small R38
U 1 1 628B7A9B
P 8550 7450
F 0 "R38" V 8354 7450 50  0000 C CNN
F 1 "560" V 8445 7450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 7450 50  0001 C CNN
F 3 "~" H 8550 7450 50  0001 C CNN
	1    8550 7450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R39
U 1 1 628B8B2C
P 8550 8250
F 0 "R39" V 8354 8250 50  0000 C CNN
F 1 "560" V 8445 8250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 8250 50  0001 C CNN
F 3 "~" H 8550 8250 50  0001 C CNN
	1    8550 8250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R40
U 1 1 628CDFFA
P 8850 8000
F 0 "R40" H 8909 8046 50  0000 L CNN
F 1 "1k" H 8909 7955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8850 8000 50  0001 C CNN
F 3 "~" H 8850 8000 50  0001 C CNN
	1    8850 8000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R41
U 1 1 628E44B4
P 9500 7450
F 0 "R41" V 9304 7450 50  0000 C CNN
F 1 "560" V 9395 7450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 7450 50  0001 C CNN
F 3 "~" H 9500 7450 50  0001 C CNN
	1    9500 7450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R42
U 1 1 628FA49B
P 9500 8250
F 0 "R42" V 9304 8250 50  0000 C CNN
F 1 "560" V 9395 8250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9500 8250 50  0001 C CNN
F 3 "~" H 9500 8250 50  0001 C CNN
	1    9500 8250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C46
U 1 1 6290F993
P 9150 7650
F 0 "C46" H 9242 7696 50  0000 L CNN
F 1 "10nF" H 9242 7605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9150 7650 50  0001 C CNN
F 3 "~" H 9150 7650 50  0001 C CNN
	1    9150 7650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C47
U 1 1 6293C81D
P 9150 8050
F 0 "C47" H 9242 8096 50  0000 L CNN
F 1 "10nF" H 9242 8005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9150 8050 50  0001 C CNN
F 3 "~" H 9150 8050 50  0001 C CNN
	1    9150 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C49
U 1 1 62951FD8
P 9700 7650
F 0 "C49" H 9792 7696 50  0000 L CNN
F 1 "10nF" H 9792 7605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9700 7650 50  0001 C CNN
F 3 "~" H 9700 7650 50  0001 C CNN
	1    9700 7650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C50
U 1 1 62967602
P 9700 8050
F 0 "C50" H 9792 8096 50  0000 L CNN
F 1 "10nF" H 9792 8005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9700 8050 50  0001 C CNN
F 3 "~" H 9700 8050 50  0001 C CNN
	1    9700 8050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 6297C9CF
P 10000 7850
F 0 "#PWR0157" H 10000 7600 50  0001 C CNN
F 1 "GND" V 10005 7722 50  0000 R CNN
F 2 "" H 10000 7850 50  0001 C CNN
F 3 "" H 10000 7850 50  0001 C CNN
	1    10000 7850
	0    -1   -1   0   
$EndComp
Text GLabel 8200 7450 0    50   Input ~ 0
AUDIOL
Text GLabel 8200 8250 0    50   Input ~ 0
AUDIOR
Wire Wire Line
	8200 7450 8450 7450
Wire Wire Line
	8200 8250 8450 8250
Wire Wire Line
	8650 8250 8850 8250
Wire Wire Line
	8650 7450 8850 7450
Wire Wire Line
	9150 7450 9150 7550
Connection ~ 9150 7450
Wire Wire Line
	9150 7450 9400 7450
Wire Wire Line
	9150 7750 9150 7850
Wire Wire Line
	9150 8150 9150 8250
Connection ~ 9150 8250
Wire Wire Line
	9150 8250 9400 8250
Wire Wire Line
	9600 7450 9700 7450
Wire Wire Line
	9700 7450 9700 7550
Wire Wire Line
	9700 7750 9700 7850
Wire Wire Line
	9600 8250 9700 8250
Wire Wire Line
	9700 8250 9700 8150
Wire Wire Line
	9150 7850 9700 7850
Connection ~ 9150 7850
Wire Wire Line
	9150 7850 9150 7950
Connection ~ 9700 7850
Wire Wire Line
	9700 7850 9700 7950
Wire Wire Line
	9700 7850 10000 7850
$Comp
L Connector_Generic:Conn_01x02 J12
U 1 1 62ABB80B
P 8500 7900
F 0 "J12" H 8418 7575 50  0000 C CNN
F 1 "Audio" H 8418 7666 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8500 7900 50  0001 C CNN
F 3 "~" H 8500 7900 50  0001 C CNN
	1    8500 7900
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 7800 8850 7800
Wire Wire Line
	8850 7800 8850 7450
Connection ~ 8850 7450
Wire Wire Line
	8850 7450 9150 7450
Wire Wire Line
	8700 7900 8850 7900
Wire Wire Line
	8850 8100 8850 8250
Connection ~ 8850 8250
Wire Wire Line
	8850 8250 9150 8250
Text Notes 7800 7950 0    50   ~ 0
Remove jumper\nfor Amiga style\nstereo sound.
$Comp
L SamacSys_Parts:16SVT100M C51
U 1 1 62B51CD6
P 10050 7450
F 0 "C51" H 10300 7717 50  0000 C CNN
F 1 "16SVT100M" H 10300 7626 50  0000 C CNN
F 2 "16SVPT100M" H 10400 7500 50  0001 L CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AAB8000/ast-ind-134270.pdf" H 10400 7400 50  0001 L CNN
F 4 "Aluminium Organic Polymer Capacitors 16VDC 100uF 20% 780mA 24mOhm" H 10400 7300 50  0001 L CNN "Description"
F 5 "6.5" H 10400 7200 50  0001 L CNN "Height"
F 6 "667-16SVT100M" H 10400 7100 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Panasonic/16SVT100M?qs=DPoM0jnrROW2uchJmfsV5w%3D%3D" H 10400 7000 50  0001 L CNN "Mouser Price/Stock"
F 8 "Panasonic" H 10400 6900 50  0001 L CNN "Manufacturer_Name"
F 9 "16SVT100M" H 10400 6800 50  0001 L CNN "Manufacturer_Part_Number"
	1    10050 7450
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:16SVT100M C52
U 1 1 62B53953
P 10050 8250
F 0 "C52" H 10300 8517 50  0000 C CNN
F 1 "16SVT100M" H 10300 8426 50  0000 C CNN
F 2 "16SVPT100M" H 10400 8300 50  0001 L CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AAB8000/ast-ind-134270.pdf" H 10400 8200 50  0001 L CNN
F 4 "Aluminium Organic Polymer Capacitors 16VDC 100uF 20% 780mA 24mOhm" H 10400 8100 50  0001 L CNN "Description"
F 5 "6.5" H 10400 8000 50  0001 L CNN "Height"
F 6 "667-16SVT100M" H 10400 7900 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Panasonic/16SVT100M?qs=DPoM0jnrROW2uchJmfsV5w%3D%3D" H 10400 7800 50  0001 L CNN "Mouser Price/Stock"
F 8 "Panasonic" H 10400 7700 50  0001 L CNN "Manufacturer_Name"
F 9 "16SVT100M" H 10400 7600 50  0001 L CNN "Manufacturer_Part_Number"
	1    10050 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 7450 10050 7450
Connection ~ 9700 7450
Wire Wire Line
	9700 8250 10050 8250
Connection ~ 9700 8250
$Comp
L SamacSys_Parts:SJ-3523-SMT-TR J15
U 1 1 62561860
P 11000 7250
F 0 "J15" V 11554 7378 50  0000 L CNN
F 1 "SJ-3523-SMT-TR" V 11645 7378 50  0000 L CNN
F 2 "SJ3523SMTTR" H 12050 7350 50  0001 L CNN
F 3 "https://www.mouser.de/datasheet/2/670/sj_352x_smt-1779397.pdf" H 12050 7250 50  0001 L CNN
F 4 "Phone Connectors Audio Jacks" H 12050 7150 50  0001 L CNN "Description"
F 5 "5.2" H 12050 7050 50  0001 L CNN "Height"
F 6 "490-SJ-3523-SMT-TR" H 12050 6950 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/CUI-Devices/SJ-3523-SMT-TR?qs=WyjlAZoYn51zOHzJ3r4ZRA%3D%3D" H 12050 6850 50  0001 L CNN "Mouser Price/Stock"
F 8 "CUI Inc." H 12050 6750 50  0001 L CNN "Manufacturer_Name"
F 9 "SJ-3523-SMT-TR" H 12050 6650 50  0001 L CNN "Manufacturer_Part_Number"
	1    11000 7250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 6257D071
P 11300 7250
F 0 "#PWR0161" H 11300 7000 50  0001 C CNN
F 1 "GND" H 11305 7077 50  0000 C CNN
F 2 "" H 11300 7250 50  0001 C CNN
F 3 "" H 11300 7250 50  0001 C CNN
	1    11300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 7250 10900 7100
Wire Wire Line
	10900 7100 10650 7100
Wire Wire Line
	10650 7100 10650 7450
Wire Wire Line
	10650 7450 10550 7450
Wire Wire Line
	11000 7250 11000 7100
Wire Wire Line
	11000 7100 11300 7100
Wire Wire Line
	11300 7100 11300 7250
Wire Wire Line
	11000 8450 11000 8600
Wire Wire Line
	11000 8600 10650 8600
Wire Wire Line
	10650 8600 10650 8250
Wire Wire Line
	10650 8250 10550 8250
$Comp
L SamacSys_Parts:500998-0900 J11
U 1 1 626FC3B9
P 7600 9800
F 0 "J11" H 8750 10065 50  0000 C CNN
F 1 "500998-0900" H 8750 9974 50  0000 C CNN
F 2 "5009980900" H 9750 9900 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/500998-0900.pdf" H 9750 9800 50  0001 L CNN
F 4 "9 way normal mount SD card connector 9 way normal mount SD card connector" H 9750 9700 50  0001 L CNN "Description"
F 5 "3" H 9750 9600 50  0001 L CNN "Height"
F 6 "538-500998-0900" H 9750 9500 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Molex/500998-0900?qs=WZeyYeqMOWf6HtoZFqOEmw%3D%3D" H 9750 9400 50  0001 L CNN "Mouser Price/Stock"
F 8 "Molex" H 9750 9300 50  0001 L CNN "Manufacturer_Name"
F 9 "500998-0900" H 9750 9200 50  0001 L CNN "Manufacturer_Part_Number"
	1    7600 9800
	1    0    0    -1  
$EndComp
Text Notes 8550 9300 0    79   ~ 16
SD Card
NoConn ~ 9900 10500
NoConn ~ 9900 10400
NoConn ~ 9900 10300
NoConn ~ 9900 10100
NoConn ~ 9900 10000
NoConn ~ 9900 9900
NoConn ~ 9900 9800
NoConn ~ 7600 10500
$Comp
L power:+3.3V #PWR0147
U 1 1 6283A69D
P 7600 10100
F 0 "#PWR0147" H 7600 9950 50  0001 C CNN
F 1 "+3.3V" V 7615 10228 50  0000 L CNN
F 2 "" H 7600 10100 50  0001 C CNN
F 3 "" H 7600 10100 50  0001 C CNN
	1    7600 10100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 6283AF29
P 7600 10000
F 0 "#PWR0146" H 7600 9750 50  0001 C CNN
F 1 "GND" V 7605 9872 50  0000 R CNN
F 2 "" H 7600 10000 50  0001 C CNN
F 3 "" H 7600 10000 50  0001 C CNN
	1    7600 10000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R30
U 1 1 6283C125
P 7400 9800
F 0 "R30" V 7350 9700 50  0000 C CNN
F 1 "270" V 7350 9900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 9800 50  0001 C CNN
F 3 "~" H 7400 9800 50  0001 C CNN
	1    7400 9800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R31
U 1 1 6283EB6F
P 7400 9900
F 0 "R31" V 7350 9800 50  0000 C CNN
F 1 "270" V 7350 10000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 9900 50  0001 C CNN
F 3 "~" H 7400 9900 50  0001 C CNN
	1    7400 9900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R32
U 1 1 62858F7E
P 7400 10200
F 0 "R32" V 7350 10100 50  0000 C CNN
F 1 "270" V 7350 10300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 10200 50  0001 C CNN
F 3 "~" H 7400 10200 50  0001 C CNN
	1    7400 10200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R29
U 1 1 628733D3
P 7000 10200
F 0 "R29" V 6950 10100 50  0000 C CNN
F 1 "1k" V 6950 10300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 10200 50  0001 C CNN
F 3 "~" H 7000 10200 50  0001 C CNN
	1    7000 10200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R33
U 1 1 6288DAE3
P 7400 10400
F 0 "R33" V 7350 10300 50  0000 C CNN
F 1 "100" V 7350 10500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7400 10400 50  0001 C CNN
F 3 "~" H 7400 10400 50  0001 C CNN
	1    7400 10400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0148
U 1 1 628A7C80
P 7600 10300
F 0 "#PWR0148" H 7600 10050 50  0001 C CNN
F 1 "GND" V 7605 10172 50  0000 R CNN
F 2 "" H 7600 10300 50  0001 C CNN
F 3 "" H 7600 10300 50  0001 C CNN
	1    7600 10300
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 10400 7500 10400
Wire Wire Line
	7600 10200 7500 10200
Wire Wire Line
	7300 10200 7200 10200
Wire Wire Line
	7600 9900 7500 9900
Wire Wire Line
	7600 9800 7500 9800
Text GLabel 6700 10300 0    50   Input ~ 0
MCC_CLKEN
Text GLabel 6700 10200 0    50   Input ~ 0
SPI_CLK
Wire Wire Line
	6700 10200 6900 10200
Wire Wire Line
	6700 10300 7200 10300
Wire Wire Line
	7200 10300 7200 10200
Connection ~ 7200 10200
Wire Wire Line
	7200 10200 7100 10200
Text GLabel 6700 10400 0    50   Input ~ 0
SPI_DOUT
Wire Wire Line
	6700 10400 7300 10400
Text GLabel 6700 9900 0    50   Input ~ 0
SPI_DIN
Text GLabel 6700 9800 0    50   Input ~ 0
MCC_SEL
Wire Wire Line
	6700 9800 7300 9800
Wire Wire Line
	6700 9900 7300 9900
$Comp
L power:GND #PWR0158
U 1 1 629E0542
P 10050 10200
F 0 "#PWR0158" H 10050 9950 50  0001 C CNN
F 1 "GND" V 10055 10072 50  0000 R CNN
F 2 "" H 10050 10200 50  0001 C CNN
F 3 "" H 10050 10200 50  0001 C CNN
	1    10050 10200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9900 10200 10050 10200
$Comp
L SamacSys_Parts:L77HDE15SD1CH4RHNVGA J16
U 1 1 62A1D46B
P 13250 4750
F 0 "J16" H 13700 5015 50  0000 C CNN
F 1 "L77HDE15SD1CH4RHNVGA" H 13700 4924 50  0000 C CNN
F 2 "L77HDE15SD1CH4RHNVGA" H 14000 4850 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/L77HDE15SD1CH4RHNVGA.pdf" H 14000 4750 50  0001 L CNN
F 4 "D-Sub High Density Connectors Dsub, Stamped Signal 3A, High Density, Right Angle PCB Thru Hole, FP=8.89mm (.350\"), 15 Socket, Bright Tin Shell, Flash Gold, 4-40 Rear Insert, Ground Tab with Boardlock, High Temp, Nickel Shell, VGA" H 14000 4650 50  0001 L CNN "Description"
F 5 "12.55" H 14000 4550 50  0001 L CNN "Height"
F 6 "523-7HDE15SDH4RHNVGA" H 14000 4450 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Amphenol-Commercial-Products/L77HDE15SD1CH4RHNVGA?qs=f9yNj16SXrKPVxRw%2FcVQYg%3D%3D" H 14000 4350 50  0001 L CNN "Mouser Price/Stock"
F 8 "Amphenol" H 14000 4250 50  0001 L CNN "Manufacturer_Name"
F 9 "L77HDE15SD1CH4RHNVGA" H 14000 4150 50  0001 L CNN "Manufacturer_Part_Number"
	1    13250 4750
	1    0    0    -1  
$EndComp
Text Notes 13300 4100 0    79   ~ 16
VGA Connector
$Comp
L Diode:BAV99 D6
U 1 1 62581867
P 14950 5300
F 0 "D6" H 14950 5516 50  0000 C CNN
F 1 "BAV99" H 14950 5425 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 14950 4800 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAV99_SER.pdf" H 14950 5300 50  0001 C CNN
	1    14950 5300
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R63
U 1 1 6259FB39
P 14250 5600
F 0 "R63" H 14309 5646 50  0000 L CNN
F 1 "1k" H 14309 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 14250 5600 50  0001 C CNN
F 3 "~" H 14250 5600 50  0001 C CNN
	1    14250 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0170
U 1 1 625A0DFE
P 14250 5800
F 0 "#PWR0170" H 14250 5550 50  0001 C CNN
F 1 "GND" H 14255 5627 50  0000 C CNN
F 2 "" H 14250 5800 50  0001 C CNN
F 3 "" H 14250 5800 50  0001 C CNN
	1    14250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 5450 14250 5450
Wire Wire Line
	14250 5450 14250 5500
Wire Wire Line
	14250 5700 14250 5800
Wire Wire Line
	14150 5350 14250 5350
Wire Wire Line
	14250 5350 14250 5450
Connection ~ 14250 5450
NoConn ~ 13250 5050
NoConn ~ 13250 5550
NoConn ~ 14150 4850
NoConn ~ 14150 4950
NoConn ~ 14150 5250
$Comp
L power:GND #PWR0168
U 1 1 6268F35F
P 13100 5800
F 0 "#PWR0168" H 13100 5550 50  0001 C CNN
F 1 "GND" H 13105 5627 50  0000 C CNN
F 2 "" H 13100 5800 50  0001 C CNN
F 3 "" H 13100 5800 50  0001 C CNN
	1    13100 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 5800 13100 5450
Wire Wire Line
	13100 5150 13250 5150
Wire Wire Line
	13250 5250 13100 5250
Connection ~ 13100 5250
Wire Wire Line
	13100 5250 13100 5150
Wire Wire Line
	13250 5350 13100 5350
Connection ~ 13100 5350
Wire Wire Line
	13100 5350 13100 5250
Wire Wire Line
	13250 5450 13100 5450
Connection ~ 13100 5450
Wire Wire Line
	13100 5450 13100 5350
$Comp
L power:GND #PWR0169
U 1 1 62728063
P 14150 4750
F 0 "#PWR0169" H 14150 4500 50  0001 C CNN
F 1 "GND" V 14155 4622 50  0000 R CNN
F 2 "" H 14150 4750 50  0001 C CNN
F 3 "" H 14150 4750 50  0001 C CNN
	1    14150 4750
	0    -1   -1   0   
$EndComp
$Comp
L Diode:BAV99 D5
U 1 1 62749FF2
P 14950 4400
F 0 "D5" H 14950 4616 50  0000 C CNN
F 1 "BAV99" H 14950 4525 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 14950 3900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAV99_SER.pdf" H 14950 4400 50  0001 C CNN
	1    14950 4400
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R64
U 1 1 627C4F35
P 15400 4750
F 0 "R64" V 15204 4750 50  0000 C CNN
F 1 "180" V 15295 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 15400 4750 50  0001 C CNN
F 3 "~" H 15400 4750 50  0001 C CNN
	1    15400 4750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R65
U 1 1 62861E8C
P 15400 5650
F 0 "R65" V 15204 5650 50  0000 C CNN
F 1 "100" V 15295 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 15400 5650 50  0001 C CNN
F 3 "~" H 15400 5650 50  0001 C CNN
	1    15400 5650
	0    1    1    0   
$EndComp
Text GLabel 15600 4750 2    50   Input ~ 0
HSYNC
Text GLabel 15600 5650 2    50   Input ~ 0
VSYNC
$Comp
L power:+3.3V #PWR0171
U 1 1 62A91130
P 14550 4400
F 0 "#PWR0171" H 14550 4250 50  0001 C CNN
F 1 "+3.3V" H 14565 4573 50  0000 C CNN
F 2 "" H 14550 4400 50  0001 C CNN
F 3 "" H 14550 4400 50  0001 C CNN
	1    14550 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0172
U 1 1 62A928DF
P 14550 5300
F 0 "#PWR0172" H 14550 5150 50  0001 C CNN
F 1 "+3.3V" H 14565 5473 50  0000 C CNN
F 2 "" H 14550 5300 50  0001 C CNN
F 3 "" H 14550 5300 50  0001 C CNN
	1    14550 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0174
U 1 1 62A9345B
P 15350 5300
F 0 "#PWR0174" H 15350 5050 50  0001 C CNN
F 1 "GND" V 15355 5172 50  0000 R CNN
F 2 "" H 15350 5300 50  0001 C CNN
F 3 "" H 15350 5300 50  0001 C CNN
	1    15350 5300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 62A9418E
P 15350 4400
F 0 "#PWR0173" H 15350 4150 50  0001 C CNN
F 1 "GND" V 15355 4272 50  0000 R CNN
F 2 "" H 15350 4400 50  0001 C CNN
F 3 "" H 15350 4400 50  0001 C CNN
	1    15350 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15250 5300 15350 5300
Wire Wire Line
	15250 4400 15350 4400
Wire Wire Line
	14550 4400 14650 4400
Wire Wire Line
	14550 5300 14650 5300
Wire Wire Line
	15600 5650 15500 5650
Wire Wire Line
	15600 4750 15500 4750
Wire Wire Line
	14150 5050 14450 5050
Wire Wire Line
	14450 5050 14450 4750
Wire Wire Line
	14450 4750 14950 4750
Wire Wire Line
	14950 4600 14950 4750
Connection ~ 14950 4750
Wire Wire Line
	14950 4750 15300 4750
Wire Wire Line
	15300 5650 14950 5650
Wire Wire Line
	14450 5650 14450 5150
Wire Wire Line
	14450 5150 14150 5150
Wire Wire Line
	14950 5500 14950 5650
Connection ~ 14950 5650
Wire Wire Line
	14950 5650 14450 5650
$Comp
L Diode:BAV99 D2
U 1 1 62BFABE4
P 11850 4200
F 0 "D2" H 11850 4323 50  0000 C CNN
F 1 "BAV99" H 11850 4414 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11850 3700 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAV99_SER.pdf" H 11850 4200 50  0001 C CNN
	1    11850 4200
	1    0    0    1   
$EndComp
$Comp
L Diode:BAV99 D3
U 1 1 62BFC4E7
P 11850 5050
F 0 "D3" H 11850 5173 50  0000 C CNN
F 1 "BAV99" H 11850 5264 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11850 4550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAV99_SER.pdf" H 11850 5050 50  0001 C CNN
	1    11850 5050
	1    0    0    1   
$EndComp
$Comp
L Diode:BAV99 D4
U 1 1 62C1D98E
P 11850 5850
F 0 "D4" H 11850 5973 50  0000 C CNN
F 1 "BAV99" H 11850 6064 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 11850 5350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/BAV99_SER.pdf" H 11850 5850 50  0001 C CNN
	1    11850 5850
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 62CA50C0
P 11450 4200
F 0 "#PWR0162" H 11450 3950 50  0001 C CNN
F 1 "GND" V 11455 4072 50  0000 R CNN
F 2 "" H 11450 4200 50  0001 C CNN
F 3 "" H 11450 4200 50  0001 C CNN
	1    11450 4200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 62CA5D91
P 11450 5050
F 0 "#PWR0163" H 11450 4800 50  0001 C CNN
F 1 "GND" V 11455 4922 50  0000 R CNN
F 2 "" H 11450 5050 50  0001 C CNN
F 3 "" H 11450 5050 50  0001 C CNN
	1    11450 5050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 62CA69B6
P 11450 5850
F 0 "#PWR0164" H 11450 5600 50  0001 C CNN
F 1 "GND" V 11455 5722 50  0000 R CNN
F 2 "" H 11450 5850 50  0001 C CNN
F 3 "" H 11450 5850 50  0001 C CNN
	1    11450 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	11450 4200 11550 4200
Wire Wire Line
	11450 5050 11550 5050
Wire Wire Line
	11450 5850 11550 5850
$Comp
L power:+3.3V #PWR0167
U 1 1 62D0D9D9
P 12250 5850
F 0 "#PWR0167" H 12250 5700 50  0001 C CNN
F 1 "+3.3V" H 12265 6023 50  0000 C CNN
F 2 "" H 12250 5850 50  0001 C CNN
F 3 "" H 12250 5850 50  0001 C CNN
	1    12250 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0166
U 1 1 62D0E93C
P 12250 5050
F 0 "#PWR0166" H 12250 4900 50  0001 C CNN
F 1 "+3.3V" H 12265 5223 50  0000 C CNN
F 2 "" H 12250 5050 50  0001 C CNN
F 3 "" H 12250 5050 50  0001 C CNN
	1    12250 5050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0165
U 1 1 62D0F535
P 12250 4200
F 0 "#PWR0165" H 12250 4050 50  0001 C CNN
F 1 "+3.3V" H 12265 4373 50  0000 C CNN
F 2 "" H 12250 4200 50  0001 C CNN
F 3 "" H 12250 4200 50  0001 C CNN
	1    12250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 4200 12250 4200
Wire Wire Line
	12150 5050 12250 5050
Wire Wire Line
	12150 5850 12250 5850
Text GLabel 11150 3650 0    50   Input ~ 0
RED0
Text GLabel 11150 3800 0    50   Input ~ 0
RED1
Text GLabel 11150 3950 0    50   Input ~ 0
RED2
Text GLabel 11150 4100 0    50   Input ~ 0
RED3
Text GLabel 11150 4500 0    50   Input ~ 0
GREEN0
Text GLabel 11150 4650 0    50   Input ~ 0
GREEN1
Text GLabel 11150 4800 0    50   Input ~ 0
GREEN2
Text GLabel 11150 4950 0    50   Input ~ 0
GREEN3
Text GLabel 11150 5300 0    50   Input ~ 0
BLUE0
Text GLabel 11150 5450 0    50   Input ~ 0
BLUE1
Text GLabel 11150 5600 0    50   Input ~ 0
BLUE2
Text GLabel 11150 5750 0    50   Input ~ 0
BLUE3
$Comp
L Device:R_Small R51
U 1 1 62E989E4
P 11400 3650
F 0 "R51" V 11350 3550 50  0000 C CNN
F 1 "4.7k" V 11350 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 3650 50  0001 C CNN
F 3 "~" H 11400 3650 50  0001 C CNN
	1    11400 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R52
U 1 1 62E9AB51
P 11400 3800
F 0 "R52" V 11350 3700 50  0000 C CNN
F 1 "2.2k" V 11350 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 3800 50  0001 C CNN
F 3 "~" H 11400 3800 50  0001 C CNN
	1    11400 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R53
U 1 1 62EBCFF4
P 11400 3950
F 0 "R53" V 11350 3850 50  0000 C CNN
F 1 "1k" V 11350 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 3950 50  0001 C CNN
F 3 "~" H 11400 3950 50  0001 C CNN
	1    11400 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R54
U 1 1 62EDF4D2
P 11400 4100
F 0 "R54" V 11350 4000 50  0000 C CNN
F 1 "560" V 11350 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 4100 50  0001 C CNN
F 3 "~" H 11400 4100 50  0001 C CNN
	1    11400 4100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R55
U 1 1 62F93D37
P 11400 4500
F 0 "R55" V 11350 4400 50  0000 C CNN
F 1 "4.7k" V 11350 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 4500 50  0001 C CNN
F 3 "~" H 11400 4500 50  0001 C CNN
	1    11400 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R56
U 1 1 62F93D3D
P 11400 4650
F 0 "R56" V 11350 4550 50  0000 C CNN
F 1 "2.2k" V 11350 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 4650 50  0001 C CNN
F 3 "~" H 11400 4650 50  0001 C CNN
	1    11400 4650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R57
U 1 1 62F93D43
P 11400 4800
F 0 "R57" V 11350 4700 50  0000 C CNN
F 1 "1k" V 11350 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 4800 50  0001 C CNN
F 3 "~" H 11400 4800 50  0001 C CNN
	1    11400 4800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R58
U 1 1 62F93D49
P 11400 4950
F 0 "R58" V 11350 4850 50  0000 C CNN
F 1 "560" V 11350 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 4950 50  0001 C CNN
F 3 "~" H 11400 4950 50  0001 C CNN
	1    11400 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R59
U 1 1 62FB6C62
P 11400 5300
F 0 "R59" V 11350 5200 50  0000 C CNN
F 1 "4.7k" V 11350 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 5300 50  0001 C CNN
F 3 "~" H 11400 5300 50  0001 C CNN
	1    11400 5300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R60
U 1 1 62FB6C68
P 11400 5450
F 0 "R60" V 11350 5350 50  0000 C CNN
F 1 "2.2k" V 11350 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 5450 50  0001 C CNN
F 3 "~" H 11400 5450 50  0001 C CNN
	1    11400 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R61
U 1 1 62FB6C6E
P 11400 5600
F 0 "R61" V 11350 5500 50  0000 C CNN
F 1 "1k" V 11350 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 5600 50  0001 C CNN
F 3 "~" H 11400 5600 50  0001 C CNN
	1    11400 5600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R62
U 1 1 62FB6C74
P 11400 5750
F 0 "R62" V 11350 5650 50  0000 C CNN
F 1 "560" V 11350 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 11400 5750 50  0001 C CNN
F 3 "~" H 11400 5750 50  0001 C CNN
	1    11400 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	11150 3650 11300 3650
Wire Wire Line
	11150 3800 11300 3800
Wire Wire Line
	11150 3950 11300 3950
Wire Wire Line
	11150 4100 11300 4100
Wire Wire Line
	11150 4500 11300 4500
Wire Wire Line
	11150 4650 11300 4650
Wire Wire Line
	11150 4800 11300 4800
Wire Wire Line
	11150 4950 11300 4950
Wire Wire Line
	11150 5300 11300 5300
Wire Wire Line
	11150 5450 11300 5450
Wire Wire Line
	11150 5600 11300 5600
Wire Wire Line
	11150 5750 11300 5750
Wire Wire Line
	11500 4100 11650 4100
Wire Wire Line
	11650 4100 11650 3950
Wire Wire Line
	11650 3650 11500 3650
Wire Wire Line
	11500 3800 11650 3800
Connection ~ 11650 3800
Wire Wire Line
	11650 3800 11650 3650
Wire Wire Line
	11500 3950 11650 3950
Connection ~ 11650 3950
Wire Wire Line
	11650 3950 11650 3800
Wire Wire Line
	11650 3800 11850 3800
Wire Wire Line
	13100 3800 13100 4750
Wire Wire Line
	13100 4750 13250 4750
Wire Wire Line
	11850 4000 11850 3800
Connection ~ 11850 3800
Wire Wire Line
	11850 3800 13100 3800
Wire Wire Line
	11500 4500 11650 4500
Wire Wire Line
	11650 4500 11650 4650
Wire Wire Line
	11650 4950 11500 4950
Wire Wire Line
	11500 4800 11650 4800
Connection ~ 11650 4800
Wire Wire Line
	11650 4800 11650 4950
Wire Wire Line
	11500 4650 11650 4650
Connection ~ 11650 4650
Wire Wire Line
	11650 4650 11650 4800
Wire Wire Line
	11650 4650 11850 4650
Wire Wire Line
	13050 4650 13050 4850
Wire Wire Line
	13050 4850 13250 4850
Wire Wire Line
	11850 4850 11850 4650
Connection ~ 11850 4650
Wire Wire Line
	11850 4650 13050 4650
Wire Wire Line
	11500 5750 11650 5750
Wire Wire Line
	11650 5750 11650 5600
Wire Wire Line
	11650 5300 11500 5300
Wire Wire Line
	11500 5450 11650 5450
Connection ~ 11650 5450
Wire Wire Line
	11650 5450 11650 5300
Wire Wire Line
	11500 5600 11650 5600
Connection ~ 11650 5600
Wire Wire Line
	11650 5600 11650 5450
Wire Wire Line
	11650 5450 11850 5450
Wire Wire Line
	13050 5450 13050 4950
Wire Wire Line
	13050 4950 13250 4950
Wire Wire Line
	11850 5450 11850 5650
Connection ~ 11850 5450
Wire Wire Line
	11850 5450 13050 5450
Text Notes 6000 9050 2    79   ~ 16
ON/OFF Power Switch
$Comp
L Connector_Generic:Conn_01x02 J17
U 1 1 629E5FF8
P 5400 9300
F 0 "J17" H 5480 9292 50  0000 L CNN
F 1 "ON-OFF" H 5480 9201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5400 9300 50  0001 C CNN
F 3 "~" H 5400 9300 50  0001 C CNN
	1    5400 9300
	1    0    0    -1  
$EndComp
Text GLabel 5100 9300 0    50   Input ~ 0
PS_ON
Text GLabel 5100 9400 0    50   Input ~ 0
GND
Wire Wire Line
	5100 9300 5200 9300
Wire Wire Line
	5100 9400 5200 9400
$Comp
L SamacSys_Parts:865230257007 C54
U 1 1 629E9D61
P 750 6850
F 0 "C54" H 1000 7115 50  0000 C CNN
F 1 "865230257007" H 1000 7024 50  0000 C CNN
F 2 "CAPAE1030X1050N" H 1100 6900 50  0001 L CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/865230257007.pdf" H 1100 6800 50  0001 L CNN
F 4 "Wurth Elektronik 470uF 10 V dc Aluminium Electrolytic Capacitor, WCAP-AS5H Series 5000h 10.5 (Dia.) x 9.85mm" H 1100 6700 50  0001 L CNN "Description"
F 5 "10.5" H 1100 6600 50  0001 L CNN "Height"
F 6 "710-865230257007" H 1100 6500 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Wurth-Elektronik/865230257007?qs=0KOYDY2FL2%2FZJZat8O3IFw%3D%3D" H 1100 6400 50  0001 L CNN "Mouser Price/Stock"
F 8 "Wurth Elektronik" H 1100 6300 50  0001 L CNN "Manufacturer_Name"
F 9 "865230257007" H 1100 6200 50  0001 L CNN "Manufacturer_Part_Number"
	1    750  6850
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:865230257007 C53
U 1 1 629EBB11
P 750 6300
F 0 "C53" H 1000 6565 50  0000 C CNN
F 1 "865230257007" H 1000 6474 50  0000 C CNN
F 2 "CAPAE1030X1050N" H 1100 6350 50  0001 L CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/865230257007.pdf" H 1100 6250 50  0001 L CNN
F 4 "Wurth Elektronik 470uF 10 V dc Aluminium Electrolytic Capacitor, WCAP-AS5H Series 5000h 10.5 (Dia.) x 9.85mm" H 1100 6150 50  0001 L CNN "Description"
F 5 "10.5" H 1100 6050 50  0001 L CNN "Height"
F 6 "710-865230257007" H 1100 5950 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Wurth-Elektronik/865230257007?qs=0KOYDY2FL2%2FZJZat8O3IFw%3D%3D" H 1100 5850 50  0001 L CNN "Mouser Price/Stock"
F 8 "Wurth Elektronik" H 1100 5750 50  0001 L CNN "Manufacturer_Name"
F 9 "865230257007" H 1100 5650 50  0001 L CNN "Manufacturer_Part_Number"
	1    750  6300
	1    0    0    -1  
$EndComp
Text GLabel 750  6300 0    50   Input ~ 0
5VDC
Text GLabel 750  6850 0    50   Input ~ 0
5VDC
$Comp
L power:GND #PWR0175
U 1 1 629EE6E2
P 1400 7000
F 0 "#PWR0175" H 1400 6750 50  0001 C CNN
F 1 "GND" H 1405 6827 50  0000 C CNN
F 2 "" H 1400 7000 50  0001 C CNN
F 3 "" H 1400 7000 50  0001 C CNN
	1    1400 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 6300 1400 6300
Wire Wire Line
	1400 6300 1400 6850
Wire Wire Line
	1250 6850 1400 6850
Connection ~ 1400 6850
Wire Wire Line
	1400 6850 1400 7000
$Comp
L SamacSys_Parts:865230143004 C55
U 1 1 629E52E4
P 1700 6350
F 0 "C55" H 1950 6617 50  0000 C CNN
F 1 "865230143004" H 1950 6526 50  0000 C CNN
F 2 "CAPAE660X550N" H 2050 6400 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/865230143004.pdf" H 2050 6300 50  0001 L CNN
F 4 "Wurth Elektronik 100uF 6.3 V dc Aluminium Electrolytic Capacitor, WCAP-AS5H Series 5000h 5.5 (Dia.) x 6.15mm" H 2050 6200 50  0001 L CNN "Description"
F 5 "5.5" H 2050 6100 50  0001 L CNN "Height"
F 6 "710-865230143004" H 2050 6000 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=710-865230143004" H 2050 5900 50  0001 L CNN "Mouser Price/Stock"
F 8 "Wurth Elektronik" H 2050 5800 50  0001 L CNN "Manufacturer_Name"
F 9 "865230143004" H 2050 5700 50  0001 L CNN "Manufacturer_Part_Number"
	1    1700 6350
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:865230143004 C56
U 1 1 629E74EC
P 1700 6800
F 0 "C56" H 1950 7067 50  0000 C CNN
F 1 "865230143004" H 1950 6976 50  0000 C CNN
F 2 "CAPAE660X550N" H 2050 6850 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/865230143004.pdf" H 2050 6750 50  0001 L CNN
F 4 "Wurth Elektronik 100uF 6.3 V dc Aluminium Electrolytic Capacitor, WCAP-AS5H Series 5000h 5.5 (Dia.) x 6.15mm" H 2050 6650 50  0001 L CNN "Description"
F 5 "5.5" H 2050 6550 50  0001 L CNN "Height"
F 6 "710-865230143004" H 2050 6450 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=710-865230143004" H 2050 6350 50  0001 L CNN "Mouser Price/Stock"
F 8 "Wurth Elektronik" H 2050 6250 50  0001 L CNN "Manufacturer_Name"
F 9 "865230143004" H 2050 6150 50  0001 L CNN "Manufacturer_Part_Number"
	1    1700 6800
	1    0    0    -1  
$EndComp
Text GLabel 1700 6350 0    50   Input ~ 0
3.3V
Text GLabel 1700 6800 0    50   Input ~ 0
3.3V
$Comp
L power:GND #PWR0176
U 1 1 629EA421
P 2250 7000
F 0 "#PWR0176" H 2250 6750 50  0001 C CNN
F 1 "GND" H 2255 6827 50  0000 C CNN
F 2 "" H 2250 7000 50  0001 C CNN
F 3 "" H 2250 7000 50  0001 C CNN
	1    2250 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 6350 2250 6350
Wire Wire Line
	2250 6350 2250 6800
Wire Wire Line
	2200 6800 2250 6800
Connection ~ 2250 6800
Wire Wire Line
	2250 6800 2250 7000
$Comp
L SamacSys_Parts:MAX16054AZT+T IC8
U 1 1 6373EDA2
P 2350 9450
F 0 "IC8" H 2950 9715 50  0000 C CNN
F 1 "MAX16054AZT+T" H 2950 9624 50  0000 C CNN
F 2 "SOT95P275X110-6N" H 3400 9550 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/SFDatasheet-4/sf-00087822.pdf" H 3400 9450 50  0001 L CNN
F 4 "On Off Controller, Debounce, 15kV ESD MAX16054AZT+T, Voltage Supervisor No Push Button Controller 6-Pin SOT-23" H 3400 9350 50  0001 L CNN "Description"
F 5 "1.1" H 3400 9250 50  0001 L CNN "Height"
F 6 "700-MAX16054AZTT" H 3400 9150 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Maxim-Integrated/MAX16054AZT%2bT?qs=CDqwynd4ZNoG75aAAjGoqQ%3D%3D" H 3400 9050 50  0001 L CNN "Mouser Price/Stock"
F 8 "Maxim Integrated" H 3400 8950 50  0001 L CNN "Manufacturer_Name"
F 9 "MAX16054AZT+T" H 3400 8850 50  0001 L CNN "Manufacturer_Part_Number"
	1    2350 9450
	1    0    0    -1  
$EndComp
Text GLabel 3700 9450 2    50   Input ~ 0
5VSB
$Comp
L power:GND #PWR0123
U 1 1 63741A52
P 2200 9750
F 0 "#PWR0123" H 2200 9500 50  0001 C CNN
F 1 "GND" H 2205 9577 50  0000 C CNN
F 2 "" H 2200 9750 50  0001 C CNN
F 3 "" H 2200 9750 50  0001 C CNN
	1    2200 9750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 9550 2200 9550
Wire Wire Line
	2200 9550 2200 9650
Wire Wire Line
	2350 9650 2200 9650
Connection ~ 2200 9650
Wire Wire Line
	2200 9650 2200 9750
Connection ~ 2200 9550
Wire Wire Line
	2200 9450 2350 9450
NoConn ~ 3550 9550
Wire Wire Line
	3550 9450 3700 9450
Wire Wire Line
	3550 9650 3700 9650
Wire Wire Line
	5450 7700 5525 7700
Wire Wire Line
	5450 8100 5525 8100
Wire Wire Line
	5450 8200 5525 8200
Wire Wire Line
	6600 7700 6675 7700
Wire Wire Line
	5600 7600 5525 7600
Wire Wire Line
	5525 7600 5525 7700
Connection ~ 5525 7700
Wire Wire Line
	5525 7700 5600 7700
Wire Wire Line
	5600 8000 5525 8000
Wire Wire Line
	5525 8000 5525 8100
Connection ~ 5525 8100
Wire Wire Line
	5525 8100 5600 8100
Wire Wire Line
	6600 7800 6675 7800
Wire Wire Line
	6675 7800 6675 7700
Connection ~ 6675 7700
Wire Wire Line
	6675 7700 6750 7700
Wire Wire Line
	5600 8300 5525 8300
Wire Wire Line
	5525 8300 5525 8200
Connection ~ 5525 8200
Wire Wire Line
	5525 8200 5600 8200
Text Notes 5650 8675 0    50   ~ 0
Top Port - Mouse\nBottom Port - Keyboard
$EndSCHEMATC
