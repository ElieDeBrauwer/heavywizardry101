.PHONY: all clean

TARGETS = backdoor backdoor.arm backdoor.arm.o backdoor.arm.strip backdoor.riscv backdoor.riscv.o backdoor.riscv.strip backdoor.x86 backdoor.x86.gz backdoor.x86.gz.enc backdoor.x86.sh backdoor.x86.strip backdoor.x86.strip.gz backdoor.x86.strip.gz.enc backdoor.x86.strip.sh edumper

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

backdoor: backdoor.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

backdoor.arm: backdoor.arm.o
	arm-linux-gnueabi-ld -o $@ $^

backdoor.arm.o: backdoor.arm.s
	arm-linux-gnueabi-as -o $@ $^

backdoor.arm.strip: backdoor.arm
	arm-linux-gnueabi-strip -o $@ $^

backdoor.riscv: backdoor.riscv.o
	riscv64-linux-gnu-ld -o $@ $^

backdoor.riscv.o: backdoor.riscv.s
	riscv64-linux-gnu-as -o $@ $^

backdoor.riscv.strip: backdoor.riscv
	riscv64-linux-gnu-strip -o $@ $^

backdoor.x86: backdoor.x86.o
	x86_64-linux-gnu-ld -o $@ $^

backdoor.x86.gz: backdoor.x86
	gzip -k $^

backdoor.x86.gz.enc: backdoor.x86.gz
	base64 <$^ >$@

backdoor.x86.sh: backdoor.x86 edumper
	./edumper <backdoor.x86 >$@

backdoor.x86.strip: backdoor.x86
	x86_64-linux-gnu-strip -o $@ $^

backdoor.x86.strip.gz: backdoor.x86.strip
	gzip -k $^

backdoor.x86.strip.gz.enc: backdoor.x86.strip.gz
	base64 <$^ >$@

backdoor.x86.strip.sh: backdoor.x86.strip edumper
	./edumper <backdoor.x86.strip >$@

edumper: edumper.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

%.o: %.asm
	nasm -f elf64 ${DEBUG} -o $@ $<
