EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 3 4
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
L CPU_NXP_68000:68000D U2
U 1 1 623025AB
P 2600 3750
F 0 "U2" H 2200 6200 50  0000 C CNN
F 1 "68000D" H 2200 6100 50  0000 C CNN
F 2 "Package_DIP:DIP-64_W22.86mm_Socket" H 2600 3750 50  0001 C CNN
F 3 "https://www.nxp.com/docs/en/reference-manual/MC68000UM.pdf" H 2600 3750 50  0001 C CNN
	1    2600 3750
	1    0    0    -1  
$EndComp
Text GLabel 3800 5950 2    50   Input ~ 0
RW
Text GLabel 1400 4550 0    50   Input ~ 0
DTACK
Wire Wire Line
	2700 1350 2700 1250
Wire Wire Line
	2700 1250 2650 1250
Wire Wire Line
	2650 1250 2650 1200
Wire Wire Line
	2600 1350 2600 1250
Wire Wire Line
	2600 1250 2650 1250
Connection ~ 2650 1250
Wire Wire Line
	1400 4550 1600 4550
Wire Wire Line
	3600 5950 3800 5950
$Comp
L power:GND #PWR081
U 1 1 62307A6D
P 2650 6250
F 0 "#PWR081" H 2650 6000 50  0001 C CNN
F 1 "GND" H 2655 6077 50  0000 C CNN
F 2 "" H 2650 6250 50  0001 C CNN
F 3 "" H 2650 6250 50  0001 C CNN
	1    2650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6150 2600 6200
Wire Wire Line
	2600 6200 2650 6200
Wire Wire Line
	2650 6200 2650 6250
Wire Wire Line
	2700 6150 2700 6200
Wire Wire Line
	2700 6200 2650 6200
Connection ~ 2650 6200
Text GLabel 1400 1550 0    50   Input ~ 0
CLK
Wire Wire Line
	1400 1550 1600 1550
Text GLabel 1400 1850 0    50   Input ~ 0
IPL0
Text GLabel 1400 1950 0    50   Input ~ 0
IPL1
Text GLabel 1400 2050 0    50   Input ~ 0
IPL2
Wire Wire Line
	1400 1850 1600 1850
Wire Wire Line
	1400 1950 1600 1950
Wire Wire Line
	1400 2050 1600 2050
Text GLabel 3800 5850 2    50   Input ~ 0
LDS
Text GLabel 3800 5750 2    50   Input ~ 0
UDS
Text GLabel 3800 5650 2    50   Input ~ 0
AS
Wire Wire Line
	3600 5650 3800 5650
Wire Wire Line
	3600 5750 3800 5750
Wire Wire Line
	3600 5850 3800 5850
Wire Wire Line
	1400 3250 1600 3250
Wire Wire Line
	1400 3350 1600 3350
Wire Wire Line
	1400 3450 1600 3450
$Comp
L power:+5V #PWR080
U 1 1 6230BC6D
P 2650 1200
F 0 "#PWR080" H 2650 1050 50  0001 C CNN
F 1 "+5V" H 2665 1373 50  0000 C CNN
F 2 "" H 2650 1200 50  0001 C CNN
F 3 "" H 2650 1200 50  0001 C CNN
	1    2650 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR077
U 1 1 6230C2C8
P 1250 3350
F 0 "#PWR077" H 1250 3200 50  0001 C CNN
F 1 "+5V" V 1265 3478 50  0000 L CNN
F 2 "" H 1250 3350 50  0001 C CNN
F 3 "" H 1250 3350 50  0001 C CNN
	1    1250 3350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1400 3450 1400 3350
Wire Wire Line
	1400 3250 1400 3350
Connection ~ 1400 3350
Wire Wire Line
	1400 3350 1250 3350
Text GLabel 1400 2250 0    50   Input ~ 0
BGACK
Text GLabel 1400 2350 0    50   Input ~ 0
BG
Text GLabel 1400 2450 0    50   Input ~ 0
BR
Wire Wire Line
	1400 2250 1600 2250
Wire Wire Line
	1400 2350 1600 2350
Wire Wire Line
	1400 2450 1600 2450
Text GLabel 1400 2750 0    50   Input ~ 0
FC0
Text GLabel 1400 2850 0    50   Input ~ 0
FC1
Text GLabel 1400 2950 0    50   Input ~ 0
FC2
Wire Wire Line
	1400 2750 1600 2750
Wire Wire Line
	1400 2850 1600 2850
Wire Wire Line
	1400 2950 1600 2950
Text GLabel 3800 5450 2    50   Input ~ 0
D15
Text GLabel 3800 5350 2    50   Input ~ 0
D14
Text GLabel 3800 5250 2    50   Input ~ 0
D13
Text GLabel 3800 5150 2    50   Input ~ 0
D12
Text GLabel 3800 5050 2    50   Input ~ 0
D11
Text GLabel 3800 4950 2    50   Input ~ 0
D10
Text GLabel 3800 4850 2    50   Input ~ 0
D9
Text GLabel 3800 4750 2    50   Input ~ 0
D8
Text GLabel 3800 4650 2    50   Input ~ 0
D7
Text GLabel 3800 4550 2    50   Input ~ 0
D6
Text GLabel 3800 4450 2    50   Input ~ 0
D5
Text GLabel 3800 4350 2    50   Input ~ 0
D4
Text GLabel 3800 4250 2    50   Input ~ 0
D3
Text GLabel 3800 4150 2    50   Input ~ 0
D2
Text GLabel 3800 4050 2    50   Input ~ 0
D1
Text GLabel 3800 3950 2    50   Input ~ 0
D0
Text GLabel 3800 3750 2    50   Input ~ 0
A23
Text GLabel 3800 3650 2    50   Input ~ 0
A22
Text GLabel 3800 3550 2    50   Input ~ 0
A21
Text GLabel 3800 3450 2    50   Input ~ 0
A20
Text GLabel 3800 3350 2    50   Input ~ 0
A19
Text GLabel 3800 3150 2    50   Input ~ 0
A17
Text GLabel 3800 3050 2    50   Input ~ 0
A16
Text GLabel 3800 3250 2    50   Input ~ 0
A18
Text GLabel 3800 2950 2    50   Input ~ 0
A15
Text GLabel 3800 2850 2    50   Input ~ 0
A14
Text GLabel 3800 2750 2    50   Input ~ 0
A13
Text GLabel 3800 2650 2    50   Input ~ 0
A12
Text GLabel 3800 2550 2    50   Input ~ 0
A11
Text GLabel 3800 2450 2    50   Input ~ 0
A10
Text GLabel 3800 2350 2    50   Input ~ 0
A9
Text GLabel 3800 2250 2    50   Input ~ 0
A8
Text GLabel 3800 2150 2    50   Input ~ 0
A7
Text GLabel 3800 2050 2    50   Input ~ 0
A6
Text GLabel 3800 1950 2    50   Input ~ 0
A5
Text GLabel 3800 1850 2    50   Input ~ 0
A4
Text GLabel 3800 1750 2    50   Input ~ 0
A3
Text GLabel 3800 1650 2    50   Input ~ 0
A2
Text GLabel 3800 1550 2    50   Input ~ 0
A1
Wire Wire Line
	3600 1550 3800 1550
Wire Wire Line
	3600 1650 3800 1650
Wire Wire Line
	3600 1750 3800 1750
Wire Wire Line
	3600 1850 3800 1850
Wire Wire Line
	3600 1950 3800 1950
Wire Wire Line
	3600 2050 3800 2050
Wire Wire Line
	3600 2150 3800 2150
Wire Wire Line
	3600 2250 3800 2250
Wire Wire Line
	3600 2350 3800 2350
Wire Wire Line
	3600 2450 3800 2450
Wire Wire Line
	3600 2550 3800 2550
Wire Wire Line
	3600 2650 3800 2650
