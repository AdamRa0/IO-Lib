section .data
    test_str: db 'Hello brethren', 0 ; test varible to ensure function works
    new_line: db 0xA ; code for newline
    new_char: db 'c'
    buffer: times 20 db 0
    test_uint: dq -1234 ; testing print_uint function
    input_len: equ 256
    sys_write: equ 1
    sys_read: equ 0
    sys_exit: equ 60
    sys_stdin: equ 0
    sys_stdout: equ 1
    success: equ 0

section .bss
    char_buffer: resb 1
    input_buffer: resb input_len

global _start

section .text

exit:
    mov rdi, success
    mov rax, sys_exit
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
    mov rax, sys_write
    mov rdi, sys_stdout
    mov rdx, sys_stdout
    syscall
    ret

print_string:
    push rdi
    call string_length
    pop rdi

    mov rsi, rdi ; copy test_str to rsi
    mov rdi, sys_stdout ; FD
    mov rdx, rax ; Length of string
    mov rax, sys_write

    syscall
    ret ; return to _start

print_char:
    mov rsi, rdi
    mov rax, sys_write
    mov rdi, sys_stdout
    mov rdx, sys_stdout
    syscall
    ret


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


print_int:
    ; set r8
    xor r8, r8

    ; set divisor
    mov r8, 10

    
    ; check if value is zero
    cmp rdi, 0
    jz .int_zero_case

    lea rsi, [buffer + 19]

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
    xor rdx, rdx

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
    mov byte [rsi], '0'
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

read_char:
    mov rax, sys_read
    mov rsi, rdi
    mov rdi, sys_stdin
    mov rdx, 1
    syscall
    mov rax, rsi
    ret

read_string:
    mov rax, sys_read
    mov rdx, input_len
    mov rdi, sys_stdin
    mov rsi, input_buffer

    syscall

    ret
    
_start:
    ; mov rdi, new_char
    ; mov rdi, test_str
    ; call string_length
    ; call print_string
    ; call print_char
    ; mov rdi, [test_uint]
    ; call print_uint
    ; call print_int
    ; lea rdi, [char_buffer]
    ; call read_char
    ; lea rdi, [char_buffer]
    ; call print_char
    ; call print_newline
    call read_string
    mov rdi, input_buffer
    call print_string
    call exit
