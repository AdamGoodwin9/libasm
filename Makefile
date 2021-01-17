# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agoodwin <agoodwin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/15 14:13:40 by agoodwin          #+#    #+#              #
#    Updated: 2020/12/17 16:18:27 by agoodwin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	src/ft_strlen.s \
				src/ft_strcpy.s \
				src/ft_strcmp.s \
				src/ft_write.s \
				src/ft_read.s \
				src/ft_strdup.s

MAC_SRCS	=	mac/ft_strlen.s \
				mac/ft_strcpy.s \
				mac/ft_strcmp.s \
				mac/ft_write.s \
				mac/ft_read.s \
				mac/ft_strdup.s

OBJS		=	$(SRCS:.s=.o)
MAC_OBJS	=	$(MAC_SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f elf64
NA_FLAGS_MAC =	-f macho64
FLAGS 		=	-Wall -Werror -Wextra -no-pie
FLAGS_MAC	=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test.out

src/%.o:		src/%.s
				$(NA) $(NA_FLAGS) $<

mac/%.o:		mac/%.s
				$(NA) $(NA_FLAGS_MAC) $<

all:			$(NAME)

$(NAME):		$(OBJS)
			ar rcs $(NAME) $(OBJS)

mac:			$(MAC_OBJS)
			ar rcs $(NAME) $(MAC_OBJS)

clean:
			rm -rf $(OBJS)

clean_mac:
			rm -rf $(MAC_OBJS)

fclean:			clean
			rm -rf $(NAME) $(TEST)

fclean_mac:		clean_mac
			rm -rf $(NAME) $(TEST)

re:			fclean $(NAME)

re_mac:		fclean mac

test:			$(NAME)
			gcc main.c $(FLAGS) -L. -lasm -o $(TEST)
			./$(TEST)

test_mac:		mac
			gcc main.c $(FLAGS_MAC) -L. -lasm -o $(TEST)
			./$(TEST)

good:			test fclean

good_mac:		test_mac fclean_mac

.PHONY:			clean fclean re test
