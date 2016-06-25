#! /usr/bin/env sh

copyCmd=''

command -v xclip >/dev/null 2>&1 \
  && { copyCmd='xclip -selection c'; }

if [ "${copyCmd}" = '' ]; then
  command -v pcopy >/dev/null 2>&1 \
    && { copyCmd='pbcopy'; }
fi

if [ "$*" = '' ]; then
  ${copyCmd}
else
  ${copyCmd} "$*"
fi
