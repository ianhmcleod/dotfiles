alias gs='git status'
alias c='clear'
alias gd='git diff'
alias gp='git push origin'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export LSCOLORS=ExFxBxDxCxegedabagacad
export GROOVY_HOME=/usr/local/opt/groovy/libexec
