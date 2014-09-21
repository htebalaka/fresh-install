#!/bin/bash
FRESH_INSTALL="${HOME}/gits/fresh-install"

PROFILE="${FRESH_INSTALL}/profile"
HOME_PROFILE=$(if_osx "${HOME}/.bash_profile" "${HOME}/.profile")
PROFILE_ALL="${PROFILE}/profile.all"
PROFILE_OS="${PROFILE}/profile.$(if_osx "osx" "unix")"

VIM="${FRESH_INSTALL}/vim"

# naive check of which computer im using
function if_osx {
   if [ -f ~/.bash_profile ]; then
      echo "$1"
   else
      echo "$2"
   fi
}

# ensures the home profile imports $1
function import {
   if ! grep -Fq "$1" $HOME_PROFILE; then
      echo "source $1" >> $HOME_PROFILE
   fi
   . $HOME_PROFILE
}

# 
function refresh {
   # update profile files
   import $PROFILE_ALL
   import $PROFILE_OS
   import "${FRESH_INSTALL}/refresh.sh"
   # update vim
   rsync -rv ${VIM}/ ${HOME}/
}
