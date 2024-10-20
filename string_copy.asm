global string_copy

section .text

string_copy:
    cmp rdx, 0
    je .empty_string_or_copy_incomplete

.loop:
    mov al, byte [rdi]
    test al, al
    je .done

    mov [rsi], al
    inc rsi
    inc rdi
    dec rdx

    test rdx, rdx
    jnz .loop

.handle_buffer_size_exhausted:
    mov byte [rsi], 0
    jmp .done

.done:
    mov rax, rsi
    ret

.empty_string_or_copy_incomplete:
    mov rax, 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits