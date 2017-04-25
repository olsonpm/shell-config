#!/usr/bin/env sh

cat "$@" | perl -p -e 's/\s*(?:.*?)\s*/\1/'
