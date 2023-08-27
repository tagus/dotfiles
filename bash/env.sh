# loading git aware prompt
if [ ! -d $HOME/.bash/git-aware-prompt ]; then
  echo "did not find git aware prompt"
  return
else
  export GITAWAREPROMPT=$HOME/.bash/git-aware-prompt
  source "${GITAWAREPROMPT}/main.sh"
fi


# direnv
# basically ensuring that this is only being run from a terminal (tty)
if [ -t 0 ]; then
  if exists direnv; then
    eval "$(direnv hook bash)"
  else
    echo "did not find direnv"
  fi
fi


# setting up golang
if exists go; then
  export GOPATH=$HOME/gocode
  export GOBIN=$GOPATH/bin
  export PATH=/usr/local/go/bin:$GOBIN:$PATH
  export CGO_CFLAGS_ALLOW="-Xpreprocessor"
fi


# sensible defaults
export CDPATH=.:~:~/Documents:~/Desktop
export EDITOR=/usr/bin/vim


# PATH decorations
export PATH=$PATH:$HOME/.local/bin

if exists yarn; then
  export PATH=$(yarn global bin):$PATH
fi

# add ruby gems to PATH
if exists ruby && exists gem; then
  GEM_PATH=$(ruby -r rubygems -e 'puts Gem.user_dir')
  PATH="$GEM_PATH/bin:$PATH"
fi

# adding python pacakges to PATH
if exists python3; then
    PATH="$(python3 -m site --user-base)/bin:${PATH}"
fi


# OS specific config
_os="$(uname -s)"
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
