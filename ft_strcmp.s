            section    .text
            global    _ft_strcmp

_ft_strcmp:
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
            xor     rdx, rdx
            sub     dl, BYTE [rsi]
            add     dl, BYTE [rdi]
            movsx   rax, dl
            ret