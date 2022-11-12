/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 12:36:46 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/12 18:30:43 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes_bonus/minitalk_bonus.h"

void	ft_send_signal(int pid, char **str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		ft_chatobi(str[i]);
		i++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	pid = ft_atoi_plus(argv[1]);
	if (argc != 3)
		ft_putstr_error("Error, incorrect number of arguments");
	ft_printf("PID: %d\n", pid);
	ft_send_signal(pid, argv[2]);
}
