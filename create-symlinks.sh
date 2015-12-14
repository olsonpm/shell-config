#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cp ~/.jshintrc ~/.jshintrc.old 2>/dev/null
cp ~/.sh_vars ~/.sh_vars.old 2>/dev/null
cp ~/.Xresources ~/.Xresources.old 2>/dev/null
cp -r ~/perl-bits ~/perl-bits.old 2>/dev/null

if [ -d ~/bin ]; then
  cp ~/bin/basename_sort ~/bin/basename_sort.old 2>/dev/null
  cp ~/bin/cdd ~/bin/cdd.old 2>/dev/null
  cp ~/bin/lss ~/bin/lss.old 2>/dev/null
  cp ~/bin/mkdirr ~/bin/mkdirr.old 2>/dev/null
else
  mkdir ~/bin
fi

rm -rf ~/.jshintrc
rm -rf ~/.sh_vars
rm -rf ~/.Xresources
rm -rf ~/perl-bits
rm -rf ~/bin/basename_sort
rm -rf ~/bin/cdd
rm -rf ~/bin/lss
rm -rf ~/bin/mkdirr

ln -s "${DIR}/.jshintrc" ~/.jshintrc
ln -s "${DIR}/.sh_vars" ~/.sh_vars
ln -s "${DIR}/.Xresources" ~/.Xresources
ln -s "${DIR}/perl-bits" ~/perl-bits
ln -s "${DIR}/bin/basename_sort" ~/bin/basename_sort
ln -s "${DIR}/
ln -s "${DIR}/bin/cdd" ~/bin/cdd
ln -s "${DIR}/bin/lss" ~/bin/lss
ln -s "${DIR}/bin/mkdirr" ~/bin/mkdirr

echo "Finished"
