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
end


### run system update
function update
    figlet -f 3D-ASCII.flf "update"
    sudo pacman -Syyu && flatpak update
end

### Tailscale up
function tailup
    figlet -f 3d.flf "Connecting to Tailscale"
    sudo systemctl start tailscaled && sh ~/.config/scripts/tailup.sh
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
alias neofetch='fastfetch --file ~/.config/ascii/bloodbornelogo-neofetch'
alias updaterepo='sudo reflector -c Canada --save /etc/pacman.d/mirrorlist --protocol https --sort rate'
alias debianvm='sh ~/vm/debian/run.sh' 
alias windowsvm='sh ~/vm/runwindows.sh'
alias wobreset='sh ~/.config/scripts/wob.sh'
