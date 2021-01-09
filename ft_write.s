    global  _ft_write
    extern  ___error

%define SYSCALL_WRITE 0x2000004
%define SYSCALL_FSTAT 0x20000bd

; int ft_write(int rdi, const void *rsi, size_t rdx);
_ft_write:
    push    r9
	mov     rax, SYSCALL_WRITE
	syscall
    push    rax
	cmp     edi, 0          ; if (fd < 0)
	jl      .error
	cmp     edx, 0          ; if (nbyte < 0)
	jl      .error
	cmp     rsi, 0          ; if (buf == NULL)
	je      .error
.fstat_fd_check
    mov     rsi, 0
	mov     rax, SYSCALL_FSTAT
	syscall
	cmp     rax, 9
	je      .error
    pop     rax
    pop     r9
    ret
.error:
    pop     rax
    mov     rdi, rax        ; rdi = rax
    call    ___error        ; rax = &errorno
    mov     [rax], rdi      ; errno = rdi
	mov     rax, -1
    pop     r9
	ret