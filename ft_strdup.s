            section .text
            global  _ft_strdup

            extern  _malloc
            extern  _ft_strlen
            extern  _ft_strcpy
            
_ft_strdup:
            call    _ft_strlen
            inc     rax
            mov     rbx,rdi
            xor     rdi,rdi
            push    rdi
            call    _malloc
            pop     rdi
            mov     rdi,rbx
            cmp     rax, 0
            je      fail
            mov     rsi, rdi
            mov     rdi, rax
            call    _ft_strcpy
            ret
fail:
            xor     rax,rax
            ret