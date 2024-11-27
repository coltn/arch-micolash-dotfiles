#!/bin/bash
WINDOW=$(hyprctl clients -j | jq -r '.[] | "[\(.workspace.id)] [\(.class)] \(.title) \(.address)"' | sort | fuzzel -d -w 50 | awk '{print $NF}')
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow address:$WINDOW
