stty -ixon #disable ctrl-s and ctrl-q
set -o vi
HISTSIZE= HISTFILESIZE= # Infinite history

#Config
alias i3w="sudo nvim ~/.config/i3/config"
alias baw="nvim ~/.bashrc"

#System
alias r="ranger"
alias sr="sudo ranger /home/snoyter/"
alias n="nvim"
alias sn="sudo nvim"
alias g="git"
alias c="clear"
alias p="sudo pacman"
alias rups="sudo pacman -Rns $(pacman -Qtdq)"
alias ll="ls -l"
alias la="ls -al"

#Internet
alias ytda="youtube-dl --add-metadata -xic" # Download only audio
alias ytdv="youtube-dl --add-metadata -ic" # Download video
alias yt="youtube-viewer"
