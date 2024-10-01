global cmp_string

section .text

cmp_string:
    mov al, byte[rsi]
    mov bl, byte[rdi]

    cmp al, bl
    jne .str_not_equal

    test al, bl
    je .str_equal

    inc rdi
    inc rsi
    jmp cmp_string

.str_not_equal:
    xor rax, rax
    ret

.str_equal:
    mov rax, 1
    ret