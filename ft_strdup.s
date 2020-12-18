            section .text
            global _ft_strdup

            extern _malloc
            extern _ft_strlen

_ft_strdup:

            xor rax,rax
            ret