swayidle -w timeout 300 'swaylock -f -C ~/.config/swaylock/config' \
            timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 900 'systemctl suspend' \
            before-sleep 'swaylock -f -C ~/.config/swaylock/config' &
