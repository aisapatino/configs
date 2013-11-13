#!/bin/sh

# terminal
ln -s -f -v ~/Projects/configs/terminal/.bashrc ~/.bashrc
ln -s -f -v ~/Projects/configs/terminal/terminator-config ~/.config/terminator/config

# vim
ln -s -f -v ~/Projects/configs/vim/.vimrc ~/.vimrc
ln -s -f -v ~/Projects/configs/vim/aisa.vim ~/.vim/colors/aisa.vim
ln -s -f -v ~/Projects/configs/vim/bundle ~/.vim/
ln -s -f -v ~/Projects/configs/vim/python.snippets ~/.vim/UltiSnips/python.snippets
ln -s -f -v ~/Projects/configs/vim/htmldjango.snippets ~/.vim/UltiSnips/htmldjango.snippets
ln -s -f -v ~/Projects/configs/vim/.pylintrc ~/.pylintrc

# git - global
ln -s -f -v ~/Projects/configs/git/.gitignore ~/.gitignore
ln -s -f -v ~/Projects/configs/git/.gitconfig ~/.gitconfig
# git - repo
ln -s -f -v ~/Projects/configs/git/fl-gitconfig ~/Projects/flamingloot/.git/config
ln -s -f -v ~/Projects/configs/git/flml-gitconfig ~/Projects/flaminglootsys/.git/config

