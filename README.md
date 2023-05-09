# MigStorm-ITX
A 68000 socketed ITX form factor Minimig.

![pic](pic.png)

## Info
Tested by Zenon to boot with Pistorm and CaffieneOS, also with a regular M68k CPU. It appears to be fully working, however it still needs further testing to confirm complete functionality. It also needs more general trace cleanup/enhancement. Build at your own risk.

## Mouser Cart
https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=da74540bb5 \
At the time of making the cart, the headphone jack and PS/2 ports are out of stock. They are able to be sourced from Arrow and Digikey. This cart may have items go in and out of stock depending on global shortages and EOL products. I recommend using Octopart and other similar sites to search for parts. The main Xilinx FPGA can be purchased from UTsource for around $30 and they are a pretty reliable supplier. I caution using sources like Ebay and Aliexpress, especially from China-based sellers with little to no feedback since they'll often sell counterfeit items. \
\
As a DIY project, total cost for all parts and a board should come out to just under $150. (plus the cost of a CPU or Pistorm)

## Rev History
v0.4 -- Current rev to build. Corrected PS/2 Mouse & Keyboard pinout. \
v0.3 -- Changed soft-power circuit from 555 timer to a MAX16054, cleaned up a few traces with lots of vias. Still need more cleanup. [depreciated rev, do not build] \
v0.2 -- Initial rev with corrected 68k socket size. [depreciated rev, do not build]
