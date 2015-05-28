#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

rm -rf ~/.bash_old
mkdir ~/.bash_old
mv ~/.bash_bindings ~/.bash_old 2>/dev/null
mv ~/.bash_fxns ~/.bash_old 2>/dev/null
mv ~/.bash_logout ~/.bash_old 2>/dev/null
mv ~/.bash_vars ~/.bash_old 2>/dev/null
mv ~/.bashrc ~/.bash_old 2>/dev/null
mv ~/.profile ~/.bash_old 2>/dev/null
mv ~/.Xresources ~/.bash_old 2>/dev/null
mv ~/.xsessionrc ~/.bash_old 2>/dev/null

mkdir -p ~/startup.d
touch ~/startup.d/startup.log
mkdir -p ~/.bash_old/startup.d
mv ~/startup.d/misc.sh ~/.bash_old/misc.sh 2>/dev/null

ln -s "${DIR}/.bash_bindings" ~/.bash_bindings
ln -s "${DIR}/.bash_fxns" ~/.bash_fxns
ln -s "${DIR}/.bash_logout" ~/.bash_logout
ln -s "${DIR}/.bash_vars" ~/.bash_vars
ln -s "${DIR}/.bashrc" ~/.bashrc
ln -s "${DIR}/.profile" ~/.profile
ln -s "${DIR}/.Xresources" ~/.Xresources
ln -s "${DIR}/.xsessionrc" ~/.xsessionrc
ln -s "${DIR}/startup.d/misc.sh" ~/startup.d/misc.sh
