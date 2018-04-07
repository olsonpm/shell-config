#! /usr/bin/env sh

__join__result=""
join() {
  str1="${1}"
  str2="${2}"

  if [ "${str1}" != "" ] && [ "${str2}" != "" ]; then
    __join__result="${str1}, ${str2}"
  elif [ "${str1}" != "" ]; then
    __join__result="${str1}"
  else
    __join__result="${str2}"
  fi
}

commandsNotFound=""
if [ ! "$(command -v rsync)" ]; then
  commandsNotFound="rsync"
fi
if [ ! "$(command -v inotifywait)" ]; then
  join "${commandsNotFound}" "inotifywait"
  commandsNotFound="${__join__result}"
fi

if [ "${commandsNotFound}" != "" ]; then
  printf "Error: The following commands must be installed before using my-local-sync\\n\\n" >&2
  echo   "${commandsNotFound}" >&2
  exit 1
fi

#
# No errors, woo woo
#

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

if [ ${error} = 1 ]; then
  exit 1
fi

rm -rf "${destDir}"
mkdir "${destDir}"
rsync --delete -ahvz --exclude=node_modules --exclude=tests --exclude=.git "${sourceDir}/" "${destDir}/"
while inotifywait -r -e modify,create,delete "${sourceDir}"; do
  rsync --delete -ahvz --exclude=node_modules --exclude=tests --exclude=.git "${sourceDir}/" "${destDir}/"
done
