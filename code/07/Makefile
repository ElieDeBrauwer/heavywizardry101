.PHONY: all clean

TARGETS = dropper dropper1 dropper2 dropper3 dropper4 dropper5 dropper6 dropper7 dropper.x86 dropper.x86.o dropper.arm dropper.arm.o dropper.mips dropper.mips.o dropper.riscv dropper.riscv.o

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

dropper: dropper.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo hello | nc -Nlp 4369 & sleep .1;  ./$@"
	bash -c "echo \"echo hi there\" | nc -Nlp 4369 & sleep .1; ./$@ > k; chmod +x k; ./k; rm -f k"

dropper1: dropper1.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 1\" | nc -Nlp 4369 & sleep .1; ./$@; rm -f k"

dropper2: dropper2.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 2\" | nc -Nlp 4369 & sleep .2; ./$@; sleep .1 ; rm -f k"

dropper3: dropper3.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 3\" | nc -Nlp 4369 & sleep .2; ./$@; sleep .1 ; rm -f /dev/shm/k"

dropper4: dropper4.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 4\" | nc -Nlp 4369 & sleep .2; ./$@"

dropper5: dropper5.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 5\" | nc -Nlp 4369 & sleep .2; ./$@"

dropper6: dropper6.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 6\" | nc -Nlp 4369 & sleep .2; ./$@"

dropper7: dropper7.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
	bash -c "echo -e  \"#!/bin/bash\necho hi there from dropper 7\" | nc -Nlp 4369 & sleep .2; ./$@"

dropper.x86: dropper.x86.o
	x86_64-linux-gnu-ld -o $@ $^

dropper.mips.o: dropper.mips.s
	mips-linux-gnu-as -o $@ $^

dropper.mips: dropper.mips.o
	mips-linux-gnu-ld -o $@ $^

dropper.arm.o: dropper.arm.s
	arm-linux-gnueabi-as -o $@ $^

dropper.arm: dropper.arm.o
	arm-linux-gnueabi-ld -o $@ $^

dropper.riscv.o: dropper.riscv.s
	riscv64-linux-gnu-as -o $@ $^

dropper.riscv: dropper.riscv.o
	riscv64-linux-gnu-ld -o $@ $^

%.o: %.asm
	nasm -f elf64 ${DEBUG} -o $@ $<
