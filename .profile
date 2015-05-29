# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

startupDir="$HOME/startup.d"
startupLog="${startupDir}/startup.log"
mkdir -p "${startupDir}"
echo "$(date)" > "${startupLog}"
if [ -d "${startupDir}" ]; then
    for file in "${startupDir}"/*
    do
        if [ "${file}" != "${startupLog}" ]; then
            ${file} >> "${startupLog}" 2>&1
        fi
    done
fi

# fix touchpad issue upon unlocking the session
dbus-monitor --session "type='signal',interface='com.ubuntu.Upstart0_6'" | \
(
  while true; do
    read X
    #if echo $X | grep "desktop-lock" &> /dev/null; then
      # custom-lock-command-here;
    #elif echo $X | grep "desktop-unlock" &> /dev/null; then
      # custom-unlock-command-here;
    #fi
      
    if echo $X | grep "desktop-unlock" &> /dev/null; then
      synclient TapButton2=2 2>/dev/null
    fi
  done
) &
