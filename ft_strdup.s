            section .text
            global  _ft_strdup

            extern  _malloc
            extern  _ft_strlen
            extern  _ft_strcpy
_ft_strdup:
            call    _ft_strlen
            inc     rax
            mov     rdi, rax
            push    rdi
            call    _malloc
            pop     rdi
            ; rax has address returned by _malloc
            ; rdi will be 12, need to set rdi and rsi before call to _ft_strcpy
            ret