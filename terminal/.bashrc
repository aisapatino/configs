TERM=xterm-256color

### PATH ######################################################################

# gae
export PATH=$PATH:/home/aisa/Devel/google_appengine/lib/django-1.5
# pip installs
export PATH=$PATH:/usr/local/lib/python2.7/dist-packages
# rbenv & rbenv
export PATH=$PATH:/home/aisa/.rbenv/shims:/home/aisa/.rbenv/bin
eval "$(rbenv init -)"
# node / npm
export PATH=$PATH:/home/aisa/.node/bin:/home/aisa/.node/lib/node_modules
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### PYTHONPATH ################################################################

# gae
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/google_appengine
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/google_appengine/lib/django-1.5
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/google_appengine/lib/yaml/lib
# pip installs
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages
# misc installed tools
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel

# Update PATH for the Google Cloud SDK
source /home/aisa/Devel/google-cloud-sdk/path.bash.inc

# Enable bash completion for gcloud
source /home/aisa/Devel/google-cloud-sdk/completion.bash.inc

### ALIASES ###################################################################

alias cloudsql="mysql --host=173.194.109.221 -uroot -p"
alias hero="heroku"
alias g="git"
alias gk="gitk --all"
alias tr="tree -a --dirsfirst -I 'node_modules|.git|*bower_components|db' -L "
alias trd="tree -a -d"

