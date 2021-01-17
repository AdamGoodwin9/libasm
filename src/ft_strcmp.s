            section    .text
            global    ft_strcmp

ft_strcmp:
            jmp     loop
equal:
            cmp     BYTE [rsi],0
            je      finish
loop:
            cmpsb
            je      equal
            dec     rsi
            dec     rdi
finish:
            xor     rax, rax
            movzx   rdx, BYTE [rdi]
            add     rax, rdx
            movzx   rdx, BYTE [rsi]
            sub     rax, rdx
            ret
