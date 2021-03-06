#!/usr/bin/env bash

# Set up config files using symlinks, overwriting/creating directories as needed.
#
# Execute with an argument to specify install type
# Otherwise it will default to base install.

bold="\033[1m"
reset="\033[m"

run_setup() {
  local header="\n${bold}%s${reset}\n==========\n\n"
  local configs=~/Projects/configs

  # Determine install type
  #------------------------

  if [[ $1 == m* ]] || [[ $1 == w* ]] ; then # "mac" or "work"
    local install_type='work'
    local work=1
  elif [[ $1 == l* ]] || [[ $1 == h* ]] ; then # "linux" or "home"
    local install_type='linux'
    local linux=1
  else
    install_type='base'
  fi

  echo -e "\nRunning $bold$install_type$reset setup..."

  # Git
  #-----

  printf "$header" "Git config"

  ln -fsv "$configs/git/.gitignore" ~
  ln -fsv "$configs/git/.gitconfig" ~

  if [ ! -f ~/.git-completion.bash ]; then
    echo "Getting git-completion.bash"
    curl -o ~/.git-completion.bash \
      https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  fi
  if [ ! -f ~/.git-prompt.sh ]; then
    echo "Getting git-prompt.sh"
    curl -o ~/.git-prompt.sh \
      https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  fi

  # Terminal
  #----------

  printf "$header" "Terminal"

  ln -fsv "$configs/terminal/.bash_profile"       ~
  ln -fsv "$configs/terminal/.bashrc"             ~

  # Other
  #-------

  printf "$header" "ag and ctags"

  ln -fsv "$configs/other/.agignore" ~
  ln -fsv "$configs/other/.ctags"    ~

  # Vim
  #-----

  printf "$header" "nvim"

  mkdir -pv ~/.config/nvim

  ln -fsv "$configs/vim/init.vim"  ~/.config/nvim

  if [ ! -f ~/.config/nvim/autoload/plug.vim ] ; then
    echo "Downloading vim-plug"
    curl -Lo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi

  ln -fsv "$configs/vim/colors"              ~/.config/nvim
  ln -fsv "$configs/vim/after"               ~/.config/nvim
  ln -fsv "$configs/vim/custom-snippets"     ~/.config/nvim
  ln -fsv "$configs/vim/filetype.vim"        ~/.config/nvim
  ln -fsv "$configs/vim/autoload/alpw"       ~/.config/nvim/autoload

  echo -e "\n${bold}Make sure to run :PlugInstall once you open vim\n$reset"
}

run_setup "$1"
