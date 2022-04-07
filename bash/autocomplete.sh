if ! exists complete; then
  echo "bash-completion not found"
fi

# make
complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | \
  sed 's/[^a-zA-Z0-9_.-]*$//'\`" make
