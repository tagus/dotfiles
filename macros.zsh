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
      tree -aCL $1
    else
      if [[ -z $2 ]]; then
        tree -aC $1 -L 1
      else
        tree $1 -aCL $2
      fi
    fi
  fi
}


exists() {
  # exists checks for the existence of a given command and
  # appropriately sets the exit code
  if [[ -n $1 ]]; then
    command -v $1 > /dev/null
    return $?
  else
    return 1
  fi
}


port() {
  # determines the pid of an application running at the specified port
  if [[ -n $1 ]]; then
    lsof -t -i :$1
  fi
}


rand() {
  # random outputs a random 128 alphanumeric character
  DEFAULT_LEN=128
  echo $RANDOM | md5 | head -c ${1:-$DEFAULT_LEN}; echo;
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
    convert -resize 50% $f "${f%.*}.jpeg"
  done
}


storage-usage() {
  DEFAULT_LIMIT=10
  du -hd 1 . 2>/dev/null | sort -rh | head -n ${10:-$DEFAULT_LIMIT}
}


##################################################################################
## theming config
##################################################################################


is-dark() {
  # checks if the current appearance is set to light or dark mode
  # if exit code is 0, then dark, else light
  defaults read -g AppleInterfaceStyle &> /dev/null
}


toggle-theme() {
  # toggles the kitty theme based on the appearance config
  if is-dark ; then
    kitty +kitten themes Ayu
  else
    kitty +kitten themes GitHub Light
  fi
}
