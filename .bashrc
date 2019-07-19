stty -ixon #disable ctrl-s and ctrl-q
set -o vi
HISTSIZE= HISTFILESIZE= # Infinite history

#Config
alias cfi3="sudo nvim ~/.config/i3/config"
alias cfsh="nvim ~/.bashrc"

#System
alias n="nnn"
alias sn="sudo nnn /home/snoyter/"
alias v="nvim"
alias sv="sudo nvim"
alias g="git"
alias c="clear"
alias p="sudo pacman"
alias rups="sudo pacman -Rns $(pacman -Qtdq)"
alias ll="ls -l"
alias la="ls -al"

#Internet
alias yt="youtube-viewer"
