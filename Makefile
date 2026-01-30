flags = -O2 -Wall -std=c2x -no-pie
ldflags =

.PHONY: clean

all: clean alloc

alloc: alloc.o mem.o
	cc $(flags) $^ -o $@ $(ldflags)

alloc.o: alloc.c alloc.h
	cc $(flags) -c $<

mem.o: mem.asm
	nasm -f elf64 -o $@ $<

clean:
	rm -f *.o alloc
