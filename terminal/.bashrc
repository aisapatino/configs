TERM=xterm-256color

export PATH=$PATH:/home/aisa/Devel/google_appengine:/home/aisa/Devel/google_appengine/lib/django-1.5
export PATH=$PATH:/home/aisa/Devel/sjfnw:/home/aisa/Devel/jslint:/usr/local/lib/python2.7/dist-packages

export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/google_appengine:/home/aisa/Devel/google_appengine/lib/django-1.5:/home/aisa/Devel/google_appengine/lib/yaml/lib
export PYTHONPATH=$PYTHONPATH:/home/aisa/Devel/sjfnw:/home/aisa/Devel:/usr/local/lib/python2.7/dist-packages


# The next line updates PATH for the Google Cloud SDK.
source /home/aisa/Devel/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
source /home/aisa/Devel/google-cloud-sdk/completion.bash.inc

# Shortcut for connecting to cloud sql
alias cloudsql="mysql --host=173.194.109.221 -uroot -p"

