.PHONY: all clean

TARGETS = c04-04 c04-06-aarch64 c04-06-arm c04-06-mips c04-06-mips64 c04-06-riscv64 c04-06-x86_64 c04-07-x86_64 c04-08-x86_64 c04-09-x86_64 c04-10 c04-11
all: $(TARGETS)

clean:
	rm -f $(TARGETS)

c04-04: ex.c ex.s
	x86_64-linux-gnu-gcc -o $@ $^
	qemu-x86_64 $@

c04-06-aarch64: local_vars.c
	aarch64-linux-gnu-gcc -o $@ $^
	aarch64-linux-gnu-objdump -d $@ | grep -A7 "<func1>:"
	aarch64-linux-gnu-objdump -d $@ | grep -A9 "<func3>:"
	aarch64-linux-gnu-objdump -d $@ | grep -A6 "<main>:"

c04-06-arm: local_vars.c
	arm-linux-gnueabi-gcc -o $@ $^
	arm-linux-gnueabi-objdump -d $@ | grep -A12 "<func1>:"
	arm-linux-gnueabi-objdump -d $@ | grep -A9 "<func3>:"
	arm-linux-gnueabi-objdump -d $@ | grep -A3 "<main>:"

c04-06-mips: local_vars.c
	mips-linux-gnu-gcc -o $@ $^

c04-06-mips64: local_vars.c
	mips64-linux-gnuabi64-gcc -o $@ $^

c04-06-riscv64: local_vars.c
	riscv64-linux-gnu-gcc -o $@ $^
	riscv64-linux-gnu-objdump -d $@ | grep -A15 "<func1>:"
	riscv64-linux-gnu-objdump -d $@ | grep -A14 "<func3>:"
	riscv64-linux-gnu-objdump -d $@ | grep -A5 "<main>:"

c04-06-x86_64: local_vars.c
	x86_64-linux-gnu-gcc -o $@ $^
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A7 "<func1>:"
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A12 "<func2>:"
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A8 "<func3>:"

c04-07-x86_64: parameters.c
	x86_64-linux-gnu-gcc -o $@ $^
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A14 "<main>:"

c04-08-x86_64: parameters1.c
	x86_64-linux-gnu-gcc -o $@ $^
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A12 "<func4>:"

c04-09-x86_64: parameters2.c
	x86_64-linux-gnu-gcc -o $@ $^
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A14 "<main>:"
	x86_64-linux-gnu-objdump -Mintel -d $@ | grep -A17 "<func4>:"

c04-10: crackme.c
	x86_64-linux-gnu-gcc -o $@ $^

c04-11: crackme_inst.c
	x86_64-linux-gnu-gcc -o $@ $^
