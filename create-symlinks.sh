#!/usr/bin/env bash

local DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir ~/.bash_old
cp ~/.bash_bindings ~/.bash_old
cp ~/.bash_fxns ~/.bash_old
cp ~/.bash_logout ~/.bash_old
cp ~/.bashrc ~/.bash_old
cp ~/.bash_vars ~/.bash_old
cp ~/.Xresources ~/.bash_old

ln -s ~/.bash_bindings "${DIR}/.bash_bindings"
ln -s ~/..bash_fxns "${DIR}/.bash_fxns"
ln -s ~/.bash_logout "${DIR}/.bash_logout"
ln -s ~/.bashrc "${DIR}/.bashrc"
ln -s ~/.bash_vars "${DIR}/.bash_vars"
ln -s ~/.Xresources "${DIR}/.Xresources"
