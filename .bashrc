# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get Mac OS to leave me alone
export BASH_SILENCE_DEPRECATION_WARNING=1

# Color is usually fine
export CLICOLOR=1
export LSCOLORS=GxFxCxDxbxegedabagaced

# Prompt, good enough, because it never gets to perfect
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\H\[\e[m\] \[\e[36m\]\w\[\e[m\]\\$ "

PATH="$HOME/bin:/usr/local/bin:$PATH"

alias EDITOR="vim"

alias ll="ls -laF"

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=10000
