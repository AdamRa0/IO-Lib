section .data
    test_str: db 'Hello brethren', 0 ; test varible to ensure function works

global _start

section .text

exit:
    mov rdi, rax
    mov rax, 60
    syscall

; Function finding string length
string_length:
    mov rsi, rdi
    xor rbx, rbx

.loop:
    mov rax, 0

    cmp byte [rsi + rbx], 0
    je .done

    inc rbx

    jmp .loop

; Function printing string
.done:
    mov rax, rbx
    ret

print_string:
    mov rsi, rdi ; copy test_str to rsi
    mov rax, 1 ; Linux sys_write syscall val
    mov rdi, 1 ; FD
    mov rdx, 14 ; Length of test_str
    syscall
    ret ; return to _start

_start:
    mov rdi, test_str
    ;call string_length
    call print_string
    call exit
