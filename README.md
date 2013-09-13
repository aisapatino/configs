[For my own reference]

### To do
* app launchers

### Contents

vim
* aisa.vim: customized version of the pyte colorscheme for vim
* .pylintrc: settings for running pylint in vim with minimal django conflicts
* .vimrc
* bundle: vim plugins

git
* check\_statuses.sh: script to check git status of multiple repos
* fl-gitconfig, flml-gitconfig
* .gitconfig: global git config
* .gitignore: global git ignore

other programs
* terminator-config
* .bashrc

windows
* install - windows.bat: copy all these files appropriately

### Setup

Clone.

**Linux**: Leave the files where they are and use symlinks.
    (No updating necessary unless file names change)

* aisa.vim    -> ~/.vim/colors/
* fl-gitconfig, flml-gitconfig -> repo/.git/, rename links to config
* terminator-config -> ~/.config/terminator/, rename link to config
* .bashrc     -> ~/
* .gitconfig  -> ~/
* .pylintrc   -> ~/
* .vimrc      -> ~/
* bundle      -> ~/.vim/

**Windows**: Copy the files for every update (using auto\_copy.bat)

~ = C:\Users\username

* aisa.vim    -> ~\vimfiles\colors\
* fl-gitconfig, flml-gitconfig -> repo\\.git\, rename copies to config
* .gitconfig  -> ~\
* .pylintrc   -> ~\
* .vimrc      -> ~\
* bundle      -> ~\vimfiles\

*probably irrelevant on windows?
* .bashrc     -> ~\
* terminator-config -> ~/.config/terminator/, rename link to config*

