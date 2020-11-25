stty -ixon #disable ctrl-s and ctrl-q
HISTSIZE= HISTFILESIZE= # Infinite history

export PS1="\w > \[$(tput sgr0)\]"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export PATH=$PATH:$JAVA_HOME/bin

export PYTHON_HOST_PROG="/bin/python"
export PYTHON3_HOST_PROG="/bin/python3"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"

alias cfi3="nvim ~/.config/i3/config"
alias cfsh="nvim ~/.bashrc && source ~/.bashrc"
alias cfck="nvim ~/.config/conky/conky.conf"

alias c="clear"
alias r="ranger"
alias p="sudo pacman --color always --noconfirm"

alias ngp="gradle init --type java-application"

alias bh="xbacklight -set 100"
alias sdn="shutdown now"

alias rpc="shuf -i 1-145 -n 1"

