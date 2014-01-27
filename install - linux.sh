#!/bin/sh

# git
ln -s -f -v ~/Projects/configs/git/.gitignore ~/.gitignore
ln -s -f -v ~/Projects/configs/git/.gitconfig ~/.gitconfig
if [ -d /home/aisa/Projects/flamingloot ] ; then
  ln -s -f -v ~/Projects/configs/git/fl-gitconfig ~/Projects/flamingloot/.git/config
fi
if [ -d ~/Projects/flaminglootsys ] ; then
  ln -s -f -v ~/Projects/configs/git/flml-gitconfig ~/Projects/flaminglootsys/.git/config
fi
ln -s -f -v ~/Projects/configs/git/.gitk ~/.gitk

# mysql
sudo ln -s -f -v ~/Projects/configs/mysql/my.cnf /etc/

# terminal
ln -s -f -v ~/Projects/configs/terminal/.bashrc ~/.bashrc
if [ ! -d ~/.config/terminator ] ; then
  mkdir -v ~/.config/terminator
fi
ln -s -f -v ~/Projects/configs/terminal/terminator-config ~/.config/terminator/config

# vim
ln -s -f -v ~/Projects/configs/vim/.vimrc ~/.vimrc
if [ ! -d ~/.vim/colors ] ; then
  mkdir -v ~/.vim/colors
fi
ln -s -f -v ~/Projects/configs/vim/aisa.vim ~/.vim/colors/aisa.vim
ln -s -f -v ~/Projects/configs/vim/aisadark.vim ~/.vim/colors/aisadark.vim
ln -s -f -v ~/Projects/configs/vim/bundle ~/.vim/
ln -s -f -v ~/Projects/configs/vim/.pylintrc ~/.pylintrc

