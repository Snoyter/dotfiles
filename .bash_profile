#!/bin/bash
[[ -f ~/.bashrc ]] && source ~/.bashrc

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"
export FILE="ranger"

if [[ "$(tty)" = "/dev/tty1" ]]; then
  exec startx
fi
