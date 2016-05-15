#! /usr/bin/env sh

trashDir="${HOME}/.trash"

if [ ! -e "${trashDir}" ]; then
  mkdir "${trashDir}"
elif [ -e "${trashDir}" ] && [ ! -d "${trashDir}" ]; then
  >&2 echo "Error: File: '${trashDir}' is not a directory"
  exit 1
fi

for fd in "$@"; do
  mv "${fd}" "${trashDir}"
done
