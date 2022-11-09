/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   minitalk.h                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gdominic <gdominic@student.42barcelona.co  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/22 20:48:01 by gdominic          #+#    #+#             */
/*   Updated: 2022/11/09 01:45:21 by gdominic         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MINITALK_H
# define MINITALK_H

# include <stdio.h>
# include <stdlib.h>
# include <sys/types.h>
# include <unistd.h>
# include <signal.h>

//=-=-=-=-=-=-=-=-=-=-= SEND SIGNAL =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
void	ft_send_sig(int pid, char *str);
void	ft_chatobi(unsigned char str, int pid);

//=-=-=-=-=-=-=-=-=-=-= IN SIGNAL =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
void	ft_sigin(int signal);

#endif
