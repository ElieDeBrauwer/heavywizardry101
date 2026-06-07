.PHONY: all clean

TARGETS = hello.x86 hello.x86.o hello.x86.shcode pfts picoworm0 picoworm0.static snase snase.static

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

hello.x86: hello.x86.o snase
	x86_64-linux-gnu-ld -o $@ $<

hello.x86.shcode: hello.x86.o
	readelf -a $< | grep -A1 .text
	dd if=$< of=$@ skip=384 count=49 bs=1
	bash -c "./snase &  sleep .2 ; cat $@ | nc 127.0.0.1 9999 ; sleep .2 ; killall -9 snase "

pfts: pfts.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

picoworm0: picoworm0.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

picoworm0.static: picoworm0.c
	x86_64-linux-gnu-gcc -Wall -Werror -static -o $@ $^
	x86_64-linux-gnu-strip $@

snase: snase.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

snase.static: snase.c
	x86_64-linux-gnu-gcc -Wall -Werror -static -o $@ $^


%.o: %.asm
	nasm -f elf64 ${DEBUG} -o $@ $<
