#!/usr/bin/env bash

# Runs base.sh for base config
# This file contains mac/work specific things

bash ~/Projects/configs/install/base.sh

printf "\n*** %s ***\n" "BASH"
ln -s -f -v ~/Projects/configs/terminal/.bashrc-work ~/.bashrc
