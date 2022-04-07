
if [[ -d $HOME/.dotfiles ]]; then
  DOTFILES=$HOME/.dotfiles
else
  echo "~/.dotfiles not found"
  exit 1
fi

. $DOTFILES/bash/macros.sh
. $DOTFILES/bash/env.sh
. $DOTFILES/bash/prompt.sh
. $DOTFILES/bash/autocomplete.sh
. $DOTFILES/bash/alias.sh
