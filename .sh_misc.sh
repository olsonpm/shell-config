#!/usr/bin/env sh

inSshSession() {
  [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ];
}

# shellcheck disable=SC2039
case "${OSTYPE}" in
  darwin*)
    alias ls='ls -G' ;;

  linux-gnu)
    if ! inSshSession; then
      if [ "$(command -v xset)" ]; then
        xset r rate 200 100
      else
        echo "warning: xset command not found - keyboard repeat rates not set"
      fi
    fi
    alias ls='ls --color=auto' ;;
esac

export EDITOR='nano'
export GIT_PAGER=''

setopt extendedglob

alias git-list-untracked='git ls-files --others --exclude-standard'

bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^k' kill-whole-line
bindkey '^u' backward-kill-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^I' expand-or-complete
bindkey '^[[3~' delete-char

if [ "$(command -v codium)" ]; then
  alias code="codium"
fi

alias c.='codium .'
alias e.='nautilus --new-window . >/dev/null 2>&1 &!'

# NSS related env vars
export NSS_DEFAULT_DB_TYPE='sql:'

alias un7zip='7za e'

# zsh is so much fun -.-
read_history_then_reverse_search() {
  fc -R && zle history-incremental-search-backward
}

zle -N read_history_then_reverse_search

# '^[[101;6u' is ctrl+shift+e
bindkey '^[[101;6u' read_history_then_reverse_search
