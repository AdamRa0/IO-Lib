global read_char

section .data
    sys_read: equ 0
    sys_stdin: equ 0

section .bss
    buffer: resb 1

section .text

read_char:
    mov rax, sys_read
    mov rdi, sys_stdin
    mov rsi, buffer
    mov rdx, 1
    syscall

    mov rax, rsi
    ret

section .note.GNU-stack noalloc noexec nowrite progbits