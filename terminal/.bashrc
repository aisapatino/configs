# History
#----------

HISTCONTROL=ignoreboth         # ignore duplicates & commands starting with space
HISTIGNORE="ls:ll:gs:gd:cd *:g sp:g ch *"  # ignore frequent short commands
HISTSIZE=2000                  # default is 500
shopt -s histappend            # add to existing history instead of overwriting

# Misc options
#--------------

shopt -s cdable_vars           # cd using vars without having to include $
shopt -u hostcomplete          # fix tabcomplete with @ in name (for scoped node modules)

# Editor
#--------

export EDITOR=nvim
export VISUAL=$EDITOR

# Colors
#--------

export CLICOLOR=1

# Prompt
#--------

set -o vi

GIT_PS1_SHOWUPSTREAM=1        # indicate ahead/behind upstream
GIT_PS1_SHOWDIRTYSTATE=1      # indicate staged & unstaged changed
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_STATESEPARATOR=""     # prevent space between branch & status indicators
GIT_PS1_SHOWCOLORHINTS=1      # color like git status for untracked/modified

source ~/.git-prompt.sh

add_virtual_env() {
  if [ "$VIRTUAL_ENV" ] ; then
    export PS1="\n`basename \"$VIRTUAL_ENV\"` $PS1"
  else
    export PS1="\n$PS1"
  fi
}

# color codes are wrapped in \[ \] so they're ignored when computing prompt length
PROMPT_COMMAND='__git_ps1 "\[\e[34m\]\w\[\e[m\]" " $ "; add_virtual_env'

# Autocomplete
#--------------

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Autocomplete for 'g' alias as well
complete -o default -o nospace -F _git g

# Aliases
#---------

alias ag="ag --hidden"

alias ll="ls -la"

alias g="git"
alias gs="git status"
alias gd="git diff"
alias gk="gitk --all"

base_tree="tree -a -C -I 'node_modules|.git|bower_components|coverage|.DS_Store|*.pyc'"
alias t="$base_tree --dirsfirst -L "
alias trd="$base_tree -d"

# Custom functions
#------------------

# Replace across files. Usage: sr <pattern> <replacement> "<filepattern>"
sr() {
  if [ "$1" ] && [ "$2" ] && [ "$3" ] ; then
    echo "Replacing '$1' with '$2' in files matching '$3'..."
    echo "(if the file match looks wrong, make sure you put quotes around it)"
    find . -iname "$3" -print0 | xargs -0 sed -i s/"$1"/"$2"/g
  else
    echo "Missing arguments. Got: '$1', '$2', '$3'"
  fi
}

# List local git branches with corresponding remotes and ahead/behind status
# Prereq for mac: brew install gnu-sed --with-default-names
br() {
  # 1. Grab desired parts from each line:
  #   \1 spaces/* at start
  #   \2 branch name
  #   \3 remote branch name & status
  # 2-3. Remove brackets around remote branch info.
  #    Use leading space to avoid matching color codes
  # 4. Emphasize deleted branch indicator
  # 5. Add color to behind/ahead text
  # 6. Align text in columns
  # 7. Add color to current branch
  git branch -vv \
    | sed -r "s/^([\* ]{2})([^ ]+)\ +[a-z0-9]{7,8}\ (\[[^ ]+\/[^]]+\])?.*/\1\2!`printf "\e[34m"` \3`printf "\e[m"`/" \
    | sed 's/\ \[//' \
    | sed 's/\]//' \
    | sed "s/:\ gone/`printf " \e[35mGONE\e[m"`/" \
    | sed -r "s/:(.*)/`printf "\e[33m"`\1/" \
    | column -t -s! \
    | sed -r "s/^\*\ ([^ ]+)/\*\ `printf "\e[32m"`\1`printf "\e[m"`/"
}

# Load check_statuses function
source "$HOME/Projects/configs/git/check_statuses.sh"

# Mac-specific
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Add CWD to iterm tab title
  if [ $ITERM_SESSION_ID ]; then
    export PROMPT_COMMAND=$PROMPT_COMMAND'; echo -ne "\033]0;${PWD##*/}\007"';
  fi

  # Place brew installs before system, add local node_modules (mostly for eslint)
  export PATH=/usr/local/bin:$PATH:./node_modules/.bin

  # Node version manager
  export NVM_DIR=~/.nvm
  if [ -f /usr/local/opt/nvm/nvm.sh ] ; then
    source /usr/local/opt/nvm/nvm.sh
  fi

  # Colors for ls. Differs from linux - see man ls for more info
  export LSCOLORS=ExGxBxDxCxEgEdxbxgExEx

  # Enhanced bash autocomplete. See http://superuser.com/a/288491
  if [ -f /usr/local/etc/bash_completion ]; then
    source /usr/local/etc/bash_completion
  fi
fi

# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# Google app engine / SJF setup
gcdir=~/Devel/google-cloud-sdk
if [ -d "$gcdir" ] ; then
  source $gcdir/path.bash.inc
  source $gcdir/completion.bash.inc
  export PYTHONPATH=$PYTHONPATH:$gcdir/platform/google_appengine
  export PYTHONPATH=$PYTHONPATH:$gcdir/platform/google_appengine/lib/webob-1.2.3
  export PYTHONPATH=$PYTHONPATH:$gcdir/platform/google_appengine/lib/yaml-3.10
fi

# access to vendor libs
export PYTHONPATH=$PYTHONPATH:~/Projects/sjfnw/libs
# export PYTHONPATH=$PYTHONPATH:~/Projects/env-sjfnw/lib/python2.7/site-packages
