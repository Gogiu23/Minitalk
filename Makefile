# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/23 20:30:17 by gdominic          #+#    #+#              #
#    Updated: 2022/10/23 22:26:29 by gdominic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

-include sources_server.mk
-include sources_client.mk
-include includes.mk 
-include sources_bonus.mk
-include includes_bonus.mk

#=-=-=-=-=-=-=- COLORS DEFINITION =-=-=-=-=-=-=-=-=-#

BLACK			=	\033[0;30m
RED				=	\033[0;31m
GREEN			=	\033[0;32m
ORANGE			=	\033[0;33m
BLUE			=	\033[0;34m
PURPLE			=	\033[0;35m
CYAN			=	\033[0;36m
LIGHT_GRAY		=	\033[0;37m
DARK_GRAY		=	\033[1;30m
LIGHT_RED		=	\033[1;31m
LIGHT_GREEN		=	\033[1;32m
YELLOW			=	\033[1;33m
LIGHT_BLUE		=	\033[1;34m
LIGHT_PURPLE	=	\033[1;35m
LIGHT_CYAN		=	\033[1;36m
WHITE			=	\033[1;37m
NO_COLOR		=	\033[0m

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

C_NAME			=client
S_NAME			=server

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

MAKE_LIB		= libft.a
CC				= gcc
CFLAGS			= -Wall -Wextra -Werror -I ./libft  
RM				= rm -rf
MKFL			= Makefile
MD				= mkdir -p

#=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=#

INCLUDE_PATH	=./includes

OBJS_SERVER		=$(SOURCES_SERVER:.c=.o)
OBJS_CLIENT		=$(SOURCES_CLIENT:.c=.o)

all:
	$(MAKE) $(S_NAME) $(C_NAME)

$(C_NAME): $(MAKE_LIB) $(OBJS_CLIENT) $(INCLUDES) $(MKFL) $(INCLUDE_PATH)
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH) $(OBJS_CLIENT) $< -o $(C_NAME)
	@printf "\033[2K\r $(BLUE)$(C_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

$(S_NAME): $(MAKE_LIB) $(OBJS_SERVER) $(INCLUDES) $(MKFL) $(INCLUDE_PATH)
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH) $(OBJS_SERVER) $< -o $(S_NAME)
	@printf "\033[2K\r $(BLUE)$(S_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

$(MAKE_LIB):
	make -C libft
	cp libft/libft.a .

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

gmk:
	@find sources_server -name '*.c' | sed 's/^/SOURCES_SERVER += /' > sources_server.mk
	@find sources_client -name '*.c' | sed 's/^/SOURCES_CLIENT += /' > sources_client.mk
	@find includes -name '*.h' | sed 's/^/INCLUDES += /' > includes.mk

#gmk_bonus:
#	@find sources_bonus -name '*.c' | sed 's/^/SOURCES_BONUS += /' > sources_bonus.mk
#	@find includes_bonus -name '*.h' | sed 's/^/INCLUDES_BONUS += /' > includes_bonus.mk

clean:
	@make fclean -C libft
	@$(RM) $(MAKE_LIB)
	@$(RM) $(OBJS) $(OBJS_BONUS)
	@$(RM) a.out
	@echo "Cleaning all the .o in your libft and project!"

fclean: clean
	@$(RM) $(NAME) $(NAME_BONUS)
	@echo "Cleaning all the compiled library!"

re: fclean all

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

.PHONY: all clean fclean re gmk bonus gmk_bonus

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
