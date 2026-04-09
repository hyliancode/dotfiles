#!/bin/bash

if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
shopt -s checkwinsize
shopt -s histappend

if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        source /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        source /etc/bash_completion
    fi
fi

PATH_PATHS=(
    "/bin"
    "/sbin"
    "/usr/bin"
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/sbin"
    "/var/lib/flatpak/exports/bin"
    "${HOME}/.local/share/flatpak/exports/bin"
    "${HOME}/.scripts"
)

export PATH="$(IFS=:; echo "${PATH_PATHS[*]}")"
export PS1="\[\e[90m\] \w\[\e[0m\] > "
export EDITOR="edit"
