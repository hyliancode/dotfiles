#!/bin/bash

PATH_PATHS=(
    "/bin"
    "/sbin"
    "/usr/bin"
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/sbin"
    "/var/lib/flatpak/exports/bin"
    "${HOME}/.local/bin"
    "${HOME}/.local/share/flatpak/exports/bin"
    "${HOME}/.scripts"
)

export PATH="$(IFS=:; echo "${PATH_PATHS[*]}")"

export EDITOR=edit
export BROWSER=brave-browser
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export HISTSIZE=1000


if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

shopt -s checkwinsize
shopt -s histappend

if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        source /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        source /etc/bash_completion
    fi
fi

export PS1="\[\e[90m\] \w\[\e[0m\] > "
