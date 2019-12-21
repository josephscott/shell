# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get Mac OS to leave me alone
export BASH_SILENCE_DEPRECATION_WARNING=1

# Color is usually fine
export CLICOLOR=1
export LSCOLORS=GxFxCxDxbxegedabagaced

PATH="$HOME/bin:/usr/local/bin:$PATH"

alias EDITOR="vim"

alias ll="ls -laF"
