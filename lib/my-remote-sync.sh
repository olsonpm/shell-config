#! /usr/bin/env sh
# shellcheck disable=SC2029,SC2086

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

sourceLocalDir="$(realpath "${1}")"
userAtHost="${2}"
destRemoteDir="${3}"
error=0

if [ ! -d "${sourceLocalDir}" ]; then
  error=1
  echo "'${sourceLocalDir}' is not a directory" >&2
fi

# per `man ssh_config` -> 'PreferredAuthentications', these are the possible
#   authentication mechanisms beside public key
sshOptions="-o ConnectTimeout=1\
 -o GSSAPIAuthentication=no\
 -o HostbasedAuthentication=no\
 -o KbdInteractiveAuthentication=no\
 -o PasswordAuthentication=no"

# test ssh connection
ssh ${sshOptions} "${userAtHost}" exit

exitCode="$?"
if [ "${exitCode}" != "0" ]; then
  echo "unable to ssh via public key to ${userAtHost}" >&2
  exit 1
fi

if ssh ${sshOptions} "${userAtHost}" "[ -e ${destRemoteDir} ] && [ ! -d ${destRemoteDir} ]"; then
  error=1
  echo "'${destRemoteDir}' exists and is not a directory" >&2
fi

if [ ${error} = 1 ]; then
  exit 1
fi

rsyncOptions="--delete -ahvz --exclude=node_modules --exclude=tests --exclude=.git"

ssh ${sshOptions} "${userAtHost}" "rm -rf ${destRemoteDir} && mkdir ${destRemoteDir}"
rsync ${rsyncOptions} "${sourceLocalDir}/" "${userAtHost}:${destRemoteDir}/"
while inotifywait -r -e modify,create,delete "${sourceLocalDir}"; do
  rsync ${rsyncOptions} "${sourceLocalDir}/" "${userAtHost}:${destRemoteDir}/"
done
