/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/23 17:58:09 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/12 12:26:00 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes/minitalk.h"

void	ft_sigin(int signal)
{
	static int				bit = 0;
	static unsigned char	c = '\0';

	c = c << 1;
	if (signal == SIGUSR1)
	{
	}
	else
		c = c | 1;
	bit++;
	if (bit == 8)
	{
		ft_putchar((unsigned char ) c);
		bit = 0;
		c = '\0';
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	pid = getpid();
	argv = NULL;
	if (argc != 1)
		ft_putstr_error("Error\nToo many arguments");
	ft_printf("PID: %d\n", pid);
	signal(SIGUSR1, &ft_sigin);
	signal(SIGUSR2, &ft_sigin);
	while (1)
		pause();
	return (0);
}
