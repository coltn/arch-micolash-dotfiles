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
    figlet $hostname
    echo says (set_color green) Hello world!(set_color blue) from fish\n
    neofetch
    sleep 2
    clear
end


### run system update
function update
    figlet -f 3D-ASCII.flf "update"
    sudo pacman -Syyu && flatpak update
end

### Tailscale up
function tailup
    figlet -f 3d.flf "Connecting to Tailscale"
    sudo systemctl start tailscaled && sh ~/scripts/tailup.sh
    figlet -f 3d.flf "CONNECTED"
    tailscale status
end

### Edit dot files
function config
    cd ~/.config
    nvim . vim
end


## aliases
alias vim='nvim'
alias ..='cd ..'
alias vimex='nvim . vim'
