/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: agoodwin <agoodwin@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/12/15 14:24:27 by agoodwin          #+#    #+#             */
/*   Updated: 2020/12/15 15:09:09 by agoodwin         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int ft_strlen(char const *str);

int main()
{
    char* s = "Hello World";

    printf("Mine: %d\n", ft_strlen(s));
    printf("Them: %d\n", (int)strlen(s));
}
