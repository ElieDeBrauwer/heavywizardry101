.PHONY: all clean

TARGETS = c2 repl-c repl-asm repl-asm1 repl-asm2 repl-asm3 repl-asm.aarch64 repl-asm1.aarch64 repl-asm2.aarch64 repl-asm.arm repl-asm1.arm repl-asm2.arm repl-asm3.arm repl-asm.mips repl-asm1.mips repl-asm2.mips repl-asm.riscv64 repl-asm1.riscv64 repl-asm2.riscv64 zombie

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

DEBUG=-F dwarf -g 

c2: c2.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

plibc-x86.o: ../lib/plibc.x86.s
	x86_64-linux-gnu-as -o $@ $^

plibc-aarch64.o: ../lib/plibc.aarch64.s
	aarch64-linux-gnu-as -o $@ $^

plibc-arm.o: ../lib/plibc.arm.s
	arm-linux-gnueabi-as -o $@ $^

plibc-mips.o: ../lib/plibc.mips.s
	mips-linux-gnu-as -o $@ $^

plibc-riscv64.o: ../lib/plibc.riscv.s
	riscv64-linux-gnu-as -o $@ $^

repl-c: repl.c
	x86_64-linux-gnu-gcc -o $@ $^

repl-asm: repl-asm.x86.o plibc-x86.o
	x86_64-linux-gnu-ld -o $@ $^

repl-asm1: repl-asm1.x86.o plibc-x86.o
	x86_64-linux-gnu-ld -o $@ $^

repl-asm2: repl-asm2.x86.o plibc-x86.o
	x86_64-linux-gnu-ld -o $@ $^

repl-asm3: repl-asm3.x86.o plibc-x86.o
	x86_64-linux-gnu-ld -o $@ $^

repl-asm.arm: repl-asm.arm.o plibc-arm.o
	arm-linux-gnueabi-ld -o $@  $^

repl-asm.arm.o: repl-asm.arm.s
	arm-linux-gnueabi-as -o $@ $^

repl-asm1.arm: repl-asm1.arm.o plibc-arm.o
	arm-linux-gnueabi-ld -o $@  $^

repl-asm1.arm.o: repl-asm1.arm.s
	arm-linux-gnueabi-as -o $@ $^

repl-asm2.arm: repl-asm2.arm.o plibc-arm.o
	arm-linux-gnueabi-ld -o $@  $^

repl-asm2.arm.o: repl-asm2.arm.s
	arm-linux-gnueabi-as -o $@ $^

repl-asm3.arm.o: repl-asm3.arm.s
	arm-linux-gnueabi-as -o $@ $^

repl-asm3.arm: repl-asm3.arm.o plibc-arm.o
	arm-linux-gnueabi-ld -o $@ $^

repl-asm.aarch64: repl-asm.aarch64.o plibc-aarch64.o
	aarch64-linux-gnu-ld -o $@  $^

repl-asm.aarch64.o: repl-asm.aarch64.s
	aarch64-linux-gnu-as -o $@ $^

repl-asm1.aarch64: repl-asm1.aarch64.o plibc-aarch64.o
	aarch64-linux-gnu-ld -o $@  $^

repl-asm1.aarch64.o: repl-asm1.aarch64.s
	aarch64-linux-gnu-as -o $@ $^

repl-asm2.aarch64: repl-asm2.aarch64.o plibc-aarch64.o
	aarch64-linux-gnu-ld -o $@  $^

repl-asm2.aarch64.o: repl-asm2.aarch64.s
	aarch64-linux-gnu-as -o $@ $^

repl-asm.mips.o: repl-asm.mips.s
	mips-linux-gnu-as -o $@ $^

repl-asm.mips: repl-asm.mips.o plibc-mips.o
	mips-linux-gnu-ld -o $@ $^

repl-asm1.mips.o: repl-asm1.mips.s
	mips-linux-gnu-as -o $@ $^

repl-asm1.mips: repl-asm1.mips.o plibc-mips.o
	mips-linux-gnu-ld -o $@ $^

repl-asm2.mips.o: repl-asm2.mips.s
	mips-linux-gnu-as -o $@ $^

repl-asm2.mips: repl-asm2.mips.o plibc-mips.o
	mips-linux-gnu-ld -o $@ $^

repl-asm.riscv64.o: repl-asm.riscv.s
	riscv64-linux-gnu-as -o $@ $^

repl-asm.riscv64: repl-asm.riscv64.o plibc-riscv64.o
	riscv64-linux-gnu-ld -o $@ $^

repl-asm1.riscv64.o: repl-asm1.riscv.s
	riscv64-linux-gnu-as -o $@ $^

repl-asm1.riscv64: repl-asm1.riscv64.o plibc-riscv64.o
	riscv64-linux-gnu-ld -o $@ $^

repl-asm2.riscv64.o: repl-asm2.riscv.s
	riscv64-linux-gnu-as -o $@ $^

repl-asm2.riscv64: repl-asm2.riscv64.o plibc-riscv64.o
	riscv64-linux-gnu-ld -o $@ $^

zombie: zombie.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

%.o: %.asm
	nasm -f elf64 ${DEBUG} -o $@ $<
