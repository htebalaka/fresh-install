#!/bin/bash

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
   SOURCES=cabal sandbox list-sources | grep ^/
   cabal sandbox delete
   cabal-sandbox-init $SOURCES
}
