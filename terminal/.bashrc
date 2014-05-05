TERM=xterm-256color

# gae
export PATH=$PATH:/home/aisa/Devel/google_appengine:/home/aisa/Devel/google_appengine/lib/django-1.5
# pip installs
export PATH=$PATH:/usr/local/lib/python2.7/dist-packages
# jshint
export PATH=$PATH:/home/aisa/Devel/node_modules/jshint/bin
# rbenv & rbenv installed
export PATH=$PATH:/home/aisa/.rbenv/shims:/home/aisa/.rbenv/bin

# gae
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/google_appengine:/home/aisa/Devel/google_appengine/lib/django-1.5:/home/aisa/Devel/google_appengine/lib/yaml/lib
# pip installs
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages
# misc installed tools
PYTHONPATH=$PYTHONPATH:/home/aisa/Devel

# Update PATH for the Google Cloud SDK
source /home/aisa/Devel/google-cloud-sdk/path.bash.inc

# Enable bash completion for gcloud
source /home/aisa/Devel/google-cloud-sdk/completion.bash.inc

# Shortcut for connecting to cloud sql
alias cloudsql="mysql --host=173.194.109.221 -uroot -p"

