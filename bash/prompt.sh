if [[ "$TERM" == "xterm-256color" ]]; then
  export PS1="\[$txtgrn\]\w \[$txtrst\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n> "
  return
fi

if ! exists powerline; then
  echo "please install powerline"
  return
fi

powerline-daemon -q

POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1

. $(python3 -m site --user-base)/lib/python/site-packages/powerline/bindings/bash/powerline.sh
