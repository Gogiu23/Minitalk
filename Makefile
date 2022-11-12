# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/23 20:30:17 by gdominic          #+#    #+#              #
#    Updated: 2022/11/12 01:48:41 by gdominic         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

-include sources_server.mk
-include sources_client.mk
-include includes.mk 
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

NAME			=minitalk
C_NAME			=client
S_NAME			=server

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

MAKE_LIB		= libft/libft.a
CC				= gcc
CFLAGS			= -Wall -Wextra -Werror -g -MMD -MP 
RM				= rm -rf
MKFL			= Makefile
MD				= mkdir -p
LIB_DIR			= ./libft/includes/

#=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-=-=#

INCLUDE_PATH	=./includes

OBJS_SERVER		=$(SOURCES_SERVER:.c=.o)
OBJS_CLIENT		=$(SOURCES_CLIENT:.c=.o)

DEPS_SERVER		=$(SOURCES_SERVER:.c=.d)
DEPS_CLIENT		=$(SOURCES_CLIENT:.c=.d)

all:
	$(MAKE) -C libft
	$(MAKE) $(NAME)

$(NAME):
	$(MAKE) $(C_NAME)
	$(MAKE) $(S_NAME)

%.o:	%.c $(MKFL) $(MAKE_LIB)
	@printf "\r\033[2K\r$(YELLOW)$(NAME): $(LIGHT_BLUE)$<$(RESET)		\r"
	@$(CC) $(CFLAGS) -I $(INCLUDE_PATH) -I $(LIB_DIR) -c $< -o $@
	@printf "\r\033[2K\r$(YELLOW)Done......✅ $(LIGHT_BLUE)$<$(RESET)		\n"

$(C_NAME): $(OBJS_CLIENT)
	@$(CC) $(CFLAGS) -I $(INCLUDE_PATH) $(OBJS_CLIENT) $(MAKE_LIB) -o $(C_NAME)
	@printf "\033[2K\r $(BLUE)$(C_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

$(S_NAME): $(OBJS_SERVER)
	@$(CC) $(CFLAGS) -I $(INCLUDE_PATH) $(OBJS_SERVER) $(MAKE_LIB) -o $(S_NAME)
	@printf "\033[2K\r $(BLUE)$(S_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

#=-=-=-=-=-=-=-=-=-= BONUS -=-=-=-=-=-=-=-=-=-=-=-=-#

NAME_BONUS				=minitalk_bonus
C_BONUS_NAME			=client_bonus
S_BONUS_NAME			=server_bonus


INCLUDE_PATH_BONUS		=./includes_bonus

OBJS_SERVER_BONUS		=$(SOURCES_SERVER_BONUS:.c=.o)
OBJS_CLIENT_BONUS		=$(SOURCES_CLIENT_BONUS:.c=.o)

DEPS_SERVER_BONUS		=$(SOURCES_SERVER_BONUS:.c=.d)
DEPS_CLIENT_BONUS		=$(SOURCES_CLIENT_BONUS:.c=.d)

bonus:
	$(MAKE) -C libft
	$(MAKE) $(NAME_BONUS)

$(NAME_BONUS):
	$(MAKE) $(C_BONUS_NAME)
	$(MAKE) $(S_BONUS_NAME)

$(C_BONUS_NAME): $(MAKE_LIB) $(OBJS_CLIENT_BONUS)
	@$(CC) $(CFLAGS) -I $(INCLUDE_PATH_BONUS) $(OBJS_CLIENT_BONUS) $(MAKE_LIB) -o $(C_BONUS_NAME)
	@printf "\033[2K\r$(YELLOW)$(C_BONUS_NAME): $(LIGHT_BLUE)$<$(RESET)"
	@printf "\033[2K\r $(BLUE)$(C_BONUS_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

$(S_BONUS_NAME): $(MAKE_LIB) $(OBJS_SERVER_BONUS)
	@$(CC) $(CFLAGS) -I $(INCLUDE_PATH_BONUS) $(OBJS_SERVER_BONUS) $(MAKE_LIB) -o $(S_BONUS_NAME)
	@printf "\033[2K\r$(YELLOW)$(S_BONUS_NAME): $(LIGHT_BLUE)$<$(RESET)"
	@printf "\033[2K\r $(BLUE)$(S_BONUS_NAME): $(ORANGE) Compiled and ready![√]$(RESET)\n"

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=#
	
gmk:
	@find sources_server -name '*.c' | sed 's/^/SOURCES_SERVER += /' > sources_server.mk
	@find sources_client -name '*.c' | sed 's/^/SOURCES_CLIENT += /' > sources_client.mk
	@find includes -name '*.h' | sed 's/^/INCLUDES += /' > includes.mk

gmk_bonus:
	@find sources_bonus -name '*.c' | sed 's/^/SOURCES_BONUS += /' > sources_bonus.mk
	@find includes_bonus -name '*.h' | sed 's/^/INCLUDES_BONUS += /' > includes_bonus.mk

clean:
	@make fclean -C libft
	@$(RM) $(MAKE_LIB)
	@$(RM) $(S_NAME)
	@$(RM) $(C_NAME)
	@$(RM) $(OBJS_CLIENT) $(OBJS_SERVER)
	@$(RM) $(DEPS_CLIENT) $(DEPS_SERVER)
	@$(RM) a.out
	@echo "Cleaning all the .o in your libft and project!"

fclean: clean
	@$(RM) $(NAME) $(NAME_BONUS)
	@echo "Cleaning all the compiled library!"

re: fclean all

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

-include $(DEPS_SERVER)
-include $(DEPS_CLIENT)
-include $(DEPS_CLIENT_BONUS)
-include $(DEPS_SERVER_BONUS)

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

.PHONY: all clean fclean re gmk bonus gmk_bonus

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#
