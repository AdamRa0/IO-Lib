global string_length

section .text

; Function finding string length
string_length:
    mov rsi, rdi
    xor rbx, rbx

.loop:
    cmp byte [rsi + rbx], 0
    je .done

    inc rbx

    jmp .loop

; Function printing string
.done:
    mov rax, rbx
    ret