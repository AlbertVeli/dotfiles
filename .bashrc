# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000
HISTTIMEFORMAT='%Y/%m/%d %T -> '

# For building
#export TFTPDIR=albert@wrdc140.westermo.com:/tftpboot
export TFTPDIR=/srv/tftp
export DOWNLOADS=$HOME/Westermo/downloads/

# bash insulter!
#if [ -f $HOME/bash-insulter/src/bash.command-not-found ]; then
#      source $HOME/bash-insulter/src/bash.command-not-found
#fi

# Avoid having C-s freeze the terminal
stty -ixon

# Add some things to PATH
export PATH=$PATH:$HOME/bin
# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export SCIPY_PIL_IMAGE_VIEWER=display
export EDITOR=vim

# Rust
# Rust binaries
#export PATH=/home/albert/.cargo/bin:$PATH

# Gpg over ssh fix
export GPG_TTY=$(tty)

# pip3 --user directory
export PATH="$PATH:$(python3 -m site --user-base)/bin"

# Make gnome-online-accounts think gnome is running
# export XDG_CURRENT_DESKTOP=GNOME

# System ruby gems
#PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Uncomment this if running metasploit
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#if [ -d $HOME/.rvm ]; then
#      export PATH="$PATH:$HOME/.rvm/bin"
#      source "$HOME/.rvm/scripts/rvm"
#fi
#export PGHOST=/tmp

export GITHUB_USERNAME=albertveli
export GITHUB_EMAIL=albert.veli@gmail.com

export LC_CTYPE=en_US.UTF-8

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Intel OneAPI, uncomment this if you get
# error while loading shared libraries: libsvml.so
#source /opt/intel/oneapi/setvars.sh

if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
elif [ -f /etc/profile.d/bash_completion.sh ]; then
	source /usr/local/etc/profile.d/bash_completion.sh
fi
