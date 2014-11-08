#!/bin/sh

# Create needed directiories and symbolic links for config files

# -v verbose (write actions to stdout)
#
# ln:
#   -s symbolic link
#   -f override existing
#
# mkdir:
#   -p no error if existing, make parent dirs as needed

# git
echo "--- GIT ---"
ln -s -f -v ~/Projects/configs/git/.gitignore ~/.gitignore
ln -s -f -v ~/Projects/configs/git/.gitconfig ~/.gitconfig
if [ -d /home/aisa/Projects/flamingloot ] ; then
  ln -s -f -v ~/Projects/configs/git/fl-gitconfig ~/Projects/flamingloot/.git/config
fi
if [ -d ~/Projects/flaminglootsys ] ; then
  ln -s -f -v ~/Projects/configs/git/flml-gitconfig ~/Projects/flaminglootsys/.git/config
fi
ln -s -f -v ~/Projects/configs/git/.gitk ~/.gitk

echo "--- TERMINAL ---"
ln -s -f -v ~/Projects/configs/terminal/.bashrc ~/.bashrc

# vim
echo "--- VIM ---"
ln -s -f -v ~/Projects/configs/vim/.vimrc ~/.vimrc

mkdir -p -v ~/.vim/colors
ln -s -f -v ~/Projects/configs/vim/colors/aisa.vim ~/.vim/colors/aisa.vim
ln -s -f -v ~/Projects/configs/vim/colors/aisadark.vim ~/.vim/colors/aisadark.vim
ln -s -f -v ~/Projects/configs/vim/colors/terminal.vim ~/.vim/colors/terminal.vim

if [ ! -d ~/.vim/bundle ] ; then
  mkdir -v ~/.vim/bundle
fi
if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

ln -s -f -v ~/Projects/configs/vim/custom-syntax ~/.vim/
ln -s -f -v ~/Projects/configs/vim/custom-snippets ~/.vim/
ln -s -f -v ~/Projects/configs/vim/CustomGrepFileAssoc ~/.vim/CustomGrepFileAssoc

echo "\nMake sure to run :BundleInstall once you open vim"

