nasm -f macho64 change_errno.s
gcc -Wall -Werror -Wextra -o tmp.out main.c change_errno.o
./tmp.out
rm tmp.out change_errno.o