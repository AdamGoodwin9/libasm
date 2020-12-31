    section .text
    global _change_errno

    extern ___error         ; errno.h: int* __error

_change_errno:
    call ___error           ; rax = &errorno
    mov DWORD [rax], 4      ; errorno = 4
    ret                     ; return &errorno