date +"%Y%m%dT%H:%M:%S" | xargs -I % grim -g "$(slurp -d)" ~/media/pictures/screenshots/screenshot-%.png
