global exit

section .data
    success: equ 0
    sys_exit: equ 60

section .text

exit:
    mov rdi, success
    mov rax, sys_exit
    syscall