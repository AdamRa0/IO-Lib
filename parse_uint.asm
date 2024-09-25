global parse_uint

section .text

parse_uint:
    mov rdx, rdi

.atoi:
    xor rax, rax
    xor r8, r8

.loop:
    movzx rcx, byte [rdx]

    cmp rcx, 0x30
    je .done

    cmp rcx, 0x39
    je .done

    cmp rcx, 0xA
    je .done

    sub rcx, 0x30
    imul rax, 10

    add rax, rcx
    inc rdx

    jmp .loop 

.done:
    ret