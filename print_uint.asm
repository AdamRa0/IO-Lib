global print_uint

section .data
    buffer_len: equ 20
    sys_stdout: equ 1
    sys_write: equ 1

section .bss
    buffer: resb buffer_len

section .text

print_uint:
    ; set r8 and r9 to zero
    xor r8, r8
    ; set divisor
    mov r8, 10

    ; check if value is zero
    cmp rdi, 0
    jz .zero_case

    ; move uint value to rax
    mov rax, rdi
    lea rsi, [buffer + 19]

.conversion_loop:
    xor rdx, rdx
    div r8
    ; convert int to char
    add rdx, 0x30

    ; move char to rsi
    mov [rsi], dl

    ; move rsi pointer one byte back
    dec rsi

    test rax, rax
    jnz .conversion_loop

    inc rsi
    jmp .print_uint_done

.zero_case:
    xor r9, r9
    mov r9,  1
    mov byte [rsi], '0'
    jmp .print_uint_done

.print_uint_done:
    mov rsi, buffer
    jmp .print_number

.print_number:
    mov rdx, buffer + 20
    sub rdx, rsi
    mov rax, sys_write
    mov rdi, sys_stdout
    syscall
    ret