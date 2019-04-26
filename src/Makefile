ifndef CROSS_COMPILE
	CROSS_COMPILE = mips-sde-elf-
endif

CC = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump

OBJECTS = Instr_ROM.o

export CROSS_COMPILE

all:Instr_ROM.data

#compile
Instr_ROM.o: Instr_ROM.S
	$(CC) -mips32 $< -o $@

#link
Instr_ROM.om: ram.ld $(OBJECTS)
	$(LD) -T ram.ld $(OBJECTS) -o $@

#binery
Instr_ROM.bin: Instr_ROM.om
	$(OBJCOPY) -O binary $< $@

#data
Instr_ROM.data: Instr_ROM.bin
	./Bin2Mem.exe -f $< -o $@
clean:
	rm -f *.o *.om *.bin *.data
