#!/bin/sh

NUM_MONITORS=$(hyprctl monitors all | grep --count Monitor)

if [ "$NUM_MONITORS" -ge 2 ]; then
    hyprctl dispatch moveworkspacetomonitor "1 1"
    hyprctl dispatch moveworkspacetomonitor "2 1"
    hyprctl dispatch moveworkspacetomonitor "3 1"
    hyprctl dispatch moveworkspacetomonitor "4 1"
    hyprctl dispatch moveworkspacetomonitor "5 1"
    hyprctl keyword monitor eDP-1, disable
else
    swaylock
fi
