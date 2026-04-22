# Walls
I'm wanting to create a scheme version of each of these wallpapers for:
- catppuccin
- gruvbox
- nord
- ...and possibly others.

A script could be made to use `lutgen` and check _scheme-dir_ for _original_ dir match:
``` bash
#!/bin/bash

catch() {echo "${1}"; exit 1; }

scheme=catppucin # for loop through all schemes, make this a function "_check_scheme"
[[ -d "${scheme}" ]] || catch "Scheme does not have corresponding wall folder."
for wall in original/*; do
    if [[ ! -e "${scheme}/${wall##*/}" ]]; then
        _lutgen_wall "${scheme}"
    else
        continue
    fi
done
```