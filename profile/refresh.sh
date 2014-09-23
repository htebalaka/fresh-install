#!/bin/bash

function if_osx {
   if [ $(uname) = "Darwin" ]; then
      echo "$1"
   else
      echo "$2"
   fi
}

HOME_PROFILE="${HOME}/$(if_osx ".bash_profile" ".profile")"
FRESH_INSTALL="${HOME}/gits/fresh-install"

PROFILE="${FRESH_INSTALL}/profile"
VIM="${FRESH_INSTALL}/vim"
GHCI="${FRESH_INSTALL}/ghci"
CABAL="${FRESH_INSTALL}/cabal"

# ensures the home profile imports $1
function import {
   if ! grep -Fq "$1" $HOME_PROFILE; then
      echo "source $1" >> $HOME_PROFILE
   fi
   . $HOME_PROFILE
}

# ensures the home folder contains the contents of $1. does not create
# the folder $1 itself; only copies its contents
function sync_home { rsync -rv ${1}/ ${HOME}/ }

# this function ensures that changes in the ~/gits folders have been
# reflected in the os, by copying files from ~/gits to their appropriate
# location, and having the profile source the relevent files
function profile-refresh {
   # update profile files
   import "${PROFILE}/profile.all"
   import "${PROFILE}/profile.$(if_osx "osx" "unix")"
   import "${PROFILE}/refresh.sh"
   import "${PROFILE}/cabal.sh"

   # update vim, ghci, cabal
   sync_home $VIM
   sync_home $GHCI
   sync_home $CABAL
   sync_home $THEANO
}

function nuke-all {
   # nuke vim
   rm -rf ~/.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   rsync -rv ${VIM}/ ${HOME}/
   vim +PluginInstall +qall

   profile-refresh
}

