
#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

-include sources.mk
-include includes.mk 
-include sources_bonus.mk
-include includes_bonus.mk

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

NAME			=minitalk
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

OBJS			=$(SOURCES:.c=.o)

all:
	$(MAKE) $(NAME)

$(NAME): $(MAKE_LIB) $(OBJS) $(INCLUDES) $(MKFL) $(INCLUDE_PATH)
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH) $(OBJS) $< -o $@
	@printf "\033[2K\r$(YELLOW)$(NAME): $(LIGHT_BLUE)$<$(RESET)"
	@printf "\033[2K\r$(BLUE)$(NAME): $(GREEN)Push_swap Compiled and ready![√]$(RESET)\n"

$(MAKE_LIB):
	make -C libft
	cp libft/libft.a .

#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

#=-=-=-=-=-=-=-=-=- BONUS =-=-=-=-=-=-=-=-=-=-=-=-=-#

NAME_BONUS			= 

INCLUDE_PATH_BONUS	=./includes_bonus

OBJS_BONUS			=$(SOURCES_BONUS:.c=.o)

bonus:
	$(MAKE) $(NAME_BONUS)

$(NAME_BONUS): $(MAKE_LIB) $(OBJS_BONUS) $(MKFL)
	$(CC) $(CFLAGS) -I $(INCLUDE_PATH_BONUS) $(OBJS_BONUS) $< -o $@
	@printf "\033[2K\r$(BLUE)$(NAME): $(GREEN)Bonus compiled and ready[√]$(RESET)\n"
	
#=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-#

gmk:
	@find sources -name '*.c' | sed 's/^/SOURCES += /' > sources.mk
	@find includes -name '*.h' | sed 's/^/INCLUDES += /' > includes.mk

gmk_bonus:
	@find sources_bonus -name '*.c' | sed 's/^/SOURCES_BONUS += /' > sources_bonus.mk
	@find includes_bonus -name '*.h' | sed 's/^/INCLUDES_BONUS += /' > includes_bonus.mk

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
