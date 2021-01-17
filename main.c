/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agoodwin <agoodwin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/15 14:24:27 by agoodwin          #+#    #+#             */
/*   Updated: 2021/01/10 13:23:42 by agoodwin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int ft_strlen(char const *str);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
char *ft_strdup(const char *s1);

extern int errno;

void strlenTest()
{
    char* s = "Hello World";

    printf("Mine: %d\n", ft_strlen(s));
    printf("Them: %d\n", (int)strlen(s));
}

void strcpyTest()
{
    char* s = "Hello World";
    char dest1[20];
    char dest2[20];
    
    printf("Mine: %s, dest = %s\n", ft_strcpy(dest1, s), dest1);
    printf("Them: %s, dest = %s\n", strcpy(dest2, s), dest2);
}

void strcmpTest()
{
    char* s1 = "\14";
    char* s2 = "";

    printf("Mine: %d\n", ft_strcmp(s1, s2));
    printf("Them: %d\n", strcmp(s1, s2));
}

void writeTester(int fd, char* buf, int nbyte)
{
    printf("- (%zd, ", ft_write(fd, buf, nbyte));
    printf("%d)\n", errno);

    printf("- (%zd, ", write(fd, buf, nbyte));
    printf("%d)\n", errno);
}

void writeTest()
{
    char* test = "helloooooooooooooooo";
    
    writeTester(1, test, 6);
    writeTester(1, test - 100000, 6);
    writeTester(-5, test, 6);
    writeTester(30, test, 6);
    writeTester(1, test, -5);
    writeTester(1, NULL, 6);
}

void readTest()
{
    char c;
    while(ft_read(STDIN_FILENO, &c, 1) > 0)
    {
        if(c == '*') break;
        printf("%c", c);
    }
}

void strdupTest()
{
    char s[] = "lakdjfalkdjflakjdfladlfkjadlkfjakjdf";
    
    printf("Them: %s\n", strdup(s));
    printf("Mine: %s\n", ft_strdup(s));
}

int main()
{
    printf("BEGIN\n\n\n\n");
    readTest();
    printf("\n\n\nEND\n");
}
