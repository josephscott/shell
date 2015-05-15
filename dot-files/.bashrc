
# path
PATH="$HOME/bin:$PATH"

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

# OS specific
case "$OSTYPE" in
	darwin*)
		;;
	linux*)
		alias ll='ls -laF --color'
		export LS_COLORS='di=1;36;40:ln=1;35;40:so=1;32;40:pi=1;33;40:ex=1;31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=34;43:'
		;;
esac
