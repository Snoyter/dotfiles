stty -ixon #disable ctrl-s and ctrl-q
set -o vi
HISTSIZE= HISTFILESIZE= # Infinite history

export PS1="\w > \[$(tput sgr0)\]"

#Config
alias cfi3="sudo nvim ~/.config/i3/config"
alias cfsh="sudo nvim ~/.bashrc && source ~/.bashrc"

#System
alias Avgust="figlet I Love Avgust | lolcat"

alias c="clear"
alias cpp="g++ -Wall -o file"

#Packages
alias p="sudo pacman --noconfirm"
alias y="yaourt --noconfirm"

alias ll="ls -l"

alias ss="systemctl list-units --type=service"
alias j="journalctl"

alias h="htop"
alias sh="sudo htop"

alias r="ranger"
alias sr="sudo ranger"

alias lynis="lynis audit system"
alias pep="pacman -Q | grep"

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
        mv="mv -iv" \
	rm="rm -v" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner" \
	ka="killall" \

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
