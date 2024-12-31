#
#       !!!! Do NOT edit this makefile with an editor which replace tabs by spaces !!!!    
#
##############################################################################################
# 
# On command line:
#
# make all = Create project
#
# make clean = Clean project files.
#
# To rebuild project do "make clean" and "make all".
#

##############################################################################################
# Start of default section
#
GCC_PATH = /usr/local/gcc-arm-none-eabi-4_8-2014q1/bin/
TRGT = $(GCC_PATH)arm-none-eabi-
CC   = $(TRGT)gcc
CP   = $(TRGT)objcopy
AS   = $(TRGT)gcc -x assembler-with-cpp
BIN  = $(CP) -O binary 

MCU  = arm7tdmi

# List all default C defines here, like -D_DEBUG=1
DDEFS = 

# List all default ASM defines here, like -D_DEBUG=1
DADEFS = 

# List all default directories to look for include files here
DINCDIR = 

# List the default directory to look for the libraries here
DLIBDIR =

# List all default libraries here
DLIBS = 

#
# End of default section
##############################################################################################

##############################################################################################
# Start of user section
#

# Define project name here
PROJECT = firmware

# Define linker script file here
LDSCRIPT_RAM = ./prj/sam7s256_ram.ld
LDSCRIPT_ROM = ./prj/sam7s256_rom.ld

# List all user C define here, like -D_DEBUG=1
UDEFS =

# Define ASM defines here
UADEFS = 

SRC  = ./src/syscalls.c \
./src/stringlight.c \
./src/printf.c \
./src/fdd.c \
./src/fat.c \
./src/osd.c \
./src/fpga.c \
./src/firmware.c \
./src/hardware.c \
./src/hdd.c \
./src/menu.c \
./src/mmc.c \
./src/main.c

# List ASM source files here
ASRC = ./src/startup.s

# List all user directories here
UINCDIR = ./inc

# List the user directory to look for the libraries here
ULIBDIR =

# List all user libraries here
ULIBS = 

# Define optimisation level here
OPT = -Og

#
# End of user defines
##############################################################################################


INCDIR  = $(patsubst %,-I%,$(DINCDIR) $(UINCDIR))
LIBDIR  = $(patsubst %,-L%,$(DLIBDIR) $(ULIBDIR))
DEFS    = $(DDEFS) $(UDEFS)
ADEFS   = $(DADEFS) $(UADEFS)
OBJS    = $(ASRC:.s=.o) $(SRC:.c=.o)
LIBS    = $(DLIBS) $(ULIBS)

# In case THUMB code should be created, add "-mthumb" to the MCFLAGS too.
MCFLAGS = -mcpu=$(MCU)

ASFLAGS = $(MCFLAGS) -g -gdwarf-2 -Wa,-amhls=$(<:.s=.lst) $(ADEFS)
CPFLAGS = $(MCFLAGS) $(OPT) -gdwarf-2 -mthumb-interwork -fomit-frame-pointer -Wall -Wstrict-prototypes -fverbose-asm -Wa,-ahlms=$(<:.c=.lst) $(DEFS)
LDFLAGS_RAM = $(MCFLAGS) -nostartfiles -T$(LDSCRIPT_RAM) -Wl,-Map=$(PROJECT)_ram.map,--cref,--no-warn-mismatch $(LIBDIR) --specs=nano.specs
LDFLAGS_ROM = $(MCFLAGS) -nostartfiles -T$(LDSCRIPT_ROM) -Wl,-Map=$(PROJECT)_rom.map,--cref,--no-warn-mismatch $(LIBDIR) --specs=nano.specs

# Generate dependency information
CPFLAGS += -MD -MP -MF .dep/$(@F).d

#
# makefile rules
#

all:  ROM

#RAM: $(OBJS) $(PROJECT)_ram.elf $(PROJECT)_ram.bin

ROM: $(OBJS) $(PROJECT)_rom.elf $(PROJECT)_rom.bin

%.o : %.c
	$(CC) -c $(CPFLAGS) -I . $(INCDIR) $< -o $@

%.o : %.s
	$(AS) -c $(ASFLAGS) $< -o $@

%ram.elf: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS_RAM) $(LIBS) -o $@

%rom.elf: $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS_ROM) $(LIBS) -o $@

%bin: %elf
	$(BIN) $< $@

clean:
	-rm -f $(OBJS)
	-rm -f $(PROJECT)_ram.elf
	-rm -f $(PROJECT)_ram.map
	-rm -f $(PROJECT)_ram.hex
	-rm -f $(PROJECT)_rom.bin
	-rm -f $(PROJECT)_rom.elf
	-rm -f $(PROJECT)_rom.map
	-rm -f $(PROJECT)_rom.hex
	-rm -f $(PROJECT).bin
	-rm -f $(PROJECT).upg
	-rm -f $(SRC:.c=.c.bak)
	-rm -f $(SRC:.c=.lst)
	-rm -f $(ASRC:.s=.s.bak)
	-rm -f $(ASRC:.s=.lst)
	-rm -fR .dep

# 
# Include the dependency files, should be the last of the makefile
#
-include $(shell mkdir .dep 2>/dev/null) $(wildcard .dep/*)

# *** EOF ***
