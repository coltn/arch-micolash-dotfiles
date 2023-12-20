#!/usr/bin/env bash

PS3='Choose which media applications you would like to launch: '
foods=("CMUS" "Spotify" "Cava" "Quit")
select fav in "${foods[@]}"; do
    case $fav in
        "CMUS")
            foot -e cmus&
	    # optionally call a function or run some code here
            ;;
        "Spotify")
            hyprctl dispatch exec flatpak run com.spotify.Client
	    # optionally call a function or run some code here
            ;;
        "Cava")
            hyprctl dispatch exec [float; workspace special:music silent; move 20 1184; size 2216 300] foot -e cava
	    # optionally call a function or run some code here
	    break
            ;;
	"Quit")
	    echo "User requested exit"
	    exit
	    ;;
        *) echo "invalid option $REPLY";;
    esac
done
