#!/bin/bash

################################################################################
## helper functions that I've found useful over the years
################################################################################

ts() {
  # ts displays the tree output for the given directory
  # usage:
  #   ts
  #   ts <num>
  #   ts <dir>
  #   ts <dir> <num>
  if [[ -z $1 ]]; then
    tree -aCL 1
  else
    if [[ $1 =~ ^[0-9]+$ ]]; then
      tree -aCL "$1"
    else
      if [[ -z $2 ]]; then
        tree -aC "$1" -L 1
      else
        tree "$1" -aCL "$2"
      fi
    fi
  fi
}

exists() {
  # exists checks for the existence of a given command and
  # appropriately sets the exit code
  if [[ -n $1 ]]; then
    command -v "$1" >/dev/null
    return $?
  else
    return 1
  fi
}

port() {
  # determines the pid of an application running at the specified port
  if [[ -n $1 ]]; then
    lsof -t -i :"$1"
  fi
}

rand() {
  # random outputs a random 128 alphanumeric character
  DEFAULT_LEN=128
  echo $RANDOM | md5 | head -c "${1:-$DEFAULT_LEN}"
  echo
}

tolower() {
  # converts stdin to lowercase
  tr '[:upper:]' '[:lower:]'
}

toupper() {
  # converts stdin to uppercase
  tr '[:lower:]' '[:upper:]'
}

heic() {
  # heic converts all heic files to half size jpegs
  # heic is the default format for iphone photos and are usually way too
  # large for transport; use this command to quickly convert them to a sensible jpeg
  for f in *.heic; do
    echo "converting $f"
    convert -resize 50% "$f" "${f%.*}.jpeg"
  done
}

storage-usage() {
  DEFAULT_LIMIT=10
  du -hd 1 . 2>/dev/null | sort -rh | head -n "${10:-$DEFAULT_LIMIT}"
}

filter-json() {
  # filter_json filters out any invalid json from stdin
  while IFS= read -r line; do
    echo "$line" | jq empty 2>/dev/null && echo "$line"
  done
}

commit-has-changes() {
  # commit-has-changes checks if the second commit has the changes in the first commit
  # if true, then the first commit is an ancestor of the second commit
  # if false, then the first commit is not an ancestor and the second commit doesn't have changes
  # from the first commit
  git merge-base --is-ancestor "$1" "$2"
}

get-first-col() {
  # useful for parsing the pod name from the output of `kubectl get pods`
  cut -d' ' -f1
}

# Create a Tmux Dev Layout with editor, terminal, and optional codex
# Usage: tdl [-c]
tdl() {
  [[ -z $TMUX ]] && {
    echo "You must start tmux to use tdl."
    return 1
  }

  local launch_codex=false
  OPTIND=1
  while getopts 'c' opt; do
    case $opt in
    c)
      launch_codex=true
      ;;
    \?)
      echo "Usage: tdl [-c]"
      return 1
      ;;
    esac
  done
  shift $((OPTIND - 1))

  if [[ $# -ne 0 ]]; then
    echo "Usage: tdl [-c]"
    return 1
  fi

  local current_dir="${PWD}"
  local editor_pane console_pane codex_cmd

  # Use TMUX_PANE for the pane we're running in (stable even if active window changes)
  editor_pane="$TMUX_PANE"

  # Name the current window after the base directory name
  tmux rename-window -t "$editor_pane" "$(basename "$current_dir")"

  if [[ $launch_codex == true ]]; then
    # With -c, split vertically - editor on top 70%, console on bottom 30%.
    console_pane=$(tmux split-window -v -p 30 -t "$editor_pane" -c "$current_dir" -P -F '#{pane_id}')

    if exists codex; then
      codex_cmd="codex resume --last -C \"$current_dir\" || codex -C \"$current_dir\""

      # Resume the latest Codex session in the bottom pane when available.
      tmux send-keys -t "$console_pane" "$codex_cmd" C-m
    else
      echo "codex not found; skipping codex pane"
    fi
  else
    # Without -c, split horizontally - editor on left 70%, console on right 30%.
    tmux split-window -h -p 30 -t "$editor_pane" -c "$current_dir"
  fi

  # Run nvim in the left pane
  tmux send-keys -t "$editor_pane" "$EDITOR ." C-m

  # Select the nvim pane for focus
  tmux select-pane -t "$editor_pane"
}
