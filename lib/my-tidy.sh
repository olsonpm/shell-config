#! /usr/bin/env sh

if [ $# -eq 0 ]; then
  cat "$@" | tidy -i -q --tidy-mark no | source-highlight -f esc -s html
elif [ "${1}" = "--no-color" ]; then
  shift
  cat "$@" | tidy -i -q --tidy-mark no
else
  echo "error - unexpected arguments" 1>&2
  echo "usage" 1>&2
  echo "my-tidy [--no-color]" 1>&2
  exit 1
fi
