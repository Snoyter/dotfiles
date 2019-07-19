#!/bin/sh

export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export TRUEBROWSER="firefox"

[ -f ~/.bashrc ] && source ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