Wire Wire Line
	3600 2750 3800 2750
Wire Wire Line
	3600 2850 3800 2850
Wire Wire Line
	3600 2950 3800 2950
Wire Wire Line
	3600 3050 3800 3050
Wire Wire Line
	3600 3150 3800 3150
Wire Wire Line
	3600 3250 3800 3250
Wire Wire Line
	3600 3350 3800 3350
Wire Wire Line
	3600 3450 3800 3450
Wire Wire Line
	3600 3550 3800 3550
Wire Wire Line
	3600 3650 3800 3650
Wire Wire Line
	3600 3750 3800 3750
Wire Wire Line
	3600 3950 3800 3950
Wire Wire Line
	3600 4050 3800 4050
Wire Wire Line
	3600 4150 3800 4150
Wire Wire Line
	3600 4250 3800 4250
Wire Wire Line
	3600 4350 3800 4350
Wire Wire Line
	3600 4450 3800 4450
Wire Wire Line
	3600 4550 3800 4550
Wire Wire Line
	3600 4650 3800 4650
Wire Wire Line
	3600 4750 3800 4750
Wire Wire Line
	3600 4850 3800 4850
Wire Wire Line
	3600 4950 3800 4950
Wire Wire Line
	3600 5050 3800 5050
Wire Wire Line
	3600 5150 3800 5150
Wire Wire Line
	3600 5250 3800 5250
Wire Wire Line
	3600 5350 3800 5350
Wire Wire Line
	3600 5450 3800 5450
$Comp
L Device:R_Small R1
U 1 1 6233F60C
P 1400 4950
F 0 "R1" V 1204 4950 50  0000 C CNN
F 1 "2.2k" V 1295 4950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 4950 50  0001 C CNN
F 3 "~" H 1400 4950 50  0001 C CNN
	1    1400 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 6233FB3F
P 1400 5050
F 0 "R2" V 1500 5050 50  0000 C CNN
F 1 "2.2k" V 1600 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1400 5050 50  0001 C CNN
F 3 "~" H 1400 5050 50  0001 C CNN
	1    1400 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 4950 1600 4950
Wire Wire Line
	1500 5050 1600 5050
Text GLabel 1200 5000 0    50   Input ~ 0
RESET
Wire Wire Line
	1300 5050 1250 5050
Wire Wire Line
	1250 5050 1250 5000
Wire Wire Line
	1250 5000 1200 5000
Wire Wire Line
	1300 4950 1250 4950
Wire Wire Line
	1250 4950 1250 5000
Connection ~ 1250 5000
Text Notes 2050 900  0    79   ~ 16
68000 CPU Socket
$Comp
L SamacSys_Parts:IS62WV51216EBLL-45TLI U3
U 1 1 623184FA
P 5000 1350
F 0 "U3" H 5600 1615 50  0000 C CNN
F 1 "IS62WV51216EBLL-45TLI" H 5600 1524 50  0000 C CNN
F 2 "SOP80P1176X120-44N" H 6050 1450 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/is62wv51216ebll-45tli/integrated-silicon-solution-inc" H 6050 1350 50  0001 L CNN
F 4 "SRAM Chip Async Single 2.5V/3.3V 8M-bit 512K x 16 45ns 44-Pin TSOP-II" H 6050 1250 50  0001 L CNN "Description"
F 5 "1.2" H 6050 1150 50  0001 L CNN "Height"
F 6 "870-62WV512EBLL45TLI" H 6050 1050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/ProductDetail/ISSI/IS62WV51216EBLL-45TLI?qs=uCnMRCNamml2HPqzTYU7sw%3D%3D" H 6050 950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Integrated Silicon Solution Inc." H 6050 850 50  0001 L CNN "Manufacturer_Name"
F 9 "IS62WV51216EBLL-45TLI" H 6050 750 50  0001 L CNN "Manufacturer_Part_Number"
	1    5000 1350
	1    0    0    -1  
$EndComp
Text Notes 6100 900  0    79   ~ 16
RAM (512k x 16 each)
Text GLabel 5000 1350 0    50   Input ~ 0
RAM_A5
Text GLabel 5000 1450 0    50   Input ~ 0
RAM_A4
Text GLabel 5000 1550 0    50   Input ~ 0
RAM_A3
Text GLabel 5000 1650 0    50   Input ~ 0
RAM_A2
Text GLabel 5000 1750 0    50   Input ~ 0
RAM_A1
Text GLabel 5000 1850 0    50   Input ~ 0
RAM_SEL0
Text GLabel 5000 1950 0    50   Input ~ 0
RAM_D0
Text GLabel 5000 2050 0    50   Input ~ 0
RAM_D1
Text GLabel 5000 2150 0    50   Input ~ 0
RAM_D2
Text GLabel 5000 2250 0    50   Input ~ 0
RAM_D3
$Comp
L power:+3.3V #PWR084
U 1 1 62339ECD
P 5000 2350
F 0 "#PWR084" H 5000 2200 50  0001 C CNN
F 1 "+3.3V" V 5000 2450 50  0000 L CNN
F 2 "" H 5000 2350 50  0001 C CNN
F 3 "" H 5000 2350 50  0001 C CNN
	1    5000 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR085
U 1 1 6233CE10
P 5000 2450
F 0 "#PWR085" H 5000 2200 50  0001 C CNN
F 1 "GND" V 5000 2250 50  0000 C CNN
F 2 "" H 5000 2450 50  0001 C CNN
F 3 "" H 5000 2450 50  0001 C CNN
	1    5000 2450
	0    1    1    0   
$EndComp
Text GLabel 5000 2550 0    50   Input ~ 0
RAM_D4
Text GLabel 5000 2650 0    50   Input ~ 0
RAM_D5
Text GLabel 5000 2750 0    50   Input ~ 0
RAM_D6
Text GLabel 5000 2850 0    50   Input ~ 0
RAM_D7
Text GLabel 5000 2950 0    50   Input ~ 0
RAM_WE
Text GLabel 5000 3050 0    50   Input ~ 0
RAM_A17
Text GLabel 5000 3150 0    50   Input ~ 0
RAM_A16
Text GLabel 5000 3250 0    50   Input ~ 0
RAM_A15
Text GLabel 5000 3350 0    50   Input ~ 0
RAM_A14
Text GLabel 5000 3450 0    50   Input ~ 0
RAM_A13
Text GLabel 6200 3450 2    50   Input ~ 0
RAM_A18
Text GLabel 6200 1350 2    50   Input ~ 0
RAM_A6
Text GLabel 6200 1450 2    50   Input ~ 0
RAM_A7
Text GLabel 6200 1550 2    50   Input ~ 0
RAM_A8
Text GLabel 6200 1650 2    50   Input ~ 0
RAM_OE
Text GLabel 6200 1750 2    50   Input ~ 0
RAM_UB
Text GLabel 6200 1850 2    50   Input ~ 0
RAM_LB
Text GLabel 6200 1950 2    50   Input ~ 0
RAM_D15
Text GLabel 6200 2050 2    50   Input ~ 0
RAM_D14
Text GLabel 6200 2150 2    50   Input ~ 0
RAM_D13
Text GLabel 6200 2250 2    50   Input ~ 0
RAM_D12
Text GLabel 6200 2550 2    50   Input ~ 0
RAM_D11
Text GLabel 6200 2650 2    50   Input ~ 0
RAM_D10
Text GLabel 6200 2750 2    50   Input ~ 0
RAM_D9
Text GLabel 6200 2850 2    50   Input ~ 0
RAM_D8
Text GLabel 6200 3350 2    50   Input ~ 0
RAM_A12
Text GLabel 6200 3250 2    50   Input ~ 0
RAM_A11
Text GLabel 6200 3150 2    50   Input ~ 0
RAM_A10
Text GLabel 6200 3050 2    50   Input ~ 0
RAM_A9
Text GLabel 6200 2950 2    50   Input ~ 0
RAM_A19
$Comp
L power:GND #PWR088
U 1 1 6235019A
P 6200 2350
F 0 "#PWR088" H 6200 2100 50  0001 C CNN
F 1 "GND" V 6200 2150 50  0000 C CNN
F 2 "" H 6200 2350 50  0001 C CNN
F 3 "" H 6200 2350 50  0001 C CNN
	1    6200 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR089
