#!/bin/sh

cd $HOME
git clone https://github.com/ream88/dotfiles.git ~/.dotfiles

for file in $HOME/.dotfiles/src/*; do
  basename=$(basename "$file")
  from="$HOME/.dotfiles/src/$basename"
  to="$HOME/.$basename"
  ln -sfvn "$from" "$to"
done
