#!/usr/bin/env bash

op=$( echo -e " poweroff\n reboot\n suspend\n lock\n logout" | fuzzel -w 12 -l 5 --placeholder="select" --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		hyprlock
                ;;
        logout)
                hyprctl dispatch exit
                ;;
esac
