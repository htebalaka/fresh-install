
function man
    vim -c "SuperMan $argv"
    if [ "$status" != "0" ]
        echo "No manual entry for $argv"
    end
end

set -gx PATH $PATH $HOME/gits/haskell-sandbox/.cabal-sandbox/bin/
set -gx PATH $PATH $HOME/gits/microbreak/.cabal-sandbox/bin/

alias ls='ls -AG'


