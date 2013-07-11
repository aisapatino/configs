#!/bin/bash

red="\033[00;31m"
green="\033[00;32m"
yellow="\033[00;33m"
blue="\033[00;34m"
purple="\033[00;35m"
cyan="\033[00;36m"
reset="\033[00m"

# The $? holds the exit status of the previously executed command. 0 = success
echo 'Checking git repos...'
cd ~/Devel
for d in 'configs' 'flamingloot' 'flamingloot-ml' 'sjfnw' 'tracker'
do
	cd $d
	OUT="\033[1m$d\033[0m"
	RES=$(git status | grep -E '^# (On branch|Untracked|Changes|Your branch)')
	SECTION=$( echo "$RES" | grep -o "On branch \([a-z]\+\)")
	SECTION=$( echo "$SECTION" | grep -o "[a-z_/\-]\+$")
	OUT="$OUT - $SECTION"
	SECTION=""

	SECTION=$(echo "$RES" | grep -e 'Untracked')
	if [ "$SECTION" != "" ] ; then
		OUT="$OUT $red[Untracked]$reset"
	fi
	SECTION=$(echo "$RES" | grep -e 'Changes not staged for commit')
	if [ "$SECTION" != "" ] ; then
		OUT="$OUT $red[Modified]$reset"
	fi
	SECTION=$(echo "$RES" | grep -e 'Changes to be committed')
	if [ "$SECTION" != "" ] ; then
		OUT="$OUT $green[Staged]$reset"
	fi
	SECTION=$(echo "$RES" | grep -e 'Your branch is ahead')
	if [ "$SECTION" != "" ] ; then
		OUT="$OUT $yellow[Ahead of remote]$reset"
	fi
	SECTION=$(echo "$RES" | grep -e 'Your branch is behind')
	if [ "$SECTION" != "" ] ; then
		OUT="$OUT $cyan[Behind remote]$reset"
	fi

	SECTION=$(echo "$OUT" | grep -o "\]")
	if [ "$SECTION" = "" ] ; then
		OUT="$OUT $green[up to date]$reset"
	fi
	echo -e "$OUT"
	cd ..
done

