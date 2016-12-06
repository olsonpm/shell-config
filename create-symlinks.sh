#!/usr/bin/env sh

DIR="$( cd "$( dirname "${0}" )" && pwd )"

cp "${HOME}/.babelrc ${HOME}/.babelrc.old" 2>/dev/null
cp "${HOME}/.eslintrc.json ${HOME}/.eslintrc.old.json" 2>/dev/null
cp "${HOME}/.jsbeautifyrc ${HOME}/.jsbeautifyrc.old" 2>/dev/null
cp "${HOME}/.jshintrc ${HOME}/.jshintrc.old" 2>/dev/null
cp "${HOME}/.sh_vars.sh ${HOME}/.sh_vars.old.sh" 2>/dev/null
cp "${HOME}/.sh_fxns.sh ${HOME}/.sh_fxns.old.sh" 2>/dev/null
cp "${HOME}/.sh_exts.sh ${HOME}/.sh_exts.old.sh" 2>/dev/null
cp "${HOME}/.sh_misc.sh ${HOME}/.sh_misc.old.sh" 2>/dev/null
rm -rf "${HOME}/perl-bits.old" 2>/dev/null
cp -r "${HOME}/perl-bits" "${HOME}/perl-bits.old" 2>/dev/null

if [ -d "${HOME}/bin" ]; then
  cp "${HOME}/bin/basename_sort ${HOME}/bin/basename_sort.old" 2>/dev/null
  cp "${HOME}/bin/cless ${HOME}/bin/cless.old" 2>/dev/null
  cp "${HOME}/bin/copy ${HOME}/bin/copy.old" 2>/dev/null
  cp "${HOME}/bin/paste ${HOME}/bin/paste.old" 2>/dev/null
  cp "${HOME}/bin/pwdcp ${HOME}/bin/pwdcp.old" 2>/dev/null
  cp "${HOME}/bin/suspend ${HOME}/bin/suspend.old" 2>/dev/null
  cp "${HOME}/bin/trash ${HOME}/bin/trash.old" 2>/dev/null
else
  mkdir "${HOME}/bin"
fi

rm -rf "${HOME}/.babelrc"
rm -rf "${HOME}/.eslintrc.json"
rm -rf "${HOME}/.jsbeautifyrc"
rm -rf "${HOME}/.jshintrc"
rm -rf "${HOME}/.sh_vars.sh"
rm -rf "${HOME}/.sh_fxns.sh"
rm -rf "${HOME}/.sh_exts.sh"
rm -rf "${HOME}/.sh_misc.sh"
rm -rf "${HOME}/perl-bits"
rm -rf "${HOME}/bin/basename_sort"
rm -rf "${HOME}/bin/copy"
rm -rf "${HOME}/bin/cless"
rm -rf "${HOME}/bin/paste"
rm -rf "${HOME}/bin/pwdcp"
rm -rf "${HOME}/bin/suspend"
rm -rf "${HOME}/bin/trash"

ln -s "${DIR}/.babelrc" "${HOME}/.babelrc"
ln -s "${DIR}/.eslintrc.json" "${HOME}/.eslintrc.json"
ln -s "${DIR}/.jsbeautifyrc" "${HOME}/.jsbeautifyrc"
ln -s "${DIR}/.jshintrc" "${HOME}/.jshintrc"
ln -s "${DIR}/.sh_vars.sh" "${HOME}/.sh_vars.sh"
ln -s "${DIR}/.sh_fxns.sh" "${HOME}/.sh_fxns.sh"
ln -s "${DIR}/.sh_exts.sh" "${HOME}/.sh_exts.sh"
ln -s "${DIR}/.sh_misc.sh" "${HOME}/.sh_misc.sh"
ln -s "${DIR}/perl-bits" "${HOME}/perl-bits"
ln -s "${DIR}/bin/basename_sort" "${HOME}/bin/basename_sort"
ln -s "${DIR}/bin/cless" "${HOME}/bin/cless"
ln -s "${DIR}/bin/copy" "${HOME}/bin/copy"
ln -s "${DIR}/bin/paste" "${HOME}/bin/paste"
ln -s "${DIR}/bin/pwdcp" "${HOME}/bin/pwdcp"
ln -s "${DIR}/bin/suspend" "${HOME}/bin/suspend"
ln -s "${DIR}/bin/trash" "${HOME}/bin/trash"

echo "Finished"
