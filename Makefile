ASM = nasm
ASMFLAGS = -f elf64
LD = ld
EXECUTABLE = io_lib
OBJ_FILES = cmp_string.o parse_int.o parse_uint.o print_char.o print_int.o print_newline.o print_string.o print_uint.o read_char.o read_string.o string_length.o io_lib.o exit.o

all: $(EXECUTABLE)

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

$(EXECUTABLE): $(OBJ_FILES)
	$(LD) -o $(EXECUTABLE) $(OBJ_FILES)

clean: 
	rm -f $(OBJ_FILES) $(EXECUTABLE)