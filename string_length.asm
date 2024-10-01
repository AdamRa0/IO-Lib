global string_length

section .text

; Function finding string length
string_length:
    mov rsi, rdi
    xor rcx, rcx

.loop:
    cmp byte [rsi + rcx], 0
    je .done

    inc rcx

    jmp .loop

; Function printing string
.done:
    mov rax, rcx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits