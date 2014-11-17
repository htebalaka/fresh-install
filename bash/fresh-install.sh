#!/bin/bash

FRESH_INSTALL="${HOME}/gits/fresh-install"
PROFILE="${FRESH_INSTALL}/profile"
VIM="${FRESH_INSTALL}/vim"
GHCI="${FRESH_INSTALL}/ghci"
CABAL="${FRESH_INSTALL}/cabal"
THEANO="${FRESH_INSTALL}/theano"
TASKWARRIOR="$FRESH_INSTALL/taskwarrior"

# this function ensures that changes in the ~/gits folders have been
# reflected in the os, by copying files from ~/gits to their appropriate
# location, and having the profile source the relevent files
function fresh-install-refresh {
   # update vim, ghci, cabal
   rsync -rv ${VIM}/.vimrc.local ${HOME}/.vimrc.local
   rsync -rv ${GHCI}/.ghci ${HOME}/.ghci
   rsync -rv ${CABAL}/config.$(if_osx "osx" "unix") ${HOME}/.cabal/config
   rsync -rv ${THEANO}/.theanorc.$(if_osx "osx" "unix") ${HOME}/.theanorc
   rsync -rv ${TASKWARRIOR}/.taskrc ${HOME}/.taskrc
}

function fresh-install-install {
   echo ""
}
