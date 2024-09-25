; Remove file after each function being tested

extern read_string
extern input_buffer ; For testing, remove later
extern print_string
extern exit
extern parse_uint
extern parse_int

global _start

section .text
    
_start:
    ; mov rdi, new_char
    ; mov rdi, test_str
    ; call string_length
    ; call print_string
    ; call print_char
    ; mov rdi, [test_uint]
    ; call print_uint
    ; call print_int
    ; lea rdi, [char_buffer]
    ; call read_char
    ; lea rdi, [char_buffer]
    ; call print_char
    ; call print_newline
    ; call read_string
    ; mov rdi, input_buffer
    ; call print_string
    ; call parse_uint
    call parse_int
    call exit
