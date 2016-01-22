#!/usr/bin/env sh

export GIT_PAGER='';

setopt extendedglob

platform=$(uname)
if [ "${platform}" != "Darwin" ]; then
  command -v xrdb >/dev/null 2>&1 && xrdb -merge $HOME/.Xresources
fi

bindkey "\033[;55" backward-kill-word
bindkey "\033[53" kill-word
bindkey "\C-k" kill-whole-line
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
