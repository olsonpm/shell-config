#! /usr/bin/env bash

function cdd() {
  dir=""
  filter=""

  if [ "$1" != "" ]; then
    dir="$1"
  fi

  if [ "$2" != "" ]; then
    filter="$2"
  fi

  if [ "$filter" != "" ]; then
    cd "$dir" && ls | grep -i "$filter"
  elif [ "$dir" != "" ]; then
    cd "$dir" && ls
  elif [ "$dir" = "" ]; then
    cd ~ && ls
  fi
}

function mkdirr() {
  if [ "$1" != "" ]; then
    mkdir "$1" && cd "$1"
  else
    echo "Error: No arguments were given"
  fi
}
