#!/bin/bash

function now {
   date +%s
}

export EGGTIMER_START=${EGGTIMER_START:-$(now)}
function eggtimer {
   export EGGTIMER_START=$(now)
}

function eggtimer-gettime {
   echo -e "$(expr $(expr $(date +%s) - $EGGTIMER_START) / 60)m"
}
