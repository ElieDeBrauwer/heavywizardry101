.PHONY: all clean

TARGETS = c02-01 c02-01.o c02-01-ex c02-01-ex.o c02-02 c02-03 c02-03-static c02-03-exit c02-03-exit-stripped c02-03-exit-aarch64 c02-03-exit-arm c02-03-exit-mips c02-03-exit-mips64 c02-03-exit-riscv64 c02-03-exit-x86_64
all: $(TARGETS)

clean:
	rm -f $(TARGETS)

c02-01.o: c2-1.asm
	nasm -f elf64 -o $@ $^
	file $@

c02-01: c02-01.o
	x86_64-linux-gnu-ld -o $@ $^
	file $@
	qemu-x86_64 $@ ; echo $$?

c02-01-ex.o: c2-1-exercise.asm
	nasm -f elf64 -o $@ $^

c02-01-ex: c02-01-ex.o
	x86_64-linux-gnu-ld -o $@ $^
	qemu-x86_64 $@ ; echo $$?

c02-02: c2-2.c
	x86_64-linux-gnu-gcc -o $@ $^
	qemu-x86_64 $@ ; echo $$?

c02-03: c2-3.c
	x86_64-linux-gnu-gcc -nostartfiles -o $@ $^
	qemu-x86_64 $@ ; echo $$?

c02-03-static: c2-3.c
	x86_64-linux-gnu-gcc -nostartfiles -static -o $@ $^
	qemu-x86_64 $@ ; echo $$?

c02-03-exit: c2-3.c x86_64_exit.s
	x86_64-linux-gnu-gcc -static -nostdlib -o $@ $^
	qemu-x86_64 $@ ; echo $$?

c02-03-exit-stripped: c02-03-exit
	x86_64-linux-gnu-strip -o $@ $^
	qemu-x86_64 $@ ; echo $$?
	x86_64-linux-gnu-size $@

c02-03-exit-aarch64: c2-3.c aarch64_exit.s
	aarch64-linux-gnu-gcc -static -nostartfiles -o $@ $^
	qemu-aarch64 $@ ; echo $$?

c02-03-exit-arm: c2-3.c arm_exit.s
	arm-linux-gnueabi-gcc -static -nostartfiles -o $@ $^
	qemu-arm $@ ; echo $$?

c02-03-exit-mips: c2-3.c mips_exit.s
	mips-linux-gnu-gcc -DMIPS -fno-pic -static -nostartfiles -o $@ $^
	qemu-mips $@ ; echo $$?

c02-03-exit-mips64: c2-3.c mips64_exit.s
	mips64-linux-gnuabi64-gcc -DMIPS -fno-pic -mno-abicalls -static -nostartfiles -o $@ $^
	qemu-mips64 $@ ; echo $$?

c02-03-exit-riscv64: c2-3.c riscv64_exit.s
	riscv64-linux-gnu-gcc -static -nostartfiles -o $@ $^
	qemu-riscv64 $@ ; echo $$?

c02-03-exit-x86_64: c2-3.c x86_64_exit.s
	x86_64-linux-gnu-gcc -static -nostartfiles -o $@ $^
	qemu-x86_64 $@ ; echo $$?
