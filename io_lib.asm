section .data
    test_str: db 'Hello brethren', 0 ; test varible to ensure function works

global _start

section .text

exit:
    mov rdi, rax
    mov rax, 60
    syscall

string_length:
    mov rsi, rdi
    xor rbx, rbx

.loop:
    mov rax, 0

    cmp byte [rsi + rbx], 0
    je .done

    inc rbx

    jmp .loop
    

.done:
    mov rax, rbx
    ret

_start:
    mov rdi, test_str
    call string_length
    call exit
