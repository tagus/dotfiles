# helper function for displaying directories in a tree structure
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

function rand() {
  DEFAULT_LEN=128
  echo $RANDOM | md5 | head -c ${1:-$DEFAULT_LEN}; echo;
}
