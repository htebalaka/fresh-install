#!/bin/bash

# activate one of the listed sandboxes
function hs-activate {
   sandbox="cabal.sandbox.config"
   case $1 in
      "hsrc" )
         export CABAL_SANDBOX_CONFIG="${HOME}/base/${sandbox}"
         export sandbox_name="hsrc"
         ;;
      "base" )
         export CABAL_SANDBOX_CONFIG="${HOME}/base/${sandbox}"
         export sandbox_name="(cabal-sandbox: base)"
         ;;
      "microbreak" )
         export CABAL_SANDBOX_CONFIG="${HOME}/gits/microbreak/${sandbox}"
         export sandbox_name="(cabal-sandbox: microbreak)"
         ;;
      "machinelearning" )
         export CABAL_SANDBOX_CONFIG="${HOME}/gits/machinelearning/${sandbox}"
         export sandbox_name="machinelearning"
         ;;
      "hashlab" )
         export CABAL_SANDBOX_CONFIG="${HOME}/gits/hashlab/${sandbox}"
         export sandbox_name="hashlab"
         ;;
      "here" )
         export CABAL_SANDBOX_CONFIG="$(pwd)/${sandbox}"
         export sandbox_name="${PWD##*/}"
         ;;
      *)
         echo "The current valid sandboxes are: microbreak, base, machinelearning"
   esac
}
# export PS1="\${sandbox_name}${PS1}"

# creates a new cabal sandbox
function cabal-sandbox-init {
   cabal sandbox init
   for arg in $@
   do cabal sandbox add-source $arg
   done
   cabal install --only-dependencies --enable-test && cabal configure && cabal build && cabal install && cabal clean
}

function cabal-nuke {
   cabal update
   cabal install cabal-install
}

# re-creates an existing cabal sandbox. this is time-intensive in line with
# *-nukes, but because it's something i might need to use frequently i'm 
# using the *-refresh name instead so that i don't frequently have to call
function cabal-sandbox-refresh {
   SOURCES=$(cabal sandbox list-sources | grep ^/)
   cabal sandbox delete
   cabal-sandbox-init $SOURCES
}
