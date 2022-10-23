/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/23 17:48:00 by gdominic          #+#    #+#             */
/*   Updated: 2022/10/23 22:26:12 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft/includes/libft.h"
#include "includes/minitalk.h"

int	main(int argc, char **argv)
{
	int	pid;

	pid = ft_atoi_plus(argv[1]);
	if (argc != 3)
		return (-1);
	ft_printf("Valor de pid: %d\n", pid);
}
