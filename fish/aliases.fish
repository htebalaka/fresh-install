
function man
    vim -c "SuperMan $argv"
    if [ "$status" != "0" ]
        echo "No manual entry for $argv"
    end
end

# this is necessary to ensure that we are running the right version of cabal.
# i'm not sure if i want to prefer a version of cabal that is itself sandboxed,
# or a truly globaly installed version. the lts-stackage version of cabal is
# older, and behaviour seems to vary significantly between versions. i'm opting
# for the newer for the time being
set -gx PATH $HOME/.cabal-sandbox/bin $PATH
set -gx PATH $HOME/Library/Haskell/bin $PATH

# this is necessary to ensure that after installing vim we are running the
# correct version. this might /not/ be necessary with the new vim install
# script
set -gx PATH /usr/local/Cellar/vim/7.4.430_1/bin $PATH

set -gx PATH $PATH $HOME/gits/haskell-sandbox/.cabal-sandbox/bin/
set -gx PATH $PATH $HOME/gits/microbreak/.cabal-sandbox/bin/

alias ls='ls -AG'


