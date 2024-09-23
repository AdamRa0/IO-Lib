global print_string
extern string_length

section .data
    sys_stdout: equ 1
    sys_write: equ 1

section .text

print_string:
    push rdi
    call string_length
    pop rdi

    mov rsi, rdi ; copy test_str to rsi
    mov rdi, sys_stdout ; FD
    mov rdx, rax ; Length of string
    mov rax, sys_write

    syscall
    ret ; return to _start