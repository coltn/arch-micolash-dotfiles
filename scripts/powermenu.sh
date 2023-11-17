#!/usr/bin/env bash

op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i -w 5 -H 100 --dmenu | awk '{print tolower($2)}' )

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
                swaymsg exit
                ;;
esac
