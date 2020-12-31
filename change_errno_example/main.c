#include <stdio.h>
#include <errno.h> //commenting out this line will cause a segfault, but their write still works without it so idk
//extern int errno; //uncommenting this line changes nothing unless other line is commented

int change_errno();

int main() {
    printf("%d <- starting errno value\n", errno);
    int ret = change_errno();
    printf("%d <- modified errno value\n", errno);
    printf("%#011x <- address returned\n", ret);
    printf("%p <- true address\n", &errno);
}