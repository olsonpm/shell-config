#! /usr/bin/env sh

copyCmd=''

command -v xclip >/dev/null 2>&1 \
  && { copyCmd='xclip -selection c'; }

if [ "${copyCmd}" = '' ]; then
  command -v pbcopy >/dev/null 2>&1 \
    && { copyCmd='pbcopy'; }
fi

if [ "${copyCmd}" = '' ]; then
  echo "no copy command found!" >&2
  exit 1
fi

if [ "$*" = '' ]; then
  ${copyCmd}
else
  ${copyCmd} "$*"
fi