U 1 1 6235089F
P 6200 2450
F 0 "#PWR089" H 6200 2300 50  0001 C CNN
F 1 "+3.3V" V 6200 2550 50  0000 L CNN
F 2 "" H 6200 2450 50  0001 C CNN
F 3 "" H 6200 2450 50  0001 C CNN
	1    6200 2450
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:IS62WV51216EBLL-45TLI U5
U 1 1 6243FDA1
P 5000 3900
F 0 "U5" H 5600 4165 50  0000 C CNN
F 1 "IS62WV51216EBLL-45TLI" H 5600 4074 50  0000 C CNN
F 2 "SOP80P1176X120-44N" H 6050 4000 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/is62wv51216ebll-45tli/integrated-silicon-solution-inc" H 6050 3900 50  0001 L CNN
F 4 "SRAM Chip Async Single 2.5V/3.3V 8M-bit 512K x 16 45ns 44-Pin TSOP-II" H 6050 3800 50  0001 L CNN "Description"
F 5 "1.2" H 6050 3700 50  0001 L CNN "Height"
F 6 "870-62WV512EBLL45TLI" H 6050 3600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/ProductDetail/ISSI/IS62WV51216EBLL-45TLI?qs=uCnMRCNamml2HPqzTYU7sw%3D%3D" H 6050 3500 50  0001 L CNN "Mouser Price/Stock"
F 8 "Integrated Silicon Solution Inc." H 6050 3400 50  0001 L CNN "Manufacturer_Name"
F 9 "IS62WV51216EBLL-45TLI" H 6050 3300 50  0001 L CNN "Manufacturer_Part_Number"
	1    5000 3900
	1    0    0    -1  
$EndComp
Text GLabel 5000 3900 0    50   Input ~ 0
RAM_A5
Text GLabel 5000 4000 0    50   Input ~ 0
RAM_A4
Text GLabel 5000 4100 0    50   Input ~ 0
RAM_A3
Text GLabel 5000 4200 0    50   Input ~ 0
RAM_A2
Text GLabel 5000 4300 0    50   Input ~ 0
RAM_A1
Text GLabel 5000 4400 0    50   Input ~ 0
RAM_SEL2
Text GLabel 5000 4500 0    50   Input ~ 0
RAM_D0
Text GLabel 5000 4600 0    50   Input ~ 0
RAM_D1
Text GLabel 5000 4700 0    50   Input ~ 0
RAM_D2
Text GLabel 5000 4800 0    50   Input ~ 0
RAM_D3
$Comp
L power:+3.3V #PWR086
U 1 1 6243FDB1
P 5000 4900
F 0 "#PWR086" H 5000 4750 50  0001 C CNN
F 1 "+3.3V" V 5000 5000 50  0000 L CNN
F 2 "" H 5000 4900 50  0001 C CNN
F 3 "" H 5000 4900 50  0001 C CNN
	1    5000 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR087
U 1 1 6243FDB7
P 5000 5000
F 0 "#PWR087" H 5000 4750 50  0001 C CNN
F 1 "GND" V 5000 4800 50  0000 C CNN
F 2 "" H 5000 5000 50  0001 C CNN
F 3 "" H 5000 5000 50  0001 C CNN
	1    5000 5000
	0    1    1    0   
$EndComp
Text GLabel 5000 5100 0    50   Input ~ 0
RAM_D4
Text GLabel 5000 5200 0    50   Input ~ 0
RAM_D5
Text GLabel 5000 5300 0    50   Input ~ 0
RAM_D6
Text GLabel 5000 5400 0    50   Input ~ 0
RAM_D7
Text GLabel 5000 5500 0    50   Input ~ 0
RAM_WE
Text GLabel 5000 5600 0    50   Input ~ 0
RAM_A17
Text GLabel 5000 5700 0    50   Input ~ 0
RAM_A16
Text GLabel 5000 5800 0    50   Input ~ 0
RAM_A15
Text GLabel 5000 5900 0    50   Input ~ 0
RAM_A14
Text GLabel 5000 6000 0    50   Input ~ 0
RAM_A13
Text GLabel 6200 6000 2    50   Input ~ 0
RAM_A18
Text GLabel 6200 3900 2    50   Input ~ 0
RAM_A6
Text GLabel 6200 4000 2    50   Input ~ 0
RAM_A7
Text GLabel 6200 4100 2    50   Input ~ 0
RAM_A8
Text GLabel 6200 4200 2    50   Input ~ 0
RAM_OE
Text GLabel 6200 4300 2    50   Input ~ 0
RAM_UB
Text GLabel 6200 4400 2    50   Input ~ 0
RAM_LB
Text GLabel 6200 4500 2    50   Input ~ 0
RAM_D15
Text GLabel 6200 4600 2    50   Input ~ 0
RAM_D14
Text GLabel 6200 4700 2    50   Input ~ 0
RAM_D13
Text GLabel 6200 4800 2    50   Input ~ 0
RAM_D12
Text GLabel 6200 5100 2    50   Input ~ 0
RAM_D11
Text GLabel 6200 5200 2    50   Input ~ 0
RAM_D10
Text GLabel 6200 5300 2    50   Input ~ 0
RAM_D9
Text GLabel 6200 5400 2    50   Input ~ 0
RAM_D8
Text GLabel 6200 5900 2    50   Input ~ 0
RAM_A12
Text GLabel 6200 5800 2    50   Input ~ 0
RAM_A11
Text GLabel 6200 5700 2    50   Input ~ 0
RAM_A10
Text GLabel 6200 5600 2    50   Input ~ 0
RAM_A9
Text GLabel 6200 5500 2    50   Input ~ 0
RAM_A19
$Comp
L power:GND #PWR090
U 1 1 6243FDDB
P 6200 4900
F 0 "#PWR090" H 6200 4650 50  0001 C CNN
F 1 "GND" V 6200 4700 50  0000 C CNN
F 2 "" H 6200 4900 50  0001 C CNN
F 3 "" H 6200 4900 50  0001 C CNN
	1    6200 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR091
U 1 1 6243FDE1
P 6200 5000
F 0 "#PWR091" H 6200 4850 50  0001 C CNN
F 1 "+3.3V" V 6200 5100 50  0000 L CNN
F 2 "" H 6200 5000 50  0001 C CNN
F 3 "" H 6200 5000 50  0001 C CNN
	1    6200 5000
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:SN74CBTD16210DGGR IC4
U 1 1 62546F66
P 10150 1350
F 0 "IC4" H 10750 1600 50  0000 L CNN
F 1 "SN74CBTD16210DGGR" H 10350 1500 50  0000 L CNN
F 2 "SOP50P810X120-48N" H 11200 1450 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/SFDatasheet-6/sf-000126755.pdf" H 11200 1350 50  0001 L CNN
F 4 "SN74CBTD16210DGGR, Bus Switch 74CBT, 10 x 1:1, 4.5  5.5 V 48-Pin TSSOP" H 11200 1250 50  0001 L CNN "Description"
F 5 "1.2" H 11200 1150 50  0001 L CNN "Height"
F 6 "595-74CBTD16210DGGR" H 11200 1050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/SN74CBTD16210DGGR?qs=xJkDX%2FqrskMfGfKwTFyOqQ%3D%3D" H 11200 950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 11200 850 50  0001 L CNN "Manufacturer_Name"
F 9 "SN74CBTD16210DGGR" H 11200 750 50  0001 L CNN "Manufacturer_Part_Number"
	1    10150 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 62559F49
