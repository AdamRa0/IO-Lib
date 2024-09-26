; Remove file after each function being tested

extern read_string
extern input_buffer ; For testing, remove later
extern print_string
extern exit
extern parse_uint
extern parse_int
extern cmp_string

global _start

section .data
    str1: db 'Hello', 0
    str2: db 'Hella', 0

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
    ; call parse_int
    mov rsi, str1
    mov rdi, str2
    call cmp_string
    call exit
