
# good enough, because I can never find perfect
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\H\[\e[m\] \[\e[36m\]\w\[\e[m\]\\$ "

# tired of typing
alias ll='ls -laF'

# env basics
export LANG="en_US.UTF-8"
export LC_COLLATE="C"
export LC_ALL="C"
export EDITOR="vim"

# color the world
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# history
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
