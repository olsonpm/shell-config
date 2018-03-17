#! /usr/bin/env sh

sourceDir="$(realpath "${1}")"
destDir="$(realpath "${2}")"
error=0

if [ ! -d "${sourceDir}" ]; then
  error=1
  echo "'${sourceDir}' is not a directory" >&2
fi
if [ -e "${destDir}" ] && [ ! -d "${destDir}" ]; then
  error=1
  echo "'${destDir}' exists and is not a directory" >&2
fi

if [ ${error} = 0 ]; then
  rm -rf "${destDir}"
  mkdir "${destDir}"
  rsync --delete -ahvz --exclude=node_modules --exclude=tests --exclude=.git "${sourceDir}/" "${destDir}/"
  while inotifywait -r -e modify,create,delete "${sourceDir}"; do
    rsync --delete -ahvz --exclude=node_modules --exclude=tests --exclude=.git "${sourceDir}/" "${destDir}/"
  done
fi