P 10150 2050
F 0 "#PWR0100" H 10150 1800 50  0001 C CNN
F 1 "GND" V 10155 1922 50  0000 R CNN
F 2 "" H 10150 2050 50  0001 C CNN
F 3 "" H 10150 2050 50  0001 C CNN
	1    10150 2050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6255A8B8
P 11350 2050
F 0 "#PWR0110" H 11350 1800 50  0001 C CNN
F 1 "GND" V 11355 1922 50  0000 R CNN
F 2 "" H 11350 2050 50  0001 C CNN
F 3 "" H 11350 2050 50  0001 C CNN
	1    11350 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6255B0C4
P 11350 2950
F 0 "#PWR0111" H 11350 2700 50  0001 C CNN
F 1 "GND" V 11355 2822 50  0000 R CNN
F 2 "" H 11350 2950 50  0001 C CNN
F 3 "" H 11350 2950 50  0001 C CNN
	1    11350 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6255B94E
P 10150 2950
F 0 "#PWR0102" H 10150 2700 50  0001 C CNN
F 1 "GND" V 10155 2822 50  0000 R CNN
F 2 "" H 10150 2950 50  0001 C CNN
F 3 "" H 10150 2950 50  0001 C CNN
	1    10150 2950
	0    1    1    0   
$EndComp
NoConn ~ 10150 1350
$Comp
L power:GND #PWR0109
U 1 1 6256176D
P 11350 1400
F 0 "#PWR0109" H 11350 1150 50  0001 C CNN
F 1 "GND" V 11355 1272 50  0000 R CNN
F 2 "" H 11350 1400 50  0001 C CNN
F 3 "" H 11350 1400 50  0001 C CNN
	1    11350 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11350 1350 11350 1400
Wire Wire Line
	11350 1450 11350 1400
Connection ~ 11350 1400
Text GLabel 10150 1450 0    50   Input ~ 0
D4
Text GLabel 11350 1550 2    50   Input ~ 0
CPU_D4
Text GLabel 10150 1550 0    50   Input ~ 0
CPU_D5
Text GLabel 11350 1650 2    50   Input ~ 0
D5
Text GLabel 10150 1650 0    50   Input ~ 0
D3
Text GLabel 11350 1750 2    50   Input ~ 0
CPU_D3
Text GLabel 10150 1750 0    50   Input ~ 0
CPU_D6
Text GLabel 11350 1850 2    50   Input ~ 0
D6
$Comp
L power:+5V #PWR0101
U 1 1 62569317
P 10150 2750
F 0 "#PWR0101" H 10150 2600 50  0001 C CNN
F 1 "+5V" V 10150 2900 50  0000 L CNN
F 2 "" H 10150 2750 50  0001 C CNN
F 3 "" H 10150 2750 50  0001 C CNN
	1    10150 2750
	0    -1   -1   0   
$EndComp
Text GLabel 10150 1850 0    50   Input ~ 0
D2
Text GLabel 10150 1950 0    50   Input ~ 0
CPU_D7
Text GLabel 11350 1950 2    50   Input ~ 0
CPU_D2
Text GLabel 11350 2150 2    50   Input ~ 0
D7
Text GLabel 10150 2150 0    50   Input ~ 0
D1
Text GLabel 11350 2250 2    50   Input ~ 0
CPU_D1
Text GLabel 10150 2250 0    50   Input ~ 0
CPU_D8
Text GLabel 11350 2350 2    50   Input ~ 0
D8
Text GLabel 10150 2350 0    50   Input ~ 0
D0
Text GLabel 11350 2450 2    50   Input ~ 0
CPU_D0
Text GLabel 10150 2450 0    50   Input ~ 0
CPU_D9
Text GLabel 11350 2550 2    50   Input ~ 0
D9
Text GLabel 10150 2550 0    50   Input ~ 0
AS
Text GLabel 11350 2650 2    50   Input ~ 0
CPU_AS
Text GLabel 10150 2650 0    50   Input ~ 0
CPU_D10
Text GLabel 11350 2750 2    50   Input ~ 0
D10
Text GLabel 10150 2850 0    50   Input ~ 0
UDS
Text GLabel 11350 2850 2    50   Input ~ 0
CPU_UDS
Text GLabel 10150 3050 0    50   Input ~ 0
CPU_D11
Text GLabel 11350 3050 2    50   Input ~ 0
D11
Text GLabel 10150 3150 0    50   Input ~ 0
LDS
Text GLabel 11350 3150 2    50   Input ~ 0
CPU_LDS
Text GLabel 10150 3250 0    50   Input ~ 0
CPU_D12
Text GLabel 10150 3350 0    50   Input ~ 0
RW
Text GLabel 10150 3450 0    50   Input ~ 0
CPU_D13
Text GLabel 10150 3550 0    50   Input ~ 0
DTACK
Text GLabel 10150 3650 0    50   Input ~ 0
CPU_D14
Text GLabel 11350 3250 2    50   Input ~ 0
D12
Text GLabel 11350 3350 2    50   Input ~ 0
CPU_RW
Text GLabel 11350 3450 2    50   Input ~ 0
D13
Text GLabel 11350 3550 2    50   Input ~ 0
CPU_DTACK
Text GLabel 11350 3650 2    50   Input ~ 0
D14
$Comp
L SamacSys_Parts:SN74CBTD16210DGGR IC5
U 1 1 62584A6E
P 10150 4100
F 0 "IC5" H 10750 4365 50  0000 C CNN
F 1 "SN74CBTD16210DGGR" H 10750 4274 50  0000 C CNN
F 2 "SOP50P810X120-48N" H 11200 4200 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/SFDatasheet-6/sf-000126755.pdf" H 11200 4100 50  0001 L CNN
F 4 "SN74CBTD16210DGGR, Bus Switch 74CBT, 10 x 1:1, 4.5  5.5 V 48-Pin TSSOP" H 11200 4000 50  0001 L CNN "Description"
F 5 "1.2" H 11200 3900 50  0001 L CNN "Height"
F 6 "595-74CBTD16210DGGR" H 11200 3800 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/SN74CBTD16210DGGR?qs=xJkDX%2FqrskMfGfKwTFyOqQ%3D%3D" H 11200 3700 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 11200 3600 50  0001 L CNN "Manufacturer_Name"
F 9 "SN74CBTD16210DGGR" H 11200 3500 50  0001 L CNN "Manufacturer_Part_Number"
	1    10150 4100
	1    0    0    -1  
$EndComp
Text Notes 10050 900  0    79   ~ 16
5V to 3.3V Bus Switches
NoConn ~ 10150 4100
NoConn ~ 10150 5100
NoConn ~ 10150 5900
NoConn ~ 10150 6100
NoConn ~ 10150 5600
NoConn ~ 11350 4300
NoConn ~ 11350 4500
NoConn ~ 11350 4700
NoConn ~ 11350 5200
NoConn ~ 11350 5600
NoConn ~ 11350 5900
NoConn ~ 11350 6100
NoConn ~ 11350 6300
Text GLabel 10150 4200 0    50   Input ~ 0
BG
Text GLabel 10150 4300 0    50   Input ~ 0
CPU_D15
Text GLabel 10150 4400 0    50   Input ~ 0
BGACK
Text GLabel 10150 4500 0    50   Input ~ 0
CPU_A23
Text GLabel 10150 4600 0    50   Input ~ 0
BR
Text GLabel 10150 4700 0    50   Input ~ 0
CPU_A22
$Comp
L power:GND #PWR0103
U 1 1 625C1749
P 10150 4800
F 0 "#PWR0103" H 10150 4550 50  0001 C CNN
F 1 "GND" V 10155 4672 50  0000 R CNN
F 2 "" H 10150 4800 50  0001 C CNN
F 3 "" H 10150 4800 50  0001 C CNN
	1    10150 4800
	0    1    1    0   
