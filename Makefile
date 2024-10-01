ASM = nasm
ASMFLAGS = -f elf64
CC = gcc
CFLAGS = -Wall -O2
LD = ld
EXECUTABLE = io_lib
OBJ_FILES = cmp_string.o parse_int.o parse_uint.o print_char.o print_int.o print_newline.o print_string.o print_uint.o read_char.o read_string.o string_copy.o string_length.o exit.o test.o

all: $(EXECUTABLE)

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< 

$(EXECUTABLE): $(OBJ_FILES)
	$(CC) -no-pie -o $(EXECUTABLE) $(OBJ_FILES)

clean: 
	rm -f $(OBJ_FILES) $(EXECUTABLE)