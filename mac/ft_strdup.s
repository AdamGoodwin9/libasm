            section .text
            global  _ft_strdup

            extern  _malloc
            extern  _ft_strlen
            extern  _ft_strcpy
            
_ft_strdup:
            call    _ft_strlen
            inc     rax
            push    rdi
            mov     rdi,rax
            call    _malloc
            pop     rsi
            cmp     rax, 0
            je      return
            mov     rdi, rax
            call    _ft_strcpy
return:
            ret