$EndComp
Text GLabel 10150 4900 0    50   Input ~ 0
CLK
Text GLabel 10150 5000 0    50   Input ~ 0
CPU_A21
Text GLabel 10150 5200 0    50   Input ~ 0
CPU_A20
Text GLabel 10150 5300 0    50   Input ~ 0
RESET
Text GLabel 10150 5400 0    50   Input ~ 0
CPU_A19
$Comp
L power:+5V #PWR0104
U 1 1 625C3023
P 10150 5500
F 0 "#PWR0104" H 10150 5350 50  0001 C CNN
F 1 "+5V" V 10150 5650 50  0000 L CNN
F 2 "" H 10150 5500 50  0001 C CNN
F 3 "" H 10150 5500 50  0001 C CNN
	1    10150 5500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 625C3807
P 10150 5700
F 0 "#PWR0105" H 10150 5450 50  0001 C CNN
F 1 "GND" V 10155 5572 50  0000 R CNN
F 2 "" H 10150 5700 50  0001 C CNN
F 3 "" H 10150 5700 50  0001 C CNN
	1    10150 5700
	0    1    1    0   
$EndComp
Text GLabel 10150 5800 0    50   Input ~ 0
CPU_A18
Text GLabel 10150 6000 0    50   Input ~ 0
CPU_A17
Text GLabel 10150 6200 0    50   Input ~ 0
CPU_A16
Text GLabel 10150 6300 0    50   Input ~ 0
BERR
Text GLabel 10150 6400 0    50   Input ~ 0
CPU_A15
Text GLabel 1400 4350 0    50   Input ~ 0
BERR
Wire Wire Line
	1400 4350 1600 4350
$Comp
L power:GND #PWR0112
U 1 1 625CAF27
P 11350 4150
F 0 "#PWR0112" H 11350 3900 50  0001 C CNN
F 1 "GND" V 11355 4022 50  0000 R CNN
F 2 "" H 11350 4150 50  0001 C CNN
F 3 "" H 11350 4150 50  0001 C CNN
	1    11350 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11350 4100 11350 4150
Wire Wire Line
	11350 4150 11350 4200
Connection ~ 11350 4150
$Comp
L power:GND #PWR0113
U 1 1 625D1553
P 11350 4800
F 0 "#PWR0113" H 11350 4550 50  0001 C CNN
F 1 "GND" V 11355 4672 50  0000 R CNN
F 2 "" H 11350 4800 50  0001 C CNN
F 3 "" H 11350 4800 50  0001 C CNN
	1    11350 4800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 625D1F5F
P 11350 5700
F 0 "#PWR0114" H 11350 5450 50  0001 C CNN
F 1 "GND" V 11355 5572 50  0000 R CNN
F 2 "" H 11350 5700 50  0001 C CNN
F 3 "" H 11350 5700 50  0001 C CNN
	1    11350 5700
	0    -1   -1   0   
$EndComp
Text GLabel 11350 4400 2    50   Input ~ 0
D15
Text GLabel 11350 4600 2    50   Input ~ 0
A23
Text GLabel 11350 4900 2    50   Input ~ 0
A22
Text GLabel 11350 5000 2    50   Input ~ 0
CPU_CLK
Text GLabel 11350 5100 2    50   Input ~ 0
A21
Text GLabel 11350 5300 2    50   Input ~ 0
A20
Text GLabel 11350 5400 2    50   Input ~ 0
CPU_RESET
Text GLabel 11350 5500 2    50   Input ~ 0
A19
Text GLabel 11350 5800 2    50   Input ~ 0
A18
Text GLabel 11350 6000 2    50   Input ~ 0
A17
Text GLabel 11350 6200 2    50   Input ~ 0
A16
Text GLabel 11350 6400 2    50   Input ~ 0
A15
$Comp
L SamacSys_Parts:SN74CBTD16210DGGR IC6
U 1 1 625D56F4
P 10150 6850
F 0 "IC6" H 10750 7115 50  0000 C CNN
F 1 "SN74CBTD16210DGGR" H 10750 7024 50  0000 C CNN
F 2 "SOP50P810X120-48N" H 11200 6950 50  0001 L CNN
F 3 "https://datasheet.datasheetarchive.com/originals/distributors/SFDatasheet-6/sf-000126755.pdf" H 11200 6850 50  0001 L CNN
F 4 "SN74CBTD16210DGGR, Bus Switch 74CBT, 10 x 1:1, 4.5  5.5 V 48-Pin TSSOP" H 11200 6750 50  0001 L CNN "Description"
F 5 "1.2" H 11200 6650 50  0001 L CNN "Height"
F 6 "595-74CBTD16210DGGR" H 11200 6550 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/SN74CBTD16210DGGR?qs=xJkDX%2FqrskMfGfKwTFyOqQ%3D%3D" H 11200 6450 50  0001 L CNN "Mouser Price/Stock"
F 8 "Texas Instruments" H 11200 6350 50  0001 L CNN "Manufacturer_Name"
F 9 "SN74CBTD16210DGGR" H 11200 6250 50  0001 L CNN "Manufacturer_Part_Number"
	1    10150 6850
	1    0    0    -1  
$EndComp
NoConn ~ 10150 6850
NoConn ~ 11350 7750
NoConn ~ 11350 7950
NoConn ~ 11350 8150
$Comp
L power:GND #PWR0115
U 1 1 625E2F19
P 11350 6900
F 0 "#PWR0115" H 11350 6650 50  0001 C CNN
F 1 "GND" V 11355 6772 50  0000 R CNN
F 2 "" H 11350 6900 50  0001 C CNN
F 3 "" H 11350 6900 50  0001 C CNN
	1    11350 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11350 6850 11350 6900
Wire Wire Line
	11350 6950 11350 6900
Connection ~ 11350 6900
$Comp
L power:GND #PWR0116
U 1 1 625E900A
P 11350 7550
F 0 "#PWR0116" H 11350 7300 50  0001 C CNN
F 1 "GND" V 11355 7422 50  0000 R CNN
F 2 "" H 11350 7550 50  0001 C CNN
F 3 "" H 11350 7550 50  0001 C CNN
	1    11350 7550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 625E9697
P 11350 8450
F 0 "#PWR0117" H 11350 8200 50  0001 C CNN
F 1 "GND" V 11355 8322 50  0000 R CNN
F 2 "" H 11350 8450 50  0001 C CNN
F 3 "" H 11350 8450 50  0001 C CNN
	1    11350 8450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 625E9C05
P 10150 8450
F 0 "#PWR0108" H 10150 8200 50  0001 C CNN
F 1 "GND" V 10155 8322 50  0000 R CNN
F 2 "" H 10150 8450 50  0001 C CNN
F 3 "" H 10150 8450 50  0001 C CNN
	1    10150 8450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 625EA6F2
P 10150 7550
F 0 "#PWR0106" H 10150 7300 50  0001 C CNN
F 1 "GND" V 10155 7422 50  0000 R CNN
F 2 "" H 10150 7550 50  0001 C CNN
F 3 "" H 10150 7550 50  0001 C CNN
	1    10150 7550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 625EAC4C
P 10150 8250
F 0 "#PWR0107" H 10150 8100 50  0001 C CNN
F 1 "+5V" V 10150 8400 50  0000 L CNN
F 2 "" H 10150 8250 50  0001 C CNN
F 3 "" H 10150 8250 50  0001 C CNN
	1    10150 8250
	0    -1   -1   0   
