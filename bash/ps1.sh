#!/bin/bash

function git-ps1 {
   export GIT_PS1_SHOWDIRTYSTATE=1
   export GIT_PS1_SHOWSTASHSTATE=1
   export GIT_PS1_SHOWUNTRACKEDFILES=1
   # Explicitly unset color (default anyhow). Use 1 to set it.
   export GIT_PS1_SHOWCOLORHINTS=1
   export GIT_PS1_DESCRIBE_STYLE="branch"
   export GIT_PS1_SHOWUPSTREAM="auto git"
 }


function cabal-sandbox-config {
   local sandbox=$(haskell-sandbox '%s')
   if [ -z ${sandbox} ]
   then
      # we have to be careful to unset the CABAL_SANDBOX_CONFIG variable
      # when it is empty, or cabal becomes screwy
      unset CABAL_SANDBOX_CONFIG
   else
      export CABAL_SANDBOX_CONFIG=${sandbox}
   fi
 }

# should add taskwarrior, jobs, working color, time, log
function ps1 {
   git-ps1
   cabal-sandbox-config

   PS1=""
   PS1+="\[$cyan\]\$(haskell-sandbox '%n ')\[$color_off\]"
   PS1+="\[$yellow\]\$(__git_ps1 '%s ')\[$color_off\]"
   PS1+="\[$green\]\u\[$color_off\]:"
   PS1+="\[$red\]\w\[$color_off\]$ "
   export PS1
}
export PROMPT_COMMAND=ps1
