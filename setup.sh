#!/bin/bash

#
# A setup script for all dotfiles that is meant to be
# run from the home directory.
#
# This script sets up the following config files
# 1. .vim
# 2. .vimrc
# 3. .gitignore_global
# 4. .eslintrc

if [[ -d $HOME/.dotfiles ]]; then
  DOTFILES=$HOME/.dotfiles
else
  echo "~/.dotfiles not found"
  exit 1
fi

echo "setting up dotfiles from '$DOTFILES'"

cd $HOME
ln -fs $DOTFILES/vim .vim
ln -fs $DOTFILES/.vimrc .vimrc
ln -fs $DOTFILES/.gitignore .gitignore_global

echo -e "[include]\n\tpath = $HOME/.dotfiles/.gitconfig" >> .gitconfig
