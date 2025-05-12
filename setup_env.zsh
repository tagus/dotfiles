################################################################################
## setting up the ideal environment
################################################################################

## useful aliases
alias ls='ls -G'
alias less='less -RN'
alias tree='tree -C'
alias tt='toggle-theme'
alias caf='caffeinate -di'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

if exists gpg2; then
  alias gpg=gpg2
fi

################################################################################

## sensible defaults
export EDITOR=$(which vim)
export HISTSIZE=20000
export SAVEHIST=100000
export CDPATH=.:~:~/Desktop

# avoid pyenv from modifying prompt
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

## ensuring that history is persisted immediately and is available
## across all zsh sessions

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt PROMPT_SUBST

## setting up auto completions
autoload -Uz compinit && compinit

## starship initialization
source <(starship init zsh)

################################################################################

## path decorations
if [[ -d "~/.local/bin" ]]; then
  export PATH=$PATH:$HOME/.local/bin
fi

if exists go; then
  export GOPATH="$HOME/go"
  export GOBIN="$GOPATH/bin"
  # adding go bin to $PATH
  export PATH=$PATH:$GOBIN
fi

## adding vscode to PATH
VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if [[ -d "$VSCODE_PATH" ]]; then
  export PATH=$PATH:$VSCODE_PATH
fi
