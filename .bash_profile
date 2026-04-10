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
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export HISTSIZE=1000

if [[ -f "${HOME}/.bashrc" ]]; then
    source "${HOME}/.bashrc"
fi

# Start X server on TTY1 if not already running
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" ]] && exec startx -- -quiet
# Start the appropriate window manager/session on TTY1 if not already running
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" && -f .scripts/launch-bspwm ]] && exec .scripts/launch-bspwm
# [[ -z "${DISPLAY}" && "$(tty)" == "/dev/tty1" && -f .scripts/launch-niri ]] && exec .scripts/launch-niri