
function install-cabal
    cd ~

    # first install the newer version of cabal, and copy the config over. the
    # config has 1.22 specific flags
    cabal update
    cabal install cabal-install
    cp ~/gits/fresh-install/cabal/config ~/.cabal/config

    # setup global sandbox. the version of cabal we installed will NOT be part
    # of the sandbox, but any subsequent installs we make with cabal will have
    # to be part of a sandbox
    cabal sandbox init
    curl http://www.stackage.org/lts/cabal.config > ~/cabal.config
    echo "Uncomment out the line in ~/.cabal.config so that we only read from stackage"
end

function install-vim
    brew install gnu-sed
    brew install --override-system-vi --with-lua --with-perl --with-python3 vim

    # install neobundle so we can install plugins
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
end

install-cabal
