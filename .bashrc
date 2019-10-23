stty -ixon #disable ctrl-s and ctrl-q
set -o vi
HISTSIZE= HISTFILESIZE= # Infinite history

export PS1="\w > \[$(tput sgr0)\]"

alias rm="rm -i"
alias which="type -all"
alias ..="cd .."


#Config
alias cfi3="sudo nvim ~/.config/i3/config"
alias cfsh="sudo nvim ~/.bashrc"
alias cfvi="sudo nvim ~/.config/nvim/init.vim"

#System
alias r="ranger"
alias sr="sudo ranger $HOME"
alias n="nvim"
alias sn="sudo nvim"
alias c="clear"
alias p="sudo pacman"
alias rups="sudo pacman -Rn $(pacman -Qtdq)"
alias pc="pacman -Qqen | wc -l"
alias ll="ls -l"
alias la="ls -al"
alias mai="make && sudo make install"

#Internet
alias yt="youtube-viewer"
