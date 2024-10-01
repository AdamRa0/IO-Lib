global exit

section .data
    sys_exit: equ 60

section .text

exit:
    mov rax, sys_exit
    syscall

section .note.GNU-stack noalloc noexec nowrite progbits