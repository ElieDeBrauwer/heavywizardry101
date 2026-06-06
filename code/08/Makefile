.PHONY: all clean

TARGETS = snase hello.x86 hello.x86.o hello.x86.shcode

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

snase: snase.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

hello.x86: hello.x86.o snase
	x86_64-linux-gnu-ld -o $@ $<

hello.x86.shcode: hello.x86.o
	readelf -a $< | grep -A1 .text
	dd if=$< of=$@ skip=384 count=49 bs=1
	bash -c "./snase &  sleep .2 ; cat $@ | nc 127.0.0.1 9999 ; sleep .2 ; killall -9 snase "

%.o: %.asm
	nasm -f elf64 ${DEBUG} -o $@ $<
