#!/bin/bash
WINDOW=$(hyprctl clients | awk '/title: ./ { gsub("\t*title: *", ""); print}' | wofi -dmenu | xargs -I{} hyprctl dispatch focuswindow "title:{}")
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow $WINDOW
