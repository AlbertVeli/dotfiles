# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# For building
export TFTPDIR=albert@dunkelstern.westermo.com:/tftpboot/
export DOWNLOADS=$HOME/Westermo/downloads/

# bash insulter!
if [ -f $HOME/bash-insulter/src/bash.command-not-found ]; then
	source $HOME/bash-insulter/src/bash.command-not-found
fi

# fzf goodness, like menu Ctrl-r (history) and Alt-c (cd dir)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add some things to PATH
export PATH=$PATH:$HOME/bin

# Make gnome-online-accounts think gnome is running
export XDG_CURRENT_DESKTOP=GNOME
