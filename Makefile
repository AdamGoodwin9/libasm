# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agoodwin <agoodwin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/15 14:13:40 by agoodwin          #+#    #+#              #
#    Updated: 2020/12/15 14:21:19 by agoodwin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_strlen.s ft_strcmp.s ft_strcpy.s ft_write.s ft_read.s ft_strdup.s

OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f macho64
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS)

fclean:			clean
				rm -rf $(NAME) $(TEST)

re:				fclean $(NAME)

test:			$(NAME)
				gcc $(FLAGS) -L. -lasm -o $(TEST) main.c
				./$(TEST) < Makefile

.PHONY:			clean fclean re test