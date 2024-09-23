global read_char

section .data
    sys_read: equ 0
    sys_stdin: equ 0

section .text

read_char:
    mov rax, sys_read
    mov rsi, rdi
    mov rdi, sys_stdin
    mov rdx, 1
    syscall
    mov rax, rsi
    ret