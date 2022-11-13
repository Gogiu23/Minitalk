/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk_bonus.h                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/12 12:38:22 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/13 19:24:13 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_BONUS_H
# define MINITALK_BONUS_H

# include <stdio.h>
# include <stdlib.h>
# include <sys/types.h>
# include <unistd.h>
# include <signal.h>

//=-=-=-=-=-=-=-= FUNCTIONS IN CLIENT =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void	ft_chatobi_bonus(unsigned char str, int pid);
void	ft_sig_handler(int signal);
void	ft_send_signal(int pid, char *str);

//=-=-=-=-=-=-=-= FUNCTIONS IN SERVER =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
void	ft_sigin_bonus(int signal, siginfo_t *info, void *context);

#endif
