#!/usr/bin/env bash

# 93-VS compact system panel — no extra packages required.
ACCENT='\033[38;2;255;50;0m'
DIM='\033[2m'
RESET='\033[0m'

# RAM
read -r _ mem_total mem_used _ < <(free -m | awk '/^Mem:/ {print $1, $2, $3, $4}')
mem_pct=$(( mem_used * 100 / mem_total ))

# Root disk
read -r disk_used disk_total disk_pct < <(df -h / | awk 'NR==2 {print $3, $2, $5}')

# Load average
load=$(awk '{print $1}' /proc/loadavg)

# Battery, if available
battery='N/A'
for bat in /sys/class/power_supply/BAT*; do
    [[ -r "$bat/capacity" ]] || continue
    battery="$(<"$bat/capacity")%"
    break
done

printf '%b' "$ACCENT"
if command -v figlet >/dev/null 2>&1; then
    figlet -f smslant '3ty6six7'
else
    printf '3ty6six7\n'
fi
printf '%b\n' "$RESET"

printf '%b%-8s%b %s\n' "$ACCENT" 'LOAD' "$RESET" "$load"
printf '%b%-8s%b %s MiB / %s MiB  (%s%%)\n' "$ACCENT" 'RAM' "$RESET" "$mem_used" "$mem_total" "$mem_pct"
printf '%b%-8s%b %s / %s  (%s)\n' "$ACCENT" 'DISK' "$RESET" "$disk_used" "$disk_total" "$disk_pct"
printf '%b%-8s%b %s\n' "$ACCENT" 'BATTERY' "$RESET" "$battery"
printf '%bARCH // HYPRLAND // VINHSAMA%b\n' "$DIM" "$RESET"
