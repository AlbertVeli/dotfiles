alias msfconsole="pushd $HOME/source/other_sources/metasploit-framework && ./msfconsole && popd"
function git-current-branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
#export PS1="[ruby-\$(~/.rvm/bin/rvm-prompt v p g)]\$(git-current-branch)\n$PS1"
alias cdr='cd $(git rev-parse --show-toplevel)'
