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
THEANO="${FRESH_INSTALL}/theano"
TASKWARRIOR="$FRESH_INSTALL/taskwarrior"

function permanently {
   if ! grep -Fq "$1" $HOME_PROFILE; then
      echo "$1" >> $HOME_PROFILE
   fi
   . $HOME_PROFILE
}

function import {
   permanently "source $1"
}
function prepend-path {
   permanently "export PATH=$1:\$PATH"
}
function append-path {
   permanently "export PATH=\$PATH:$1"
}

# ensures the home folder contains the contents of $1. does not create
# the folder $1 itself; only copies its contents
function sync_home {
   rsync -rv ${1}/ ${HOME}/ 
}

function git-ps1 {
   export GIT_PS1_SHOWDIRTYSTATE=1
   export GIT_PS1_SHOWSTASHSTATE=1
   export GIT_PS1_SHOWUNTRACKEDFILES=1
   # Explicitly unset color (default anyhow). Use 1 to set it.
   export GIT_PS1_SHOWCOLORHINTS=1
   export GIT_PS1_DESCRIBE_STYLE="branch"
   export GIT_PS1_SHOWUPSTREAM="auto git"

   # we have to be careful to unset the CABAL_SANDBOX_CONFIG variable
   # when it is empty, or cabal becomes screwy
   local sandbox=$(haskell-sandbox '%s')
   if [ -z ${sandbox} ]
   then
      unset CABAL_SANDBOX_CONFIG
   else
      export CABAL_SANDBOX_CONFIG=${sandbox}
   fi

   export PS1="\[$cyan\]\$(haskell-sandbox '%n ')\[$color_off\]\
\[$yellow\]\$(__git_ps1 '%s ')\[$color_off\]\
\[$green\]\u\[$color_off\]:\[$red\]\w\[$color_off\]$ "
   # need stuff for jobs, cmd #
}

export PROMPT_COMMAND=git-ps1

# should add taskwarrior, jobs, working color, time
git-ps1

# this function ensures that changes in the ~/gits folders have been
# reflected in the os, by copying files from ~/gits to their appropriate
# location, and having the profile source the relevent files
function profile-refresh {
   # update profile files
   import "${PROFILE}/profile.all"
   import "${PROFILE}/profile.$(if_osx "osx" "unix")"
   import "${PROFILE}/refresh.sh"
   import "${PROFILE}/cabal.sh"
   import "${PROFILE}/theano-env.sh"
   import "${PROFILE}/git-prompt.sh"
   import "${PROFILE}/color.sh"
   import "${PROFILE}/../ps1/eggtimer.sh"

   # update vim, ghci, cabal
   sync_home $VIM
   sync_home $GHCI
   rsync -rv ${CABAL}/config.$(if_osx "osx" "unix") ${HOME}/.cabal/config
   rsync -rv ${THEANO}/.theanorc.$(if_osx "osx" "unix") ${HOME}/.theanorc
   rsync -rv ${TASKWARRIOR}/.taskrc ${HOME}/.taskrc
}

function nuke-all {
   # nuke vim
   rm -rf ~/.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   rsync -rv ${VIM}/ ${HOME}/
   vim +PluginInstall +qall

   profile-refresh
}

