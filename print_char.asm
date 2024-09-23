global print_char

section .data
    sys_stdout: equ 1
    sys_write: equ 1

section .text

print_char:
    mov rsi, rdi
    mov rax, sys_write
    mov rdi, sys_stdout
    mov rdx, sys_stdout
    syscall
    ret