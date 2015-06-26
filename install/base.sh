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

if [ ! -f ~/.git-completion.bash ]; then
  echo "Getting git-completion.bash"
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

echo "\n--- BASH ---"
# links base bashrc. will presumably be overridden in specific install script
ln -s -f -v ~/Projects/configs/terminal/.bashrc-base ~/.bashrc

echo "\n--- VIM ---"
ln -s -f -v ~/Projects/configs/vim/.vimrc ~/.vimrc
ln -s -f -v ~/Projects/configs/vim/.gvimrc ~/.gvimrc

mkdir -p -v ~/.vim/colors
ln -s -f -v ~/Projects/configs/vim/colors/aisa.vim ~/.vim/colors/aisa.vim
ln -s -f -v ~/Projects/configs/vim/colors/aisadark.vim ~/.vim/colors/aisadark.vim

if [ ! -d ~/.vim/autoload/plug.vim ] ; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -s -f -v ~/Projects/configs/vim/custom-syntax ~/.vim/
ln -s -f -v ~/Projects/configs/vim/custom-snippets ~/.vim/
ln -s -f -v ~/Projects/configs/vim/CustomGrepFileAssoc ~/.vim/CustomGrepFileAssoc

echo "\nMake sure to run :PlugInstall once you open vim"
