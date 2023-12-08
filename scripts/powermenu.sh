#!/usr/bin/env bash

op=$( echo -e " poweroff\n reboot\n suspend\n lock\n logout" | wofi -i -p "select menu option" -w 5 -H 100 --dmenu | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                ;&
        reboot)
                ;&
        suspend)
                systemctl $op
                ;;
        lock)
		swaylock
                ;;
        logout)
                hyprctl dispatch exit
                ;;
esac
