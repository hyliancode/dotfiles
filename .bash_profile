#!/bin/bash

if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" ]] && exec startx -- -quiet
# use script to write different launchers to xinitrc to
# change what is launched.
