################################################################################
## setting up the ideal environment
################################################################################

## useful aliases
alias ls='ls -G'
alias less='less -RN'
alias tree='tree -C'
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

## adding vscode to PATH
VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
if [[ -d "$VSCODE_PATH" ]]; then
  export PATH=$PATH:$VSCODE_PATH
fi
