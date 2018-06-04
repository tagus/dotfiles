# loading git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# direnv
eval "$(direnv hook bash)"

# alias(es)
alias ls='ls -G'
alias t='tree -C'
alias ts='t -L 1'
alias tree='tree -C'

# cd helpers
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# bash ui
# adding color to bash
export PS1="\[$txtgrn\]\w \[$txtrst\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n> "

# bash tips implementation
export PATH=$PATH:$HOME/.local/bin
export CDPATH=.:~:~/Documents:~/Desktop
export HISTIGNORE="&:ls:ls *"
export EDITOR=/usr/bin/vim

# macros
function ts() {
  if [[ -z $1 ]]; then
    tree -L 1
  else
    if [[ $1 =~ ^[0-9]+$ ]]; then
      tree -L $1
    else
      if [[ -z $2 ]]; then
        tree $1
      else
        tree $1 -L $2
      fi
    fi
  fi
}
