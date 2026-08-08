if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" && "$XDG_VTNR" == "1" ]]; then
    exec start-hyprland
fi
