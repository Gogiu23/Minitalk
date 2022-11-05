/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/23 17:58:09 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/05 14:09:55 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes/minitalk.h"

void	ft_sigin(int signal)
{
	int				bit;
	unsigned char	c;

	ft_printf("XD");
	bit = 0;
	c = '\0';
	c = c << 1;
	if (signal == SIGUSR1)
	{
	}
	else
		c = c | 1;
	bit++;
	if (bit == 8)
	{
		write(1, &c, 1);
//		ft_putchar(c);
		bit = 0;
		c = '\0';
	}
}

int	main(int argc, char **argv)
{
	getpid();
	ft_printf("PID: (%d)\n", getpid());
	argv = NULL;
	if (argc != 1)
		ft_putstr_error("Error\nToo many arguments");
	signal(SIGUSR1, &ft_sigin);
	signal(SIGUSR2, &ft_sigin);
	while (1)
		pause();
	return(0);
}
