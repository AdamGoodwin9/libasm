    section .text
    global  ft_read
    extern  __errno_location

%define SYSCALL_READ 0

; ssize_t read(int rdi, void *rsi, size_t rdx);
ft_read:
    push    r9
    mov     rax, SYSCALL_READ
	syscall						; if fails, CF = 1, else CF = 0
	cmp rax, 0 
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
