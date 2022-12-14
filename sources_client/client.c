/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/23 17:48:00 by gdominic          #+#    #+#             */
/*   Updated: 2022/12/01 19:44:40 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes/minitalk.h"

void	ft_chatobi(unsigned char str, int pid)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((str & (1 << (7 - bit))) == 0)
		{
			if (kill(pid, SIGUSR1) == -1)
				ft_putstr_error("Error\n");
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
				ft_putstr_error("Error\n");
		}
		bit++;
		usleep(400);
	}
}

void	ft_send_sig(int pid, char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		ft_chatobi(str[i], pid);
		i++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
		ft_putstr_error("Error\nNumber of args incorrect\n");
	pid = ft_atoi_plus(argv[1]);
	ft_printf("Valor de pid: %d\n", pid);
	ft_send_sig(pid, argv[2]);
	return (0);
}