$EndComp
Text GLabel 10150 6950 0    50   Input ~ 0
IPL2
Text GLabel 10150 7050 0    50   Input ~ 0
CPU_A14
Text GLabel 10150 7150 0    50   Input ~ 0
IPL1
Text GLabel 10150 7250 0    50   Input ~ 0
CPU_A13
Text GLabel 10150 7350 0    50   Input ~ 0
IPL0
Text GLabel 10150 7450 0    50   Input ~ 0
CPU_A12
Text GLabel 10150 7650 0    50   Input ~ 0
FC2
Text GLabel 10150 7750 0    50   Input ~ 0
CPU_A11
Text GLabel 10150 7850 0    50   Input ~ 0
FC1
Text GLabel 10150 7950 0    50   Input ~ 0
CPU_A10
Text GLabel 10150 8050 0    50   Input ~ 0
FC0
Text GLabel 10150 8150 0    50   Input ~ 0
CPU_A9
Text GLabel 10150 8350 0    50   Input ~ 0
A1
Text GLabel 10150 8550 0    50   Input ~ 0
CPU_A8
Text GLabel 10150 8650 0    50   Input ~ 0
A2
Text GLabel 10150 8750 0    50   Input ~ 0
CPU_A7
Text GLabel 10150 8850 0    50   Input ~ 0
A3
Text GLabel 10150 8950 0    50   Input ~ 0
CPU_A6
Text GLabel 10150 9050 0    50   Input ~ 0
A4
Text GLabel 10150 9150 0    50   Input ~ 0
CPU_A5
Text GLabel 11350 7050 2    50   Input ~ 0
CPU_IPL2
Text GLabel 11350 7150 2    50   Input ~ 0
A14
Text GLabel 11350 7250 2    50   Input ~ 0
CPU_IPL1
Text GLabel 11350 7350 2    50   Input ~ 0
A13
Text GLabel 11350 7450 2    50   Input ~ 0
CPU_IPL0
Text GLabel 11350 7650 2    50   Input ~ 0
A12
Text GLabel 11350 7850 2    50   Input ~ 0
A11
Text GLabel 11350 8050 2    50   Input ~ 0
A10
Text GLabel 11350 8250 2    50   Input ~ 0
A9
Text GLabel 11350 8350 2    50   Input ~ 0
CPU_A1
Text GLabel 11350 8550 2    50   Input ~ 0
A8
Text GLabel 11350 8650 2    50   Input ~ 0
CPU_A2
Text GLabel 11350 8750 2    50   Input ~ 0
A7
Text GLabel 11350 8850 2    50   Input ~ 0
CPU_A3
Text GLabel 11350 8950 2    50   Input ~ 0
A6
Text GLabel 11350 9050 2    50   Input ~ 0
CPU_A4
Text GLabel 11350 9150 2    50   Input ~ 0
A5
$Comp
L Device:C_Small C22
U 1 1 6261105A
P 2400 7350
F 0 "C22" H 2492 7396 50  0000 L CNN
F 1 "100nF" H 2492 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 7350 50  0001 C CNN
F 3 "~" H 2400 7350 50  0001 C CNN
	1    2400 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C23
U 1 1 62611586
P 2900 7350
F 0 "C23" H 2992 7396 50  0000 L CNN
F 1 "10nF" H 2992 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2900 7350 50  0001 C CNN
F 3 "~" H 2900 7350 50  0001 C CNN
	1    2900 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C24
U 1 1 62611B49
P 3400 7350
F 0 "C24" H 3492 7396 50  0000 L CNN
F 1 "10nF" H 3492 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3400 7350 50  0001 C CNN
F 3 "~" H 3400 7350 50  0001 C CNN
	1    3400 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 7600 3400 7450
Wire Wire Line
	2900 7450 2900 7600
Connection ~ 2900 7600
Wire Wire Line
	2900 7600 3400 7600
Wire Wire Line
	2400 7450 2400 7600
Wire Wire Line
	2400 7600 2900 7600
Wire Wire Line
	3400 7100 3400 7250
Wire Wire Line
	2900 7100 2900 7250
Connection ~ 2900 7100
Wire Wire Line
	2900 7100 3400 7100
Wire Wire Line
	2400 7100 2400 7250
Wire Wire Line
	2400 7100 2900 7100
Connection ~ 2400 7100
Connection ~ 2400 7600
Wire Wire Line
	1900 7100 2400 7100
Connection ~ 1900 7100
Wire Wire Line
	1900 7100 1900 7250
Wire Wire Line
	1700 7100 1900 7100
Wire Wire Line
	1900 7600 2400 7600
Connection ~ 1900 7600
Wire Wire Line
	1900 7450 1900 7600
Wire Wire Line
	1700 7600 1900 7600
$Comp
L power:+5V #PWR078
U 1 1 62612DBA
P 1700 7100
F 0 "#PWR078" H 1700 6950 50  0001 C CNN
F 1 "+5V" H 1715 7273 50  0000 C CNN
F 2 "" H 1700 7100 50  0001 C CNN
F 3 "" H 1700 7100 50  0001 C CNN
	1    1700 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR079
U 1 1 62612260
P 1700 7600
F 0 "#PWR079" H 1700 7350 50  0001 C CNN
F 1 "GND" H 1705 7427 50  0000 C CNN
F 2 "" H 1700 7600 50  0001 C CNN
F 3 "" H 1700 7600 50  0001 C CNN
	1    1700 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 6261068C
P 1900 7350
F 0 "C21" H 1992 7396 50  0000 L CNN
F 1 "100nF" H 1992 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 7350 50  0001 C CNN
F 3 "~" H 1900 7350 50  0001 C CNN
	1    1900 7350
	1    0    0    -1  
$EndComp
Text Notes 2150 6800 0    79   ~ 16
CPU Decoupling
$Comp
L Device:C_Small C26
U 1 1 626772D5
P 5650 7350
F 0 "C26" H 5742 7396 50  0000 L CNN
F 1 "100nF" H 5742 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5650 7350 50  0001 C CNN
F 3 "~" H 5650 7350 50  0001 C CNN
	1    5650 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C27
U 1 1 626772DB
P 6150 7350
F 0 "C27" H 6242 7396 50  0000 L CNN
F 1 "100nF" H 6242 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6150 7350 50  0001 C CNN
F 3 "~" H 6150 7350 50  0001 C CNN
	1    6150 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C28
U 1 1 626772E1
P 6650 7350
F 0 "C28" H 6742 7396 50  0000 L CNN
F 1 "100nF" H 6742 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6650 7350 50  0001 C CNN
F 3 "~" H 6650 7350 50  0001 C CNN
	1    6650 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 7600 6650 7450
Wire Wire Line
	6150 7450 6150 7600
Connection ~ 6150 7600
Wire Wire Line
	6150 7600 6650 7600
Wire Wire Line
	5650 7450 5650 7600
Wire Wire Line
	5650 7600 6150 7600
Wire Wire Line
	6650 7100 6650 7250
Wire Wire Line
	6150 7100 6150 7250
Connection ~ 6150 7100
Wire Wire Line
	6150 7100 6650 7100
Wire Wire Line
	5650 7100 5650 7250
Wire Wire Line
	5650 7100 6150 7100
Connection ~ 5650 7100
Connection ~ 5650 7600
Wire Wire Line
	5150 7100 5650 7100
Connection ~ 5150 7100
Wire Wire Line
	5150 7100 5150 7250
Wire Wire Line
	4950 7100 5150 7100
Wire Wire Line
	5150 7600 5650 7600
Connection ~ 5150 7600
Wire Wire Line
	5150 7450 5150 7600
Wire Wire Line
	4950 7600 5150 7600
$Comp
L power:GND #PWR083
U 1 1 62677303
P 4950 7600
F 0 "#PWR083" H 4950 7350 50  0001 C CNN
F 1 "GND" H 4955 7427 50  0000 C CNN
F 2 "" H 4950 7600 50  0001 C CNN
F 3 "" H 4950 7600 50  0001 C CNN
	1    4950 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C25
U 1 1 62677309
P 5150 7350
F 0 "C25" H 5242 7396 50  0000 L CNN
F 1 "100nF" H 5242 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 7350 50  0001 C CNN
F 3 "~" H 5150 7350 50  0001 C CNN
	1    5150 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR082
