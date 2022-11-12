/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 12:47:52 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/12 21:16:04 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes_bonus/minitalk_bonus.h"
#include "../libft/includes/libft.h"

void	ft_sigin(int signal, siginfo_t *info, void *context)
{
	
}

int	main(void)
{
	struct sigaction	m1;
	struct sigaction	m2;
	int	pid;

	pid = getpid();
	ft_printf("PID: %d\n", pid);
	m1.sa_flags = SA_SIGINFO;
	m2.sa_sigaction = &ft_sigin;
	sigaction(SIGUSR1, &m1, NULL);
	m1.sa_flags = SA_SIGINFO;
	m2.sa_sigaction = &ft_sigin;
	sigaction(SIGUSR2, &m2, NULL);
	while (1)
		pause();
	return (0);
}
