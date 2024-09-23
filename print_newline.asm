global print_newline

section .data
    new_line: db 0xA ; code for newline
    sys_write: equ 1
    sys_stdout: equ 1

section .text

print_newline:
    mov rsi, new_line
    mov rax, sys_write
    mov rdi, sys_stdout
    mov rdx, sys_stdout
    syscall
    ret