U 1 1 6267EF95
P 4950 7100
F 0 "#PWR082" H 4950 6950 50  0001 C CNN
F 1 "+3.3V" H 4965 7273 50  0000 C CNN
F 2 "" H 4950 7100 50  0001 C CNN
F 3 "" H 4950 7100 50  0001 C CNN
	1    4950 7100
	1    0    0    -1  
$EndComp
Text Notes 6300 6800 0    79   ~ 16
RAM Decoupling
Wire Notes Line
	11900 750  11900 9400
Wire Notes Line
	11900 9400 9550 9400
Wire Notes Line
	9550 9400 9550 750 
Wire Notes Line
	9550 750  11900 750 
Wire Notes Line
	6800 750  4450 750 
Wire Notes Line
	4450 750  4450 7850
Wire Notes Line
	4450 7850 6800 7850
Wire Notes Line
	4150 750  4150 7850
Wire Notes Line
	4150 7850 800  7850
Wire Notes Line
	800  7850 800  750 
Wire Notes Line
	800  750  4150 750 
$Comp
L SamacSys_Parts:IS62WV51216EBLL-45TLI U4
U 1 1 623E4AAC
P 7450 1350
F 0 "U4" H 8050 1615 50  0000 C CNN
F 1 "IS62WV51216EBLL-45TLI" H 8050 1524 50  0000 C CNN
F 2 "SOP80P1176X120-44N" H 8500 1450 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/is62wv51216ebll-45tli/integrated-silicon-solution-inc" H 8500 1350 50  0001 L CNN
F 4 "SRAM Chip Async Single 2.5V/3.3V 8M-bit 512K x 16 45ns 44-Pin TSOP-II" H 8500 1250 50  0001 L CNN "Description"
F 5 "1.2" H 8500 1150 50  0001 L CNN "Height"
F 6 "870-62WV512EBLL45TLI" H 8500 1050 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/ProductDetail/ISSI/IS62WV51216EBLL-45TLI?qs=uCnMRCNamml2HPqzTYU7sw%3D%3D" H 8500 950 50  0001 L CNN "Mouser Price/Stock"
F 8 "Integrated Silicon Solution Inc." H 8500 850 50  0001 L CNN "Manufacturer_Name"
F 9 "IS62WV51216EBLL-45TLI" H 8500 750 50  0001 L CNN "Manufacturer_Part_Number"
	1    7450 1350
	1    0    0    -1  
$EndComp
Text GLabel 7450 1350 0    50   Input ~ 0
RAM_A5
Text GLabel 7450 1450 0    50   Input ~ 0
RAM_A4
Text GLabel 7450 1550 0    50   Input ~ 0
RAM_A3
Text GLabel 7450 1650 0    50   Input ~ 0
RAM_A2
Text GLabel 7450 1750 0    50   Input ~ 0
RAM_A1
Text GLabel 7450 1850 0    50   Input ~ 0
RAM_SEL1
Text GLabel 7450 1950 0    50   Input ~ 0
RAM_D0
Text GLabel 7450 2050 0    50   Input ~ 0
RAM_D1
Text GLabel 7450 2150 0    50   Input ~ 0
RAM_D2
Text GLabel 7450 2250 0    50   Input ~ 0
RAM_D3
$Comp
L power:+3.3V #PWR092
U 1 1 623E4ABD
P 7450 2350
F 0 "#PWR092" H 7450 2200 50  0001 C CNN
F 1 "+3.3V" V 7450 2450 50  0000 L CNN
F 2 "" H 7450 2350 50  0001 C CNN
F 3 "" H 7450 2350 50  0001 C CNN
	1    7450 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR093
U 1 1 623E4AC3
P 7450 2450
F 0 "#PWR093" H 7450 2200 50  0001 C CNN
F 1 "GND" V 7450 2250 50  0000 C CNN
F 2 "" H 7450 2450 50  0001 C CNN
F 3 "" H 7450 2450 50  0001 C CNN
	1    7450 2450
	0    1    1    0   
$EndComp
Text GLabel 7450 2550 0    50   Input ~ 0
RAM_D4
Text GLabel 7450 2650 0    50   Input ~ 0
RAM_D5
Text GLabel 7450 2750 0    50   Input ~ 0
RAM_D6
Text GLabel 7450 2850 0    50   Input ~ 0
RAM_D7
Text GLabel 7450 2950 0    50   Input ~ 0
RAM_WE
Text GLabel 7450 3050 0    50   Input ~ 0
RAM_A17
Text GLabel 7450 3150 0    50   Input ~ 0
RAM_A16
Text GLabel 7450 3250 0    50   Input ~ 0
RAM_A15
Text GLabel 7450 3350 0    50   Input ~ 0
RAM_A14
Text GLabel 7450 3450 0    50   Input ~ 0
RAM_A13
Text GLabel 8650 3450 2    50   Input ~ 0
RAM_A18
Text GLabel 8650 1350 2    50   Input ~ 0
RAM_A6
Text GLabel 8650 1450 2    50   Input ~ 0
RAM_A7
Text GLabel 8650 1550 2    50   Input ~ 0
RAM_A8
Text GLabel 8650 1650 2    50   Input ~ 0
RAM_OE
Text GLabel 8650 1750 2    50   Input ~ 0
RAM_UB
Text GLabel 8650 1850 2    50   Input ~ 0
RAM_LB
Text GLabel 8650 1950 2    50   Input ~ 0
RAM_D15
Text GLabel 8650 2050 2    50   Input ~ 0
RAM_D14
Text GLabel 8650 2150 2    50   Input ~ 0
RAM_D13
Text GLabel 8650 2250 2    50   Input ~ 0
RAM_D12
Text GLabel 8650 2550 2    50   Input ~ 0
RAM_D11
Text GLabel 8650 2650 2    50   Input ~ 0
RAM_D10
Text GLabel 8650 2750 2    50   Input ~ 0
RAM_D9
Text GLabel 8650 2850 2    50   Input ~ 0
RAM_D8
Text GLabel 8650 3350 2    50   Input ~ 0
RAM_A12
Text GLabel 8650 3250 2    50   Input ~ 0
RAM_A11
Text GLabel 8650 3150 2    50   Input ~ 0
RAM_A10
Text GLabel 8650 3050 2    50   Input ~ 0
RAM_A9
Text GLabel 8650 2950 2    50   Input ~ 0
RAM_A19
$Comp
L power:GND #PWR096
U 1 1 623E4AE7
P 8650 2350
F 0 "#PWR096" H 8650 2100 50  0001 C CNN
F 1 "GND" V 8650 2150 50  0000 C CNN
F 2 "" H 8650 2350 50  0001 C CNN
F 3 "" H 8650 2350 50  0001 C CNN
	1    8650 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR097
U 1 1 623E4AED
P 8650 2450
F 0 "#PWR097" H 8650 2300 50  0001 C CNN
F 1 "+3.3V" V 8650 2550 50  0000 L CNN
F 2 "" H 8650 2450 50  0001 C CNN
F 3 "" H 8650 2450 50  0001 C CNN
	1    8650 2450
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:IS62WV51216EBLL-45TLI U6
U 1 1 623E4AF9
P 7450 3900
F 0 "U6" H 8050 4165 50  0000 C CNN
F 1 "IS62WV51216EBLL-45TLI" H 8050 4074 50  0000 C CNN
F 2 "SOP80P1176X120-44N" H 8500 4000 50  0001 L CNN
F 3 "https://www.arrow.com/en/products/is62wv51216ebll-45tli/integrated-silicon-solution-inc" H 8500 3900 50  0001 L CNN
F 4 "SRAM Chip Async Single 2.5V/3.3V 8M-bit 512K x 16 45ns 44-Pin TSOP-II" H 8500 3800 50  0001 L CNN "Description"
F 5 "1.2" H 8500 3700 50  0001 L CNN "Height"
F 6 "870-62WV512EBLL45TLI" H 8500 3600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/ProductDetail/ISSI/IS62WV51216EBLL-45TLI?qs=uCnMRCNamml2HPqzTYU7sw%3D%3D" H 8500 3500 50  0001 L CNN "Mouser Price/Stock"
F 8 "Integrated Silicon Solution Inc." H 8500 3400 50  0001 L CNN "Manufacturer_Name"
F 9 "IS62WV51216EBLL-45TLI" H 8500 3300 50  0001 L CNN "Manufacturer_Part_Number"
	1    7450 3900
	1    0    0    -1  
