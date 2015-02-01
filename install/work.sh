#!/usr/bin/env bash

# Runs unix.sh for base config
# This file contains linux/home comp-specific things

bash ~/Projects/configs/install/unix.sh

# links base bashrc. presumably overridden in specific install script
echo "\n--- BASH ---"
ln -s -f -v ~/Projects/configs/terminal/.bashrc-work ~/.bashrc

# linters
echo "--- LINTERS ---"
ln -s -f -v ~/Projects/configs/linters/.jscsrc ~/.jscsrc

