#!/usr/bin/env sh

DIR="$( cd "$( dirname "${0}" )" && pwd )"

cp ${HOME}/.eslintrc ${HOME}/.eslintrc.old 2>/dev/null
cp ${HOME}/.jshintrc ${HOME}/.jshintrc.old 2>/dev/null
cp ${HOME}/.jsbeautifyrc ${HOME}/.jsbeautifyrc.old 2>/dev/null
cp ${HOME}/.sh_vars.sh ${HOME}/.sh_vars.old.sh 2>/dev/null
cp ${HOME}/.sh_fxns.sh ${HOME}/.sh_fxns.old.sh 2>/dev/null
cp ${HOME}/.sh_exts.sh ${HOME}/.sh_exts.old.sh 2>/dev/null
cp ${HOME}/.sh_misc.sh ${HOME}/.sh_misc.old.sh 2>/dev/null
cp -r ${HOME}/perl-bits ${HOME}/perl-bits.old 2>/dev/null

if [ -d ${HOME}/bin ]; then
  cp ${HOME}/bin/basename_sort ${HOME}/bin/basename_sort.old 2>/dev/null
  cp ${HOME}/bin/suspend ${HOME}/bin/suspend.old 2>/dev/null
else
  mkdir ${HOME}/bin
fi

rm -rf ${HOME}/.jshintrc
rm -rf ${HOME}/.eslintrc.json
rm -rf ${HOME}/.jsbeautifyrc
rm -rf ${HOME}/.sh_vars.sh
rm -rf ${HOME}/.sh_fxns.sh
rm -rf ${HOME}/.sh_exts.sh
rm -rf ${HOME}/.sh_misc.sh
rm -rf ${HOME}/perl-bits
rm -rf ${HOME}/bin/basename_sort
rm -rf ${HOME}/bin/suspend

ln -s "${DIR}/.eslintrc.json" ${HOME}/.eslintrc.json
ln -s "${DIR}/.jshintrc" ${HOME}/.jshintrc
ln -s "${DIR}/.jsbeautifyrc" ${HOME}/.jsbeautifyrc
ln -s "${DIR}/.sh_vars.sh" ${HOME}/.sh_vars.sh
ln -s "${DIR}/.sh_fxns.sh" ${HOME}/.sh_fxns.sh
ln -s "${DIR}/.sh_exts.sh" ${HOME}/.sh_exts.sh
ln -s "${DIR}/.sh_misc.sh" ${HOME}/.sh_misc.sh
ln -s "${DIR}/perl-bits" ${HOME}/perl-bits
ln -s "${DIR}/bin/basename_sort" ${HOME}/bin/basename_sort
ln -s "${DIR}/bin/suspend" ${HOME}/bin/suspend

echo "Finished"
