# Walls
I'm wanting to create a scheme version of each of these wallpapers for:
- catppuccin
- gruvbox
- nord
...and possibly others.

A script could be made to use `lutgen` and check _scheme-dir_ for original dir match:
`[[ "${catppuccin_wall}" == "${original_wall}" ]] && continue || lutgen_wall`