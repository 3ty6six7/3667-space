#!/bin/bash

OFFSET=40

kitty --class sysinfo --title "SysInfo" \
    zsh -lc 'fastfetch; echo; ~/.config/hypr/scripts/sysinfo-panel.sh; exec zsh' &

# Wait for the new window to appear
for i in {1..100}; do
    WINDOW_COUNT=$(hyprctl clients -j | jq '
        [.[] | select(.class == "sysinfo")] | length
    ')

    if [ "$WINDOW_COUNT" -gt 0 ]; then
        break
    fi

    sleep 0.02
done

[ "$WINDOW_COUNT" -gt 0 ] || exit 1

# Every new window is the active window.
# First window stays centered.
# Each next window moves +40,+40 relative to center.
SHIFT=$(( (WINDOW_COUNT - 1) * OFFSET ))

if [ "$SHIFT" -gt 0 ]; then
    hyprctl dispatch "hl.dsp.window.move({
        x = $SHIFT,
        y = $SHIFT,
        relative = true
    })"
fi