
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get Mac OS to leave me alone
export BASH_SILENCE_DEPRECATION_WARNING=1

PATH="$HOME/bin:$PATH"

alias EDITOR="vim"

alias ll="ls -laF"
