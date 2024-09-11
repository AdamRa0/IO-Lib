build:
	nasm -f elf64 -o io_lib.o io_lib.asm
	ld -o io_lib io_lib.o
