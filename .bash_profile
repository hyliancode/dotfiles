#!/bin/bash

if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

export WINDOW_MANAGER="niri-session"
# export WINDOW_MANAGER="bspwm"

if [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" ]]; then
    case "${WINDOW_MANAGER}" in
        "niri-session") exec niri-session ;;
        "bspwm") exec startx -- -quiet ;;
        *) echo "Unknown window manager: ${WINDOW_MANAGER}"; exit 1 ;;
    esac
fi