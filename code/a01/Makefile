.PHONY: all clean

TARGETS = x86.hello x86.hi riscv.hello riscv.hi

all: $(TARGETS)

riscv.hello: riscv.hello.s
	riscv64-linux-gnu-as -o $@.o $<
	riscv64-linux-gnu-ld -o $@ $@.o -znoseparate-code
	qemu-riscv64 $@

riscv.hi: riscv.hi.s
	riscv64-linux-gnu-as -o $@.o $<
	riscv64-linux-gnu-ld -o $@.raw $@.o -znoseparate-code
	riscv64-linux-gnu-objcopy -O binary --only-section=.text $@.raw $@
	qemu-riscv64 $@

x86.hello: x86.hello.asm
	nasm -f elf64 -o $@.o $?
	ld -o $@ $@.o -znoseparate-code
	./$@

x86.hi: x86.hi.asm
	nasm -f bin -o $@ $?
	chmod +x $@
	./$@

clean: 
	rm -f x86.hello x86.hi riscv.hello riscv.hi riscv.hi.raw *o
