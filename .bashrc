_os="$(uname -s)"

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

# checks if the given command exists
function exists() {
  if [[ ! -z $1 ]]; then
    command -v $1 > /dev/null
    return $?
  else
    return 1
  fi
}

# determines the pid of an application running
# at the specified port
function port() {
  if [[ ! -z $1 ]]; then
    lsof -t -i :$1
  fi
}

# removes anything currently in the clipboard
# and replaces it with the word 'cleared'
clear-cb() {
  echo "cleared" | pbcopy;
}


# loading git aware prompt
if [ ! -d $HOME/.bash/git-aware-prompt ]; then
  echo "did not find git aware prompt"
  return 
else
  export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
  source "${GITAWAREPROMPT}/main.sh"
fi

# direnv
if exists direnv; then
  eval "$(direnv hook bash)"
else
  echo "did not find direnv"
  return
fi

# setting up golang
if exists go; then
  export GOPATH=$HOME/gocode
  export GOBIN=$GOPATH/bin
  export PATH=$GOBIN:$PATH
fi

# setting up yarn
if exists yarn; then
  export PATH=$(yarn global bin):$PATH
fi

# alias(es)
# TODO: add general support for colors
# alias ls='ls -G'
alias tree='tree -C'
alias myp='ifconfig | grep inet | awk "{print $2}" | sed -e "s/\/.*$//" | head -n 1'

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
export EDITOR=/usr/bin/vim

# add ruby gems to path
if exists ruby && exists gem; then 
  GEM_PATH=$(ruby -r rubygems -e 'puts Gem.user_dir')
  PATH="$GEM_PATH/bin:$PATH"
fi

# OS specific config
case $_os in
  Darwin) 
    alias gpg=gpg2
    export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    ;;
  Linux)
    if cat /proc/sys/kernel/osrelease | rg 'Microsoft' > /dev/null; then
        alias pbcopy="clip.exe"
        alias pbpaste="powershell.exe -command 'Get-Clipboard'"
    elif exists xclip; then
    	alias pbcopy="xclip -sel clip"
	    alias pbpaste="xclip -sel clip -o"
    else
      echo "did not find xclip"
      return
    fi
    ;;
esac
