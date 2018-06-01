#!/usr/bin/env bash

# Report the current branch & status of all repos inside of current directory
# Calls fetch from all repos unless -s option is passed
# Uses the same notation used by git prompt

check_statuses() {
  red="\e[31m"
  green="\e[32m"
  yellow="\e[33m"
  cyan="\e[36m"
  bold="\e[1m"
  reset="\e[m"

  branch_width="%-19s"
  remote_width="%-8s"

  echo -e "Checking git repos...\n"

  for d in */ ; do
    if [ ! -d "$d" ] || [ ! -d "$d/.git" ] ; then
      continue
    fi

    printf "      $bold%-17s$reset  " $(echo "$d" | sed "s/\///" )
    cd "$d"

    # $1 = first arg; -s = skip fetch
    if [ -z "$1" ] || [ "$1" != "-s" ] ; then
      git fetch --all -q
    fi

    # run git status & pull out relevant lines
    st=$(git status | grep -E '^(On branch|Untracked|Changes|Your branch)')

    # get remote
    remote=$(echo "$st" | grep -o "'[a-zA-Z]\+\/" | grep -o "[^'\/]\+")
    if [ -z "$remote" ] ; then
      printf $remote_width "-"
    elif [ "$remote" = "origin" ] ; then
      printf $remote_width $remote
    else
      printf "$cyan$remote_width$reset" "$remote"
    fi

    # get branch name
    branch=$(echo "$st" | grep -o "On branch \([a-zA-Z0-9_/\-]\+\)")
    branch=$(echo "$branch" | grep -o "[a-zA-Z0-9_/\-]\+$")
    if [ -z "$branch" ] ; then
      echo -e "${red}?$reset"
      cd ..
      continue
    elif [ "$branch" = "master" ] || [ "$branch" = "develop" ] ; then
      printf $branch_width $branch
    else
      printf "$cyan$branch_width$reset" $branch
    fi

    details=""

    # local changes
    local_changes=0
    if [ -n "$(echo "$st" | grep 'Untracked')" ] ; then
      details="$red %%"
      local_changes=1
    fi
    if [ -n "$(echo "$st" | grep 'Changes not staged for commit')" ] ; then
      details="$details$red *"
      local_changes=1
    fi
    if [ -n "$(echo "$st" | grep 'Changes to be committed')" ] ; then
      details="$details$yellow +"
      local_changes=1
    fi

    # branch compared to remote
    if [ -n "$(echo "$st" | grep 'Your branch is ahead')" ] ; then
      details="$details$yellow >"
    elif [ -n "$(echo "$st" | grep 'Your branch is behind')" ] ; then
      behind="$yellow <"
      if [ $local_changes -eq 0 ] ; then
        git pull -q --ff-only && details="$details ${green}✔︎$reset$behind"
      else
        details="$details$behind"
      fi
    elif [ -n "$(echo "$st" | grep 'diverged')" ] ; then
      details="$red <>"
    fi

    if [ -z "$details" ] ; then
      details=" ${green}✔︎"
    fi

    printf "\r$details$reset\n"

    cd ..
  done
}
