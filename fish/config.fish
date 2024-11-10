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


### fuzzy find and remove package with preview
function fzf-remove
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns
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

### fzf functions

#### tmux
function fs -d "Switch tmux session"
  tmux list-sessions -F "#{session_name}" | fzf | read -l result; and tmux switch-client -t "$result"
end

#### ssh
function fssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

#### Completion
function fzf-complete -d 'fzf completion and print selection back to commandline'
	# As of 2.6, fish's "complete" function does not understand
	# subcommands. Instead, we use the same hack as __fish_complete_subcommand and
	# extract the subcommand manually.
	set -l cmd (commandline -co) (commandline -ct)
	switch $cmd[1]
		case env sudo
			for i in (seq 2 (count $cmd))
				switch $cmd[$i]
					case '-*'
					case '*=*'
					case '*'
						set cmd $cmd[$i..-1]
						break
				end
			end
	end
	set cmd (string join -- ' ' $cmd)

	set -l complist (complete -C$cmd)
	set -l result
	string join -- \n $complist | sort | eval (__fzfcmd) -m --select-1 --exit-0 --header '(commandline)' | cut -f1 | while read -l r; set result $result $r; end

	set prefix (string sub -s 1 -l 1 -- (commandline -t))
	for i in (seq (count $result))
		set -l r $result[$i]
		switch $prefix
			case "'"
				commandline -t -- (string escape -- $r)
			case '"'
				if string match '*"*' -- $r >/dev/null
					commandline -t --  (string escape -- $r)
				else
					commandline -t -- '"'$r'"'
				end
			case '~'
				commandline -t -- (string sub -s 2 (string escape -n -- $r))
			case '*'
				commandline -t -- (string escape -n -- $r)
		end
		[ $i -lt (count $result) ]; and commandline -i ' '
	end

	commandline -f repaint
end

#### cd history
function fzf-cdhist-widget -d 'cd to one of the previously visited locations'
	# Clear non-existent folders from cdhist.
	set -l buf
	for i in (seq 1 (count $dirprev))
		set -l dir $dirprev[$i]
		if test -d $dir
			set buf $buf $dir
		end
	end
	set dirprev $buf
	string join \n $dirprev | tac | sed 1d | eval (__fzfcmd) +m --tiebreak=index --toggle-sort=ctrl-r $FZF_CDHIST_OPTS | read -l result
	[ "$result" ]; and cd $result
	commandline -f repaint
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
alias webcam-preview='mpv av://v4l2:/dev/video0 --profile=low-latency --untimed'
alias fzf-install="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias fzf-vim='nvim $(fzf -m --preview="bat --color=always {}")'

starship init fish | source
