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
    echo (set_color green) && figlet -f miniwi.flf "updating pacman"
    sudo pacman -Syyu
    echo "======================================================================"
    figlet -f miniwi.flf  "updating flatpak"
    sudo flatpak update
    echo "======================================================================"
    echo  (set_color blue) "update complete, creating app list at ~/.config/applist/<repo-name>-apps"
    date +"%Y-%m-%dT%H:%M:%S" > ~/.config/applist/flatpak-apps && flatpak list --columns app >> ~/.config/applist/flatpak-apps
    date +"%Y-%m-%dT%H:%M:%S" > ~/.config/applist/pacman-apps && pacman -Qqen >> ~/.config/applist/pacman-apps 
    date +"%Y-%m-%dT%H:%M:%S" > ~/.config/applist/aur-apps && pacman -Qqem >> ~/.config/applist/aur-apps
    echo "======================================================================"
    echo  "lists updated 😄" && ls ~/.config/applist/
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
alias rustcif='sh ~/.config/scripts/rustshare-cif.sh'
alias webcam-preview='mpv av://v4l2:/dev/video6 --profile=low-latency --untimed'

starship init fish | source
