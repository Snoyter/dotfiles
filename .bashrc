stty -ixon #disable ctrl-s and ctrl-q
HISTSIZE= HISTFILESIZE= # Infinite history

export PS1="\w > \[$(tput sgr0)\]"
export VISUAL=nvim
export EDITOR=nvim

alias cfi3="nvim ~/.config/i3/config"
alias cfsh="nvim ~/.bashrc && source ~/.bashrc"
alias cfck="nvim ~/.config/conky/conky.conf"
alias cfki="nvim ~/.config/kitty/kitty.conf"

alias c="clear"
alias p="sudo pacman --color always --confirm"
alias r="ranger"
alias sr="sudo ranger"
alias bh="xbacklight -set 100"
alias rpc="shuf -i 1-145 -n 1"
