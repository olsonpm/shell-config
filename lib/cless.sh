#! /usr/bin/env sh

src=$1
shift
cat "$@" | source-highlight -f esc -s "${src}" | less
