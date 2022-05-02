#!/bin/bash

set -ux
set -o noclobber

this_dir=$(pwd)

function dobackup {
  if [ -L "$1" ]; then
    rm $1
  elif [ -f "$1" ]; then
    mv $1 $1.bak
  fi
}

function dolink {
  dobackup "$2/$1"
  if [ "$2" != "$HOME" ] && [ ! -d "$2" ]; then
    mkdir -p $2
  fi
  ln -s $this_dir/$1 $2

  echo Installed "$2/$1"
}

dolink .zshrc $HOME
dolink .tmux.conf $HOME
dolink .gitconfig $HOME
dolink alacritty.yml $HOME/.config/alacritty
dolink init.vim $HOME/.config/nvim
