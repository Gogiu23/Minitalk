/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 12:36:46 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/13 19:40:48 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes_bonus/minitalk_bonus.h"

void	ft_sig_handler(int signal)
{
	if (signal == SIGUSR1)
	{
		usleep(100);
		ft_printf("Bit sent\n");
	}
	else if (signal == SIGUSR2)
	{
		ft_printf("Message received\n");
		exit (1);
	}
}

void	ft_chatobi_bonus(unsigned char str, int pid)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((str & (1 << (7 - bit))) == 0)
		{
			if (kill(pid, SIGUSR1) == -1)
				ft_putstr_error("Error\n");
			signal(SIGUSR1, &ft_sig_handler);
			pause();
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
				ft_putstr_error("Error\n");
			signal(SIGUSR2, &ft_sig_handler);
			pause();
		}
		bit++;
		usleep(1000);
	}
}

void	ft_send_signal(int pid, char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		ft_chatobi_bonus(str[i], pid);
		i++;
	}
	ft_chatobi_bonus(str[i], pid);
}

int	main(int argc, char **argv)
{
	int	pid;

	pid = ft_atoi_plus(argv[1]);
	if (argc != 3)
	{
		ft_putstr_error("Error, incorrect number of arguments");
		exit (-1);
	}
	ft_printf("PID: %d\n", pid);
	ft_send_signal(pid, argv[2]);
	pause();
	return (0);
}
