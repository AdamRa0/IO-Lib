global print_int

section .data
    buffer_len: equ 20
    sys_stdout: equ 1
    sys_write: equ 1

section .bss
    buffer: resb buffer_len

section .text
print_int:
    ; set r8
    xor r8, r8

    ; set divisor
    mov r8, 10

    
    ; check if value is zero
    cmp rdi, 0
    jz .int_zero_case

    lea rsi, [buffer + 19]

    movsxd rdi, edi
    ; check if value is negative
    test rdi, rdi
    js .negative_int_conversion_loop

    ; move uint value to rax
    mov rax, rdi

.int_conversion_loop:
    xor rdx, rdx
    idiv r8
    ; convert int to char
    add rdx, 0x30

    ; move char to rsi
    mov [rsi], dl

    ; move rsi pointer one byte back
    dec rsi

    test rax, rax
    jnz .int_conversion_loop

    inc rsi
    jmp .print_int_done

.negative_int_conversion_loop:
    neg rdi; convert to positive

    mov rax, rdi

.neg_loop:
    xor rdx, rdx
    idiv r8
    ; convert int to char
    add rdx, 0x30

    ; move char to rsi
    mov [rsi], dl

    ; move rsi pointer one byte back
    dec rsi

    test rax, rax
    jnz .neg_loop

    mov byte [rsi], '-'
    jmp .print_int_done

.int_zero_case:
    xor r9, r9
    mov r9,  1
    mov byte [buffer + 19], '0'
    jmp .print_int_done

.print_int_done:
    mov rsi, buffer
    jmp .print_int_number

.print_int_number:
    mov rdx, buffer + 20
    sub rdx, rsi
    mov rax, sys_write
    mov rdi, sys_stdout
    syscall
    ret

section .note.GNU-stack noalloc noexec nowrite progbits