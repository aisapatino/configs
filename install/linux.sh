#!/usr/bin/env bash

# Runs unix.sh for base config
# This file contains linux/home comp-specific things

bash ~/Projects/configs/install/unix.sh

# links base bashrc. presumably overridden in specific install script
echo "\n--- BASH ---"
ln -s -f -v ~/Projects/configs/terminal/.bashrc-linux ~/.bashrc

echo "\n--- FLAMING LOOT ---"
if [ -d /home/aisa/Projects/flamingloot ] ; then
  ln -s -f -v ~/Projects/configs/git/fl-gitconfig ~/Projects/flamingloot/.git/config
fi
if [ -d ~/Projects/flaminglootsys ] ; then
  ln -s -f -v ~/Projects/configs/git/flml-gitconfig ~/Projects/flaminglootsys/.git/config
fi

echo "--- TERMINATOR ---"
if [ ! -d ~/.config/terminator ] ; then
  mkdir -v ~/.config/terminator
fi
ln -s -f -v ~/Projects/configs/terminal/terminator-config ~/.config/terminator/config

# linters
echo "--- LINTERS ---"
ln -s -f -v ~/Projects/configs/linters/.pylintrc ~/.pylintrc
ln -s -f -v ~/Projects/configs/linters/.eslintrc ~/.eslintrc

