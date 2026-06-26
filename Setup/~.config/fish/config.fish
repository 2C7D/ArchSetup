source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Hermes Agent — ensure ~/.local/bin is on PATH
fish_add_path "$HOME/.local/bin"

# ---- Environment for Wayland and portals (must be set BEFORE niri starts) ----
# set -gx WAYLAND_DISPLAY wayland-1
# set -gx DISPLAY :0
# set -gx GTK_THEME Adwaita:dark

# Start niri automatically on tty1
if test (tty) = /dev/tty1
    exec niri-session -l
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

set -x EDITOR helix
