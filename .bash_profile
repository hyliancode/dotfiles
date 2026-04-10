#!/bin/bash

if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

# Start X server on TTY1 if not already running
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" ]] && exec startx -- -quiet
# Start the appropriate window manager/session on TTY1 if not already running
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" && -f .scripts/launch-bspwm ]] && exec .scripts/launch-bspwm
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" && -f .scripts/launch-niri ]] && exec .scripts/launch-niri