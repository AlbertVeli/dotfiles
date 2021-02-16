# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Only on OSX
if test "`uname -s`" = "Darwin"; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced

    # Bash completions
    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

fi
archey
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
