#!/usr/bin/env sh

export GIT_PAGER='';

setopt extendedglob

alias git-list-untracked='git ls-files --others --exclude-standard'

bindkey "\x08" backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^k' kill-whole-line
bindkey '^u' backward-kill-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^I' expand-or-complete

# I+Ctrl should be mapped to '\x02' (control + b).  This is to get around tab's
#   escape sequence being '^I'.
bindkey "\x02" kill-line

autoload -U add-zsh-hook
load_nvmrc() {
  if [ -f .nvmrc ] && [ -r .nvmrc ]; then
    nvm use
  fi
}
add-zsh-hook chpwd load_nvmrc

load_jenv() {
  if [ -s "/home/phil/.jenv/bin/jenv-init.sh" ]; then
    . "/home/phil/.jenv/bin/jenv-init.sh"
    . "/home/phil/.jenv/commands/completion.sh"
  fi
}

alias jqd='jq .dependencies package.json'

# NSS related env vars
export NSS_DEFAULT_DB_TYPE='sql:'
