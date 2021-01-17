    section	.text
	global  ft_write
    extern  __errno_location

%define SYSCALL_WRITE 1

; int ft_write(int rdi, const void *rsi, size_t rdx);
ft_write:
    push    r9
	mov     rax, SYSCALL_WRITE
	syscall						; if fails, CF = 1, else CF = 0
	cmp     rax, 0
	jl		.error				; if (CF == 1)
    pop     r9
    ret
.error:
    neg     rax
    mov     rdx, rax
    call    __errno_location        ; rax = &errorno
    mov     [rax], rdx      ; errno = rdi
    mov     rax, -1
    pop     r9
    ret
