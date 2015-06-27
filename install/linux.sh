#!/usr/bin/env bash

# Runs base.sh for base config
# This file contains linux/home comp-specific things

bash ~/Projects/configs/install/base.sh

HEADER="\n*** %s ***\n"

printf "$HEADER" "BASH"
# override base that was set in unix.sh
ln -s -f -v ~/Projects/configs/terminal/.bashrc-linux ~/.bashrc

printf "$HEADER" "FLAMING LOOT"
if [ -d /home/aisa/Projects/flamingloot ] ; then
  ln -s -f -v ~/Projects/configs/git/fl-gitconfig ~/Projects/flamingloot/.git/config
fi
if [ -d ~/Projects/flamingloot-ml ] ; then
  ln -s -f -v ~/Projects/configs/git/flml-gitconfig ~/Projects/flamingloot-ml/.git/config
fi

printf "$HEADER" "TERMINATOR"
if [ ! -d ~/.config/terminator ] ; then
  mkdir -v ~/.config/terminator
fi
ln -s -f -v ~/Projects/configs/terminal/terminator-config ~/.config/terminator/config

printf "$HEADER" "LINTERS"
ln -s -f -v ~/Projects/configs/linters/.pylintrc ~/.pylintrc
ln -s -f -v ~/Projects/configs/linters/.eslintrc ~/.eslintrc
