
# path
PATH="$HOME/bin:/usr/local/go/bin:$PATH"

# Go Lang
export GOPATH=$HOME/work

# good enough, because I can never find perfect
export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\H\[\e[m\] \[\e[36m\]\w\[\e[m\]\\$ "

# tired of typing
alias ll='ls -laF'

# env basics
export LANG="en_US.UTF-8"
export LC_COLLATE="C"
#export LC_ALL="C"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"

# color the world
export CLICOLOR=1
export LSCOLORS=GxFxCxDxbxegedabagaced

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
		export LS_COLORS='di=1;36;40:ln=1;35;40:so=1;32;40:pi=1;33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=34;43:'
		;;
esac

_sssh() {
        local cur prev
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD]-1}"
        alldc=$(cut -d: -f2 /root/etc/servers.dat |sort |grep '^[[:upper:]]\{3\}$' |uniq |xargs |sed -e 's/ /|/g')
        dc=$(hostname |sed -r -e 's/^.*\.('"$alldc"')\..*$/\1/ig')
        if [[ -n "$cur" ]]; then
                hosts=$(grep -v  '^#[<#[:space:]]' /root/etc/servers.dat |cut -d: -f4 |
                        sed -r -e "/$dc[.]/"'s/^(.*)[.]com$/\1.com\n\1.lan/g' |
                        egrep -v '^([[:space:]]*|MRR-Storage)$' |grep "^$cur")
                COMPREPLY=($(compgen -W "${hosts}" -- "${cur}" ))
                return 0
        fi
}

complete -F _sssh sudo ssh
