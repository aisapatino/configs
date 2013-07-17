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
for d in 'sjfnw' 'configs' 'flamingloot' 'flamingloot-ml' 'tracker'
do
	cd $d
	printf "\033[1m%14s\033[0m  " "$d"
	RES=$(git status | grep -E '^# (On branch|Untracked|Changes|Your branch)')
	SECTION=$( echo "$RES" | grep -o "On branch \([a-z]\+\)")
	SECTION=$( echo "$SECTION" | grep -o "[a-z_/\-]\+$")
	if [ "$SECTION" = "master" ] ; then
		printf "%-13s%s" "$SECTION"
	else
		printf "$cyan%-13s$reset" "$SECTION"
	fi
	SECTION=""

	OUT=0
	SECTION=$(echo "$RES" | grep -e 'Untracked')
	if [ "$SECTION" != "" ] ; then
		printf "$red[New files]$reset"
		OUT=1
	fi
	SECTION=$(echo "$RES" | grep -e 'Changes not staged for commit')
	if [ "$SECTION" != "" ] ; then
		printf "$red[Modified]$reset"
		OUT=1
	fi
	SECTION=$(echo "$RES" | grep -e 'Changes to be committed')
	if [ "$SECTION" != "" ] ; then
		printf "$green[Staged]$reset"
		OUT=1
	fi
	SECTION=$(echo "$RES" | grep -e 'Your branch is ahead')
	if [ "$SECTION" != "" ] ; then
		printf "$yellow[Ahead of remote]$reset"
		OUT=1
	fi
	SECTION=$(echo "$RES" | grep -e 'Your branch is behind')
	if [ "$SECTION" != "" ] ; then
		printf "$yellow[Behind remote]$reset"
		OUT=1
	fi

	if [ "$OUT" -eq 0 ] ; then
		printf "$green[Up to date]$reset"
	fi
	printf "\n"
	cd ..
done

