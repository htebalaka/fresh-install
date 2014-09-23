#!/bin/bash

# creates a new cabal sandbox
function cabal-init {
   cabal sandbox init
   for arg in $@
   do cabal sandbox add-source $arg
   done
   cabal install --only-dependencies --enable-test && cabal configure && cabal build && cabal install && cabal clean
}

# re-creates an existing cabal sandbox. this should be a time-intensive
# process in line with other *-nukes. it recompiles each file in the sandbox.
# since cabal sandboxes have directional dependencies maybe a make version
# of this would make sense
function cabal-nuke {
   SOURCES=cabal sandbox list-sources | grep ^/
   cabal sandbox delete
   cabal-init $SOURCES
}
