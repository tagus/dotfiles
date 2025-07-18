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
  git merge-base --is-ancestor $1 $2
}


get-first-col() {
  # useful for parsing the pod name from the output of `kubectl get pods`
  cut -d' ' -f1
}