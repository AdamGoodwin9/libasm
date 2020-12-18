            section .text
            global _ft_strcpy

_ft_strcpy:
            mov rax, rdi
            cmp     rsi,0
            je      return
loop:
            movsb
            cmp BYTE [rsi], 0
            jne loop
            movsb
return:
            ret