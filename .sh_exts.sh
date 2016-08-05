#! /usr/bin/env sh

. "${HOME}/.sh_fxns.sh"
. "${HOME}/.sh_misc.sh"
. "${HOME}/.sh_vars.sh"

if [ -e "${HOME}/.sh_priv.sh" ]; then
  . "${HOME}/.sh_priv.sh"
fi
