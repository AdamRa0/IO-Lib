section .data
    test_str: db 'Hello brethren', 0 ; test varible to ensure function works
    new_line: db 0xA ; code for newline
    new_char: db 'c'
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
    cmp byte [rsi + rbx], 0
    je .done

    inc rbx

    jmp .loop

; Function printing string
.done:
    mov rax, rbx
    ret

print_newline:
    mov rsi, new_line
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

print_string:
    push rdi
    call string_length
    pop rdi

    mov rsi, rdi ; copy test_str to rsi
    mov rdi, 1 ; FD
    mov rdx, rax ; Length of string
    mov rax, 1

    syscall
    ret ; return to _start

print_char:
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall
    ret

_start:
    mov rdi, new_char
    ;mov rdi, test_str
    ; call string_length
    ;call print_string
    call print_char
    call print_newline
    call exit
