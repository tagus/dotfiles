#!/bin/bash

################################################################################
## setting up the ideal environment
################################################################################

## useful aliases
alias tree='tree -C'
alias caf='caffeinate -di'
alias vi='vim'
alias cd='z'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias k='kubectl'
alias tt='tilty'
alias lg='lazygit'
alias flux='tl flux'

if exists nvim; then
  alias vim='nvim'
fi

if exists bat; then
  alias less='bat'
  alias cat='bat'
fi

if exists eza; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

# adding custom bin directory to PATH
export PATH="$HOME/.config/bin:$PATH"

## sensible defaults
EDITOR=$(which nvim)
export EDITOR
export HISTSIZE=20000
export SAVEHIST=100000

################################################################################
## sourcing third party deps
################################################################################

## starship initialization
eval "$(starship init bash)"

## bash completion
HOMEBREW_PREFIX="$(brew --prefix)"
if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
  export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi

## setting up fzf
eval "$(fzf --bash)"

## setting up zoxide (better cd)
eval "$(zoxide init bash)"
