#!/bin/zsh

## a setup script for all dotfiles that is meant to be run from
## the home directory ; note that this script is not idempotent
##
## this script sets up the following config files
##  - .vimrc
##  - .gitconfig
##  - starship.toml

if [[ $PWD]]

if [[ "$PWD" != "$HOME" ]]; then
  echo "please run this script from the home directory"
  exit 1
fi

## disables the last login time message that shows up
## everytime the shell starts up
touch ~/.hushlogin

# echo -e "[include]\n\tpath = $HOME/.dotfiles/.gitconfig" >> .gitconfig
