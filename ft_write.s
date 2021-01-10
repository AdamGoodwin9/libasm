    section	.text
	global  _ft_write
    extern  ___error

%define SYSCALL_WRITE 0x2000004

; int ft_write(int rdi, const void *rsi, size_t rdx);
_ft_write:
    push    r9
	mov     rax, SYSCALL_WRITE
	syscall						; if fails, CF = 1, else CF = 0
	jc		.error				; if (CF == 1)
    pop     r9
    ret
.error:
    mov     rdx, rax
    call    ___error        ; rax = &errorno
    mov     [rax], rdx      ; errno = rdi
	mov     rax, -1
    pop     r9
	ret