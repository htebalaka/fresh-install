
function man
    vim -c "SuperMan $argv"
    if [ "$status" != "0" ]
        echo "No manual entry for $argv"
    end
end

set -gx PATH $PATH $HOME/gits/haskell-sandbox/.cabal-sandbox/bin/
set -gx PATH $PATH $HOME/gits/microbreak/.cabal-sandbox/bin/
set -gx PATH /usr/local/Cellar/vim/7.4.430_1/bin $PATH

alias ls='ls -AG'


