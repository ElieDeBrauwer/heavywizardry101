.PHONY: all clean

TARGETS = ex01-aarch64 ex01-arm ex01-mips ex01-mips64 ex01-riscv64 ex01-x86_64
all: $(TARGETS)

clean:
	rm -f $(TARGETS)

ex01-aarch64: ex01.c
	aarch64-linux-gnu-gcc -fomit-frame-pointer -o $@ $^
	aarch64-linux-gnu-objdump -d $@ | grep -A 8 '<main>:'

ex01-arm: ex01.c
	arm-linux-gnueabi-gcc -fomit-frame-pointer -o $@ $^
	arm-linux-gnueabi-objdump -d $@ | grep -A 9 '<main>:'

ex01-mips: ex01.c
	mips-linux-gnu-gcc -fomit-frame-pointer -o $@ $^
	mips-linux-gnu-objdump -d $@ | grep -A 13 '<main>:'

ex01-mips64: ex01.c
	mips64-linux-gnuabi64-gcc -fomit-frame-pointer -o $@ $^
	mips64-linux-gnuabi64-objdump -d $@ | grep -A 14 '<main>:'

ex01-riscv64: ex01.c
	riscv64-linux-gnu-gcc -fomit-frame-pointer -o $@ $^
	riscv64-linux-gnu-objdump -d $@ | grep -A 14 '<main>:'

ex01-x86_64: ex01.c
	x86_64-linux-gnu-gcc -fomit-frame-pointer -o $@ $^
	x86_64-linux-gnu-objdump -M intel -d $@ | grep -A 10 '<main>:'
