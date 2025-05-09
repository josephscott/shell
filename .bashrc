# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get Mac OS to leave me alone
export BASH_SILENCE_DEPRECATION_WARNING=1

# ENV basics
export LANG="en_US.UTF-8"
export LC_COLLATE="C"
export LC_ALL="C"
export EDITOR="vim"

# Color is usually fine
export CLICOLOR=1
export LSCOLORS=GxFxCxDxbxegedabagaced

# Prompt, good enough, because it never gets to perfect
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\H\[\e[m\] \[\e[36m\]\w\[\e[m\]\\$ "


PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"


export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH


# Easy access, for lazy typing
alias ll="ls -laF --color"

# History
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=5000000




alias tailscale=/Applications/Tailscale.app/Contents/MacOS/Tailscale
alias aider=$HOME/Library/Python/3.9/bin/aider
