#! /usr/bin/env sh

git grep -I "${@}" -- ':!*package-lock.json' ':!*yarn.lock'
