#!/usr/bin/env bash

set -euo pipefail

pane="${1:-${TMUX_PANE:-}}"
if [[ -z "$pane" ]]; then
  echo "tmux pane not found" >&2
  exit 1
fi

# Starship's default prompt symbol in this config is `❯`.
# Capture the block between the last two prompt lines so we show the previous
# command output instead of the current prompt or the full history buffer.
prompt_re='^[[:space:]]*❯[[:space:]]*'

tmux capture-pane -epJ -S - -t "$pane" | awk -v prompt_re="$prompt_re" '
$0 ~ prompt_re {
  if (saw_prompt) {
    prev = block
  }
  saw_prompt = 1
  block = ""
  next
}
saw_prompt {
  block = block $0 ORS
}
END {
  out = prev
  if (out == "") {
    out = block
  }
  printf "%s", out
}
' | less -R
