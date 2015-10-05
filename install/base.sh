#!/usr/bin/env bash

# Create needed directiories and symbolic links for config files

# ln: -s symbolic link, -f override existing
# mkdir: -p no error if existing, make parent dirs as needed

header="\n*** %s ***\n"
configs=~/Projects/configs

if [[ $1 == m* ]] || [[ $1 == w* ]] ; then # "mac" or "work"
  install_type='work'
elif [[ $1 == l* ]] || [[ $1 == h* ]] ; then # "linux" or "home"
  install_type='linux'
else
  install_type='base'
fi

echo -e "Running $install_type setup\n"

printf "$header" "GIT"

ln -s -f -v "$configs/git/.gitignore ~/.gitignore"
ln -s -f -v "$configs/git/.gitconfig ~/.gitconfig"
ln -s -f -v "$configs/git/.gitk ~/.gitk"

if [ ! -f ~/.git-completion.bash ]; then
  echo "Getting git-completion.bash"
  curl -o ~/.git-completion.bash \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
fi

printf "$header" "SHELL/TERMINAL"

if [ "$install_type" = "work" ] ; then
  ln -s -f -v "$configs/terminal/.bashrc-work ~/.bashrc"
elif [ "$install_type" = "linux" ] ; then
  ln -s -f -v "$configs/terminal/.bashrc-linux ~/.bashrc"
  mkdir -v -p ~/.config/terminator
  ln -s -f -v "$configs/terminal/terminator-config ~/.config/terminator/config"
else
  ln -s -f -v "$configs/terminal/.bashrc-base ~/.bashrc"
fi

if [ $install_type = "linux" ] ; then
  printf "$HEADER" "LINTERS"
  ln -s -f -v "$configs/linters/.pylintrc ~/.pylintrc"
  ln -s -f -v "$configs/linters/.eslintrc ~/.eslintrc"
fi

printf "$header" "VIM"

ln -s -f -v "$configs/vim/.vimrc ~/.vimrc"
ln -s -f -v "$configs/vim/.gvimrc ~/.gvimrc"
ln -s -f -v "$configs/vim/colors ~/.vim/"

if [ ! -f ~/.vim/autoload/plug.vim ] ; then
  echo "Downloading vim-plug"
  curl -Lo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

ln -s -f -v "$configs/vim/custom-after ~/.vim/"
ln -s -f -v "$configs/vim/custom-snippets ~/.vim/"
ln -s -f -v "$configs/vim/CustomGrepFileAssoc ~/.vim/"
ln -s -f -v "$configs/vim/filetype.vim ~/.vim/"

printf "$header" "Make sure to run :PlugInstall once you open vim"
