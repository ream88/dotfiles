#!/bin/sh
set -e

if [ ! -d "$HOME/.dotfiles" ]; then
  git clone https://github.com/ream88/dotfiles.git $HOME/.dotfiles
fi

install() {
  for from in $1/*; do
    basename=$(basename $from)

    mkdir -pv $2

    if [ -d $from ]; then
      install $from "$2$basename/"
    else
      echo ln -sfvn $from "$2$basename"
    fi
  done
}

install "$HOME/.dotfiles/src" "$HOME/."
