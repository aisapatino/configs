#!/usr/bin/env bash

# Runs unix.sh for base config
# This file contains mac/work specific things

bash ~/Projects/configs/install/unix.sh

echo "\n--- BASH ---"
ln -s -f -v ~/Projects/configs/terminal/.bashrc-work ~/.bashrc
