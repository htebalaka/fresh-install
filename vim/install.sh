#!/bin/sh

function installplugin {
    gsed -i -e "/Bundle 'gmarik\/vundle'/a Bundle '$1'" ~/.vimrc
    vim +BundleInstall +qall
}

function uninstallplugin {
    sed -i "/Bundle '$1'/d" ~/.vimrc
}

function install {
    brew install gnu-sed
    brew install --override-system-vi --with-lua --with-perl --with-python3 vim

    curl -o - https://raw.githubusercontent.com/begriffs/haskell-vim-now/master/install.sh | bash
    gsed -i -e "/Bundle 'gmarik\/vundle'/a source ~/gits/fresh-install/vim/plugins.vim" ~/.vimrc
    cp ~/gits/fresh-install/vim/.vimrc.local ~/.vimrc.local

    uninstallplugin enomsg/vim-HaskellConcealPlus
  }
