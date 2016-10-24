#! /usr/bin/env sh

cdd() {
  dir=""
  filter=""

  if [ "$1" != "" ]; then
    dir="$1"
  fi

  if [ "$2" != "" ]; then
    filter="$2"
  fi

  if [ "$filter" != "" ]; then
    # shellcheck disable=SC2010
    cd "$dir" && ls | grep -i "$filter"
    elif [ "$dir" != "" ]; then
    cd "$dir" && ls
    elif [ "$dir" = "" ]; then
    cd ~ && ls
  fi
}

mkdirr() {
  if [ "$1" != "" ]; then
    # shellcheck disable=SC2164
    mkdir "$1" && cd "$1"
  else
    echo "Error: No arguments were given"
  fi
}
