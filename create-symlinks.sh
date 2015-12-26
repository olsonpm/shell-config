#!/usr/bin/env bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cp ${HOME}/.jshintrc ${HOME}/.jshintrc.old 2>/dev/null
cp ${HOME}/.jsbeautifyrc ${HOME}/.jsbeautifyrc.old 2>/dev/null
cp ${HOME}/.sh_vars.sh ${HOME}/.sh_vars.old.sh 2>/dev/null
cp ${HOME}/.sh_fxns.sh ${HOME}/.sh_fxns.old.sh 2>/dev/null
cp ${HOME}/.sh_exts.sh ${HOME}/.sh_exts.old.sh 2>/dev/null
cp ${HOME}/.Xresources ${HOME}/.Xresources.old 2>/dev/null
cp -r ${HOME}/perl-bits ${HOME}/perl-bits.old 2>/dev/null

if [ -d ${HOME}/bin ]; then
  cp ${HOME}/bin/basename_sort ${HOME}/bin/basename_sort.old 2>/dev/null
else
  mkdir ${HOME}/bin
fi

rm -rf ${HOME}/.jshintrc
rm -rf ${HOME}/.jsbeautifyrc
rm -rf ${HOME}/.sh_vars.sh
rm -rf ${HOME}/.sh_fxns.sh
rm -rf ${HOME}/.sh_exts.sh
rm -rf ${HOME}/.Xresources
rm -rf ${HOME}/perl-bits
rm -rf ${HOME}/bin/basename_sort

ln -s "${DIR}/.jshintrc" ${HOME}/.jshintrc
ln -s "${DIR}/.jsbeautifyrc" ${HOME}/.jsbeautifyrc
ln -s "${DIR}/.sh_vars.sh" ${HOME}/.sh_vars.sh
ln -s "${DIR}/.sh_fxns.sh" ${HOME}/.sh_fxns.sh
ln -s "${DIR}/.sh_exts.sh" ${HOME}/.sh_exts.sh
ln -s "${DIR}/.Xresources" ${HOME}/.Xresources
ln -s "${DIR}/perl-bits" ${HOME}/perl-bits
ln -s "${DIR}/bin/basename_sort" ${HOME}/bin/basename_sort

echo "Finished"
