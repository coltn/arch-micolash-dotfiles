if status is-interactive
    # Commands to run in interactive sessions can go here
end

## fish settings
set -g fish_greeting
set TERM "foot"
set EDITOR "nvim"


## functions

### custom fish greating
function fish_greeting
    echo $hostname says (set_color green) Hello world!(set_color blue) from fish\n
    neofetch
    sleep 2
    clear
end


### run system update
function update
    sudo pacman -Syyu && flatpak update
end


## aliases
alias vim='nvim'
alias ..='cd ..'
