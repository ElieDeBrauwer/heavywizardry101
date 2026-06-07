.PHONY: all clean

TARGETS = sctw2kc sctw2ke

all: $(TARGETS)

clean:
	rm -f *.o $(TARGETS)

sctw2kc: sctw2kc.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^

sctw2ke: sctw2ke.c
	x86_64-linux-gnu-gcc -Wall -Werror -o $@ $^
