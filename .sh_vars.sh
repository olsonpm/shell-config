#!/usr/bin/env sh

export personal="${HOME}/git-repos/personal"
export tmp="${HOME}/tmp"
export forked="${HOME}/git-repos/forked"
export cloned="${HOME}/git-repos/cloned"
export work="${HOME}/git-repos/work"
export pr="${HOME}/git-repos/pr"
export PATH=$HOME/bin:$PATH
export dupes="${HOME}/git-repos/dupes"

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
  export ELECTRON_OZONE_PLATFORM_HINT='wayland'
  export QT_QPA_PLATFORM=wayland
fi
