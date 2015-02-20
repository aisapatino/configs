#!/usr/bin/env bash

# Create needed directiories and symbolic links for config files

# general: -v verbose (write actions to stdout)
# ln: -s symbolic link
#     -f override existing
# mkdir: -p no error if existing, make parent dirs as needed

echo "\n--- GIT ---"
ln -s -f -v ~/Projects/configs/git/.gitignore ~/.gitignore
ln -s -f -v ~/Projects/configs/git/.gitconfig ~/.gitconfig
ln -s -f -v ~/Projects/configs/git/.gitk ~/.gitk

echo "\n--- BASH ---"
# links base bashrc. will presumably be overridden in specific install script
ln -s -f -v ~/Projects/configs/terminal/.bashrc-base ~/.bashrc

echo "\n--- VIM ---"
ln -s -f -v ~/Projects/configs/vim/.vimrc ~/.vimrc
ln -s -f -v ~/Projects/configs/vim/.gvimrc ~/.gvimrc

mkdir -p -v ~/.vim/colors
ln -s -f -v ~/Projects/configs/vim/colors/aisa.vim ~/.vim/colors/aisa.vim
ln -s -f -v ~/Projects/configs/vim/colors/aisadark.vim ~/.vim/colors/aisadark.vim

# create empty bundle folder if needed
if [ ! -d ~/.vim/bundle ] ; then
  mkdir -v ~/.vim/bundle
fi
# clone Vundle if needed
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -s -f -v ~/Projects/configs/vim/custom-syntax ~/.vim/
ln -s -f -v ~/Projects/configs/vim/custom-snippets ~/.vim/
ln -s -f -v ~/Projects/configs/vim/CustomGrepFileAssoc ~/.vim/CustomGrepFileAssoc

echo "\nMake sure to run :PluginInstall once you open vim"
