/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agoodwin <agoodwin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/15 14:24:27 by agoodwin          #+#    #+#             */
/*   Updated: 2020/12/17 15:36:22 by agoodwin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char const *str);
char* ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);

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
    char* s1 = "Hello World";
    char* s2 = "Helga";

    printf("Them: %d\n", strcmp(s1, s2));
    printf("Mine: %d\n", ft_strcmp(s1, s2));
}

int main()
{
    strcmpTest();
}
