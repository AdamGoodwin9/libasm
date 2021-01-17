            section .text
            global ft_strcpy

ft_strcpy:
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
