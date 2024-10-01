global parse_int

section .text

parse_int:
    mov rdx, rdi

.atoi:
    xor rax, rax
    xor r8, r8 ;This will be our sign flag. 1 for negative, 0 for positive

    movzx rcx, byte [rdx] ; Read first character

    cmp rcx, '-'
    je .negative_number

    jmp .parse_number

.negative_number:
    mov r8, 1
    inc rdx
    jmp .parse_number

.parse_number:
    movzx rcx, byte [rdx]

    cmp rcx, 0x30
    jl .done

    cmp rcx, 0x39
    jg .done

    cmp rcx, 0xA
    je .done

    sub rcx, 0x30
    imul rax, 10

    add rax, rcx
    inc rdx

    jmp .parse_number

.done:
    test r8, r8
    jz .return

    neg rax

.return:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits