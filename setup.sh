#!/bin/bash

if [[ -d $HOME/.dotfiles ]]; then
  DOTFILES=$HOME/.dotfiles
else
  DOTFILES=$HOME/dotfiles
fi

echo "setting up dotfiles from '$DOTFILES'"

cd $HOME
ln -fs $DOTFILES/vim .vim
ln -fs $DOTFILES/.vimrc .vimrc
ln -fs $DOTFILES/.gitignore .gitignore_global

echo -e "[include]\n\tpath = $HOME/.dotfiles/.gitconfig" >> .gitconfig
