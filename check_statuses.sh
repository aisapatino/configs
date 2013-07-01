#!/bin/bash

red="\033[00;31m"
green="\033[00;32m"
yellow="\033[00;33m"
blue="\033[00;34m"
purple="\033[00;35m"
cyan="\033[00;36m"
reset="\033[00m"

echo 'Checking git repos...'
cd ~/Devel
for d in 'configs' 'flamingloot' 'flamingloot-ml' 'sjfnw' 'tracker'
do
	cd $d
	OUT="\033[1m$d\033[0m"
	RES=$(git status | grep -E '^# (Untracked|Changes|Your branch)')
	grep -e 'Untracked' <<<${RES} >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		OUT="$OUT $red[Untracked]$reset"
	fi
	grep -e 'Changes not staged for commit' <<<${RES} >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		OUT="$OUT $red[Modified]$reset"
	fi
	grep -e 'Changes to be committed' <<<${RES} >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		OUT="$OUT $green[Staged]$reset"
	fi
	grep -e 'Your branch is ahead' <<<${RES} >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		OUT="$OUT $yellow[Ahead of remote]$reset"
	fi
	grep -e 'Your branch is behind' <<<${RES} >/dev/null 2>&1
	if [ $? -eq 0 ] ; then
		OUT="$OUT $cyan[Behind remote]$reset"
	fi
	if [ "$OUT" = "\033[1m$d\033[0m" ] ; then
		OUT="$OUT $green[up to date]$reset"
	fi
	echo -e $OUT
	cd ..
done

