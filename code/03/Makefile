.PHONY: all clean

TARGETS = hello x86_64-hello x86_64-hello.o x86_64-ghost x86_64-ghost.o sc-aarch64 sc-aarch64.o sc-arm sc-arm.o sc-mips sc-mips.o sc-mips64 sc-mips64.o sc-riscv64 sc-riscv64.o sc-x86_64 sc-x86_64.o
all: $(TARGETS)

clean:
	rm -f $(TARGETS)

hello: hello.c
	x86_64-linux-gnu-gcc -no-pie -fno-pic -o $@ $^
	x86_64-linux-gnu-objdump -d -M intel $@ | grep -A 12 '<main>'
	qemu-x86_64 $@

sc-aarch64.o: aarch64_sc.s
	aarch64-linux-gnu-as -o $@ $^

sc-aarch64: sc-aarch64.o
	aarch64-linux-gnu-ld -o $@ $^
	strace -e execve qemu-aarch64 $@

sc-arm.o: arm_sc.s
	arm-linux-gnueabi-as -o $@ $^

sc-arm: sc-arm.o
	arm-linux-gnueabi-ld -o $@ $^
	strace -e execve qemu-arm $@

sc-mips.o: mips_sc.s
	mips-linux-gnu-as -o $@ $^

sc-mips: sc-mips.o
	mips-linux-gnu-ld -o $@ $^
	strace -e execve qemu-mips $@

sc-mips64.o: mips64_sc.s
	mips64-linux-gnuabi64-as -o $@ $^

sc-mips64: sc-mips64.o
	mips64-linux-gnuabi64-ld -o $@ $^
	strace -e execve qemu-mips64 $@

sc-riscv64.o: riscv64_sc.s
	riscv64-linux-gnu-as -o $@ $^

sc-riscv64: sc-riscv64.o
	riscv64-linux-gnu-ld -o $@ $^
	strace -e execve qemu-riscv64 $@

sc-x86_64.o: x86_sc.asm
	nasm -f elf64 -o $@ $^

sc-x86_64: sc-x86_64.o
	x86_64-linux-gnu-ld -o $@ $^
	strace -e execve qemu-x86_64 $@

x86_64-ghost.o:  x86-ghost.asm
	nasm -f elf64 -o $@ $^

x86_64-ghost:  x86_64-ghost.o
	x86_64-linux-gnu-ld -o $@ $^
	strace -e unlink qemu-x86_64 $@

x86_64-hello.o:  x86-hello.asm
	nasm -f elf64 -o $@ $^

x86_64-hello:  x86_64-hello.o
	x86_64-linux-gnu-ld -o $@ $^
	qemu-x86_64 $@
