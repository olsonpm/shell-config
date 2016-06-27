#! /usr/bin/env sh

pasteCmd=''

command -v xclip >/dev/null 2>&1 \
  && { pasteCmd='xclip -o -selection c'; }

if [ "${pasteCmd}" = '' ]; then
  command -v pbPaste >/dev/null 2>&1 \
    && { pasteCmd='pbPaste'; }
fi

if [ "${pasteCmd}" = '' ]; then
  echo "no paste command found!" >&2
  exit 1
fi

if [ "$*" = '' ]; then
  ${pasteCmd}
else
  ${pasteCmd} "$*"
fi
