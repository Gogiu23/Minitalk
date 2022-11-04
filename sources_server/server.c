/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/23 17:58:09 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/04 19:16:10 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../libft/includes/libft.h"
#include "../includes/minitalk.h"

int	main(void)
{
	getpid();
	ft_printf("PID: (%d)\n", getpid());
//	signal(SIGUSR1, sig_hand);
}

//void	sig_hand(
