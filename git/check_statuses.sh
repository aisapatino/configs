#!/usr/bin/env bash

# Report the current branch & status of all repos inside of current directory
# Calls fetch from all repos unless -s option is passed

check_statuses() {
  red="\033[31m"
  green="\033[32m"
  yellow="\033[33m"
  cyan="\033[36m"
  bold="\033[1m"
  reset="\033[m"

  branch_width="%-19s"
  remote_width="%-10s"

  echo -e "Checking git repos...\n"

  for d in */ ; do
    # skip non-dir or non-repo
    if [ ! -d "$d" ] || [ ! -d "$d/.git" ] ; then
      continue
    fi

    printf "$bold%30s$reset  " $(echo "$d" | sed "s/\///" )
    cd $d

    # $1 = first arg; -s = skip fetch
    if [ -z "$1" ] || [ "$1" != "-s" ] ; then
      git fetch -q
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
      echo -e "${red}could not find branch name$reset"
      continue
    elif [ "$branch" = "master" ] ; then
      printf $branch_width $branch
    else
      printf "$cyan$branch_width$reset" $branch
    fi

    details=""

    # local changes
    local_changes=0
    if [ -n "$(echo "$st" | grep 'Untracked')" ] ; then
      details="$red[New files]"
      local_changes=1
    fi
    if [ -n "$(echo "$st" | grep 'Changes not staged for commit')" ] ; then
      details="$details$red[Modified]"
      local_changes=1
    fi
    if [ -n "$(echo "$st" | grep 'Changes to be committed')" ] ; then
      details="$details$yellow[Staged]"
      local_changes=1
    fi

    # branch compared to remote
    if [ -n "$(echo "$st" | grep 'Your branch is ahead')" ] ; then
      details="$details$yellow[Ahead of remote]"
    elif [ -n "$(echo "$st" | grep 'Your branch is behind')" ] ; then
      details="$details$yellow[Behind remote]"
      if [ $local_changes -eq 0 ] ; then
        git pull -q --ff-only && details="$details$green[Pulled]"
      fi
    elif [ -n "$(echo "$st" | grep 'diverged')" ] ; then
      details="$red[Diverged]"
    fi

    if [ -z "$details" ] ; then
      details="$green[Up to date]"
    fi

    echo -e " $details$reset"

    cd ..
  done
}
