global read_string

section .data
    input_len: equ 256
    sys_read: equ 0
    sys_stdin: equ 0

section .bss
    global input_buffer
    input_buffer: resb input_len

section .text

read_string:
    mov rax, sys_read
    mov rdx, input_len
    mov rdi, sys_stdin
    mov rsi, input_buffer

    syscall

    mov rax, input_buffer
    ret

section .note.GNU-stack noalloc noexec nowrite progbits