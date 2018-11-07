#This will be my makefile for my Assembly Subprogram Practice 


main: main.c asm_main.o
	gcc -m32 main.c asm_main.o -o main

asm_main.o: asm_main.asm
	nasm -f elf32 asm_main.asm -o asm_main.o

run:
	./main
edit:
	vim asm_main.asm

c:
	vim main.c

debug:
	gdb ./main

clean:
	rm *.o main


