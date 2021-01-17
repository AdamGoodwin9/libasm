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

int		ft_strlen(char const *str);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(const char *s1);

void	strlen_test(void)
{
	char *s;

	s = "Hello World";
	printf("Mine: %d\n", ft_strlen(s));
	printf("Them: %d\n", (int)strlen(s));
}

void	strcpy_test(void)
{
	char *s;
	char dest1[20];
	char dest2[20];

	s = "Hello World";
	printf("Mine: %s, dest = %s\n", ft_strcpy(dest1, s), dest1);
	printf("Them: %s, dest = %s\n", strcpy(dest2, s), dest2);
}

void	strcmp_test(void)
{
	char *s1;
	char *s2;

	s1 = "\14";
	s2 = "";
	printf("Mine: %d\n", ft_strcmp(s1, s2));
	printf("Them: %d\n", strcmp(s1, s2));
}

void	write_tester(int fd, char *buf, int nbyte)
{
	printf("- (%zd, ", ft_write(fd, buf, nbyte));
	printf("%d)\n", errno);
	printf("- (%zd, ", write(fd, buf, nbyte));
	printf("%d)\n\n", errno);
}

void	write_test(void)
{
	char *test;

	test = "hellooooooo";
	write_tester(1, test, 6);
	write_tester(1, test - 100000, 6);
	write_tester(-5, test, 6);
	write_tester(30, test, 6);
	write_tester(1, test, -5);
	write_tester(1, NULL, 6);
}

void	read_test(void)
{
	char c;

	while (ft_read(STDIN_FILENO, &c, 1) > 0)
	{
		if (c == '*')
			break ;
		printf("%c", c);
	}
}

void	strdup_test(void)
{
	char *s;

	s = "lakdjfalkdjflakjdfladlfkjadlkfjakjdf";
	printf("Them: %s\n", strdup(s));
	printf("Mine: %s\n", ft_strdup(s));
}

int		main(void)
{
	printf("BEGIN\n\n\n\n");
	strdup_test();
	printf("\n\n\nEND\n");
}
