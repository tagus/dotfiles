
if [[ -d $HOME/.dotfiles ]]; then
  DOTFILES=$HOME/.dotfiles
else
  echo "~/.dotfiles not found"
  exit 1
fi

source $DOTFILES/bash/macros.sh
source $DOTFILES/bash/env.sh
source $DOTFILES/bash/prompt.sh
source $DOTFILES/bash/autocomplete.sh
source $DOTFILES/bash/alias.sh
