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
#if [ -f $HOME/bash-insulter/src/bash.command-not-found ]; then
#	source $HOME/bash-insulter/src/bash.command-not-found
#fi

# fzf goodness, like menu Ctrl-r (history) and Alt-c (cd dir)
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases
fi

# Avoid having C-s freeze the terminal
stty -ixon

# Add some things to PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export SCIPY_PIL_IMAGE_VIEWER=display

# Make gnome-online-accounts think gnome is running
export XDG_CURRENT_DESKTOP=GNOME

# bash git prompt
#source /usr/share/git/git-prompt.sh
#PS1='[\[\033]0;\u@\h:\w\007\]\[\033[01;32m\[\u@\h\[\033[01;34m\] \W$(__git_ps1 " (%s)")\[\033[00m\]]\$ '
#export GIT_PS1_SHOWDIRTYSTATE=yes

# Wasmtime wasm debugging
#export WASMTIME_HOME="$HOME/.wasmtime"
#export PATH="$WASMTIME_HOME/bin:$PATH"

# Rust binaries
#export PATH=/home/albert/.cargo/bin:$PATH

export GPG_TTY=$(tty)

# System ruby gems
PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Uncomment this if running metasploit
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d $HOME/.rvm ]; then
	export PATH="$PATH:$HOME/.rvm/bin"
	source "$HOME/.rvm/scripts/rvm"
fi
export PGHOST=/tmp
export GITHUB_USERNAME=albertveli
export GITHUB_EMAIL=albert.veli@gmail.com
