.PHONY: build run

PREFIX = riscv64-elf-
AS = $(PREFIX)as
LD = $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy

run: build
	qemu-system-riscv64 -m 128M -machine virt -bios default -nographic -d cpu_reset,unimp,guest_errors,int -D qemu.log  -serial mon:stdio --no-reboot -kernel dist/bom.bin

build: dist/bom.bin
	./check.sh

dist/bom.bin: dist/bom.elf
	$(OBJCOPY) -O binary $< $@

dist/bom.elf: dist/bom.o
	$(LD) -Tlinker.ld -o $@ $<

dist/bom.o: src/bom.S dist
	$(AS) -march=rv64gc -fno-pic -mabi=lp64 $< -o $@

dist:
	mkdir -p dist
