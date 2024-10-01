global string_copy

section .data

string_copy:
    cmp rdx, 0 ; if empty string
    je .empty_string_or_copy_incomplete

.loop:
    mov al, byte[rdi]
    test al, al
    je .empty_string_or_copy_incomplete

    mov [rsi], al
    dec rdx
    inc rsi
    inc rdi

    test rdx, rdx
    jnz .loop

.handle_buffer_size_exhausted:
    mov rax, rsi
    ret

.empty_string_or_copy_incomplete:
    mov rax, 0
    ret
