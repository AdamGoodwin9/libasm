    section .text
    global  _ft_read
    extern  ___error

%define SYSCALL_READ 0x2000003

; ssize_t read(int rdi, void *rsi, size_t rdx);
_ft_read:
    push    r9
    mov     rax, SYSCALL_READ
	syscall						; if fails, CF = 1, else CF = 0
	push	rax
	jc		.error				; if (CF == 1)
    pop     rax
    pop     r9
    ret
.error:
    pop     rdi
    call    ___error        ; rax = &errorno
    mov     [rax], rdi      ; errno = rdi
	mov     rax, -1
    pop     r9
	ret