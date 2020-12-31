            section     .text
            global      _ft_write

            extern      ___error
_ft_write:
            mov        rax, 0x2000004
            syscall
            ;call       ___error ;still needs to set errno properly and work without #import <errorno.h>
            ret