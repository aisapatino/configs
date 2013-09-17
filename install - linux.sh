#!/bin/sh

# global configs
ln -s -v ~/Projects/configs/.gitignore ~/.gitignore
ln -s -v ~/Projects/configs/.gitconfig ~/.gitconfig
ln -s -v ~/Projects/configs/.bashrc ~/.bashrc
ln -s -v ~/Projects/configs/.pylintrc ~/.pylintrc
ln -s -v ~/Projects/configs/terminator-config ~/.config/terminator/config

# vim
ln -s -v ~/Projects/configs/.vimrc ~/.vimrc
ln -s -v ~/Projects/configs/aisa.vim ~/.vim/colors/aisa.vim
ln -s -v ~/Projects/configs/bundle ~/.vim/bundle

# repo gitconfigs
ln -s -v ~/Projects/configs/fl-gitconfig ~/Projects/flamingloot/.git/config
ln -s -v ~/Projects/configs/flml-gitconfig ~/Projects/flaminglootsys/.git/config

