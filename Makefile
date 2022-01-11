# Makefile

include config.mk

all: compile

compile:
	${CC} ${SRC} -o ${PROG} ${FLAGS} && strip ${PROG}

clean:
	rm ${PROG} test.spl.asm *.o test

run:
	./${PROG} test.spl
	nasm -f elf64 test.spl.asm
	ld test.spl.o -o test

test.spl.asm:
	nasm -f elf64 test.spl.asm
	ld test.spl.o -o test
