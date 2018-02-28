#! /usr/bin/env sh

sourceDir="$(realpath "${1}")"
destDir="$(realpath "${2}")"
error=0

if [ ! -d "${sourceDir}" ]; then
  error=1
  echo "'${sourceDir}' is not a directory" >&2
fi
if [ ! -d "${destDir}" ]; then
  error=1
  echo "'${destDir}' is not a directory" >&2
fi

if [ ${error} = 0 ]; then
  rm -rf "${destDir}"
  mkdir "${destDir}"
  rsync -avz "${sourceDir}/" "${destDir}/"
  while inotifywait -r -e modify,create,delete "${sourceDir}"; do
      rsync -avz "${sourceDir}/" "${destDir}/"
  done
fi