$EndComp
Text GLabel 7450 3900 0    50   Input ~ 0
RAM_A5
Text GLabel 7450 4000 0    50   Input ~ 0
RAM_A4
Text GLabel 7450 4100 0    50   Input ~ 0
RAM_A3
Text GLabel 7450 4200 0    50   Input ~ 0
RAM_A2
Text GLabel 7450 4300 0    50   Input ~ 0
RAM_A1
Text GLabel 7450 4400 0    50   Input ~ 0
RAM_SEL3
Text GLabel 7450 4500 0    50   Input ~ 0
RAM_D0
Text GLabel 7450 4600 0    50   Input ~ 0
RAM_D1
Text GLabel 7450 4700 0    50   Input ~ 0
RAM_D2
Text GLabel 7450 4800 0    50   Input ~ 0
RAM_D3
$Comp
L power:+3.3V #PWR094
U 1 1 623E4B09
P 7450 4900
F 0 "#PWR094" H 7450 4750 50  0001 C CNN
F 1 "+3.3V" V 7450 5000 50  0000 L CNN
F 2 "" H 7450 4900 50  0001 C CNN
F 3 "" H 7450 4900 50  0001 C CNN
	1    7450 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR095
U 1 1 623E4B0F
P 7450 5000
F 0 "#PWR095" H 7450 4750 50  0001 C CNN
F 1 "GND" V 7450 4800 50  0000 C CNN
F 2 "" H 7450 5000 50  0001 C CNN
F 3 "" H 7450 5000 50  0001 C CNN
	1    7450 5000
	0    1    1    0   
$EndComp
Text GLabel 7450 5100 0    50   Input ~ 0
RAM_D4
Text GLabel 7450 5200 0    50   Input ~ 0
RAM_D5
Text GLabel 7450 5300 0    50   Input ~ 0
RAM_D6
Text GLabel 7450 5400 0    50   Input ~ 0
RAM_D7
Text GLabel 7450 5500 0    50   Input ~ 0
RAM_WE
Text GLabel 7450 5600 0    50   Input ~ 0
RAM_A17
Text GLabel 7450 5700 0    50   Input ~ 0
RAM_A16
Text GLabel 7450 5800 0    50   Input ~ 0
RAM_A15
Text GLabel 7450 5900 0    50   Input ~ 0
RAM_A14
Text GLabel 7450 6000 0    50   Input ~ 0
RAM_A13
Text GLabel 8650 6000 2    50   Input ~ 0
RAM_A18
Text GLabel 8650 3900 2    50   Input ~ 0
RAM_A6
Text GLabel 8650 4000 2    50   Input ~ 0
RAM_A7
Text GLabel 8650 4100 2    50   Input ~ 0
RAM_A8
Text GLabel 8650 4200 2    50   Input ~ 0
RAM_OE
Text GLabel 8650 4300 2    50   Input ~ 0
RAM_UB
Text GLabel 8650 4400 2    50   Input ~ 0
RAM_LB
Text GLabel 8650 4500 2    50   Input ~ 0
RAM_D15
Text GLabel 8650 4600 2    50   Input ~ 0
RAM_D14
Text GLabel 8650 4700 2    50   Input ~ 0
RAM_D13
Text GLabel 8650 4800 2    50   Input ~ 0
RAM_D12
Text GLabel 8650 5100 2    50   Input ~ 0
RAM_D11
Text GLabel 8650 5200 2    50   Input ~ 0
RAM_D10
Text GLabel 8650 5300 2    50   Input ~ 0
RAM_D9
Text GLabel 8650 5400 2    50   Input ~ 0
RAM_D8
Text GLabel 8650 5900 2    50   Input ~ 0
RAM_A12
Text GLabel 8650 5800 2    50   Input ~ 0
RAM_A11
Text GLabel 8650 5700 2    50   Input ~ 0
RAM_A10
Text GLabel 8650 5600 2    50   Input ~ 0
RAM_A9
Text GLabel 8650 5500 2    50   Input ~ 0
RAM_A19
$Comp
L power:GND #PWR098
U 1 1 623E4B33
P 8650 4900
F 0 "#PWR098" H 8650 4650 50  0001 C CNN
F 1 "GND" V 8650 4700 50  0000 C CNN
F 2 "" H 8650 4900 50  0001 C CNN
F 3 "" H 8650 4900 50  0001 C CNN
	1    8650 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR099
U 1 1 623E4B39
P 8650 5000
F 0 "#PWR099" H 8650 4850 50  0001 C CNN
F 1 "+3.3V" V 8650 5100 50  0000 L CNN
F 2 "" H 8650 5000 50  0001 C CNN
F 3 "" H 8650 5000 50  0001 C CNN
	1    8650 5000
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C30
U 1 1 623E4B3F
P 7650 7350
F 0 "C30" H 7742 7396 50  0000 L CNN
F 1 "100nF" H 7742 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 7350 50  0001 C CNN
F 3 "~" H 7650 7350 50  0001 C CNN
	1    7650 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C31
U 1 1 623E4B45
P 8150 7350
F 0 "C31" H 8242 7396 50  0000 L CNN
F 1 "100nF" H 8242 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8150 7350 50  0001 C CNN
F 3 "~" H 8150 7350 50  0001 C CNN
	1    8150 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C32
U 1 1 623E4B4B
P 8650 7350
F 0 "C32" H 8742 7396 50  0000 L CNN
F 1 "100nF" H 8742 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 7350 50  0001 C CNN
F 3 "~" H 8650 7350 50  0001 C CNN
	1    8650 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 7600 8650 7450
Wire Wire Line
	8150 7450 8150 7600
Connection ~ 8150 7600
Wire Wire Line
	8150 7600 8650 7600
Wire Wire Line
	7650 7450 7650 7600
Wire Wire Line
	7650 7600 8150 7600
Wire Wire Line
	8650 7100 8650 7250
Wire Wire Line
	8150 7100 8150 7250
Connection ~ 8150 7100
Wire Wire Line
	8150 7100 8650 7100
Wire Wire Line
	7650 7100 7650 7250
Wire Wire Line
	7650 7100 8150 7100
Connection ~ 7650 7100
Connection ~ 7650 7600
Wire Wire Line
	7150 7100 7650 7100
Wire Wire Line
	7150 7100 7150 7250
Wire Wire Line
	7150 7600 7650 7600
Wire Wire Line
	7150 7450 7150 7600
$Comp
L Device:C_Small C29
U 1 1 623E4B6D
P 7150 7350
F 0 "C29" H 7242 7396 50  0000 L CNN
F 1 "100nF" H 7242 7305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 7350 50  0001 C CNN
F 3 "~" H 7150 7350 50  0001 C CNN
	1    7150 7350
	1    0    0    -1  
$EndComp
Wire Notes Line
	9250 750  6900 750 
Wire Notes Line
	6900 7850 9250 7850
Wire Notes Line
	9250 7850 9250 750 
Wire Wire Line
	6650 7100 7150 7100
Connection ~ 6650 7100
Connection ~ 7150 7100
Wire Wire Line
	6650 7600 7150 7600
Connection ~ 6650 7600
Connection ~ 7150 7600
$EndSCHEMATC
