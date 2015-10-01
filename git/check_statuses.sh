#!/bin/bash
# Script to report the current branch & status of multiple repos

red="\033[00;31m"
green="\033[00;32m"
yellow="\033[00;33m"
blue="\033[00;34m"
purple="\033[00;35m"
cyan="\033[00;36m"
reset="\033[00m"

# The $? holds the exit status of the previously executed command. 0 = success

echo 'Checking git repos...'
cd ~/Projects

for d in 'sjfnw' 'configs' 'flamingloot' 'flamingloot-ml' 'anita' 'dlisa' ; do
  printf "\033[1m%15s\033[0m  " "$d"

  if [ ! -d "$d" ] ; then
    printf "$red *not found* $reset"

  else
    cd $d

    # fetch silently
    git fetch -q

    # run git status & pull out relevant lines
    RESULTS=$(git status | grep -E '^# (On branch|Untracked|Changes|Your branch)')

    # get branch name
    SECTION=$(echo "$RESULTS" | grep -o "On branch \([a-z\-]\+\)")
    SECTION=$(echo "$SECTION" | grep -o "[a-z_/\-]\+$")
    if [ "$SECTION" = "master" ] ; then
      printf "%-16s%s" "$SECTION"
    else
      printf "$cyan%-16s$reset" "$SECTION"
    fi
    SECTION=""

    # get branch status
    OUT=0
    SECTION=$(echo "$RESULTS" | grep -e 'Untracked')
    if [ "$SECTION" != "" ] ; then
      printf "$red[New files]$reset"
      OUT=1
    fi
    SECTION=$(echo "$RESULTS" | grep -e 'Changes not staged for commit')
    if [ "$SECTION" != "" ] ; then
      printf "$red[Modified]$reset"
      OUT=1
    fi
    SECTION=$(echo "$RESULTS" | grep -e 'Changes to be committed')
    if [ "$SECTION" != "" ] ; then
      printf "$green[Staged]$reset"
      OUT=1
    fi
    SECTION=$(echo "$RESULTS" | grep -e 'Your branch is ahead')
    if [ "$SECTION" != "" ] ; then
      printf "$yellow[Ahead of remote]$reset"
      OUT=1
    fi
    SECTION=$(echo "$RESULTS" | grep -e 'Your branch is behind')
    if [ "$SECTION" != "" ] ; then
      printf "$yellow[Behind remote]$reset"
      if [ "$OUT" -eq 0 ] ; then # no local changes; ok to pull
        SECTION=$(git pull --rebase -q)
        printf "$green[Pulled]$reset"
      fi
      OUT=1
    fi

    if [ "$OUT" -eq 0 ] ; then
      printf "$green[Up to date]$reset"
    fi

    cd ..
  fi
  printf "\n"
done
printf "\n"
