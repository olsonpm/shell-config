#! /usr/bin/env sh

#---------------------------------
# example
# to move the active window and your workspace to the first workspace
# ./move-window-and-workspace.sh 0
# to move to the second workspace
# ./move-window-and-workspace.sh 1
#---------------------------------

wmctrl -r :ACTIVE: -t $1; wmctrl -s $1
