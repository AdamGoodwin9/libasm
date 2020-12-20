            section .text
            global  _ft_strdup

            extern  _malloc
            extern  _ft_strlen
            extern  _ft_strcpy
            
_ft_strdup:
            call    _ft_strlen
            inc     rax
            push    rdi
            xor     rdi,rdi
            call    _malloc
            cmp     rax, 0
            je      fail
            mov     rsi, rdi
            mov     rdi, rax
            call    _ft_strcpy
            ret
fail:
            xor     rax,rax
            ret