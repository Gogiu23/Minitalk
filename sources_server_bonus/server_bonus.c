/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 12:47:52 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/14 11:55:27 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes_bonus/minitalk_bonus.h"

void	ft_sigin_bonus(int signal, siginfo_t *info, void *context)
{
	static int				bit = 0;
	static unsigned char	c = '\0';

	usleep(100);
	(void) context;
	c = c << 1;
	if (signal == SIGUSR1)
		kill(info->si_pid, SIGUSR1);
	else  if (signal == SIGUSR2)
	{
		c = c | 1;
		kill(info->si_pid, SIGUSR1);
	}
	bit++;
	if (bit == 8)
	{
		if (c == '\0')
		{
			usleep(400);
			kill(info->si_pid, SIGUSR2);
		}
		ft_putchar((unsigned char) c);
		bit = 0;
		c = '\0';
	}
}

int	main(int argc, char **argv)
{
	struct sigaction	m1;
	struct sigaction	m2;
	int	pid;

	argv = NULL;
	if (argc != 1)
		ft_putstr_error("Error\nToo many args\n");
	pid = getpid();
	ft_printf("PID: %d\n", pid);
	m1.sa_flags = SA_SIGINFO;
	m1.sa_sigaction = ft_sigin_bonus;
	sigaction(SIGUSR1, &m1, NULL);
	m2.sa_flags = SA_SIGINFO;
	m2.sa_sigaction = ft_sigin_bonus;
	sigaction(SIGUSR2, &m2, NULL);
	while (1)
		pause();
	return (0);
}
