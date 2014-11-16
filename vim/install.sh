#!/bin/sh

curl -o - https://raw.githubusercontent.com/begriffs/haskell-vim-now/master/install.sh | bash
cp ~/gits/fresh-install/vim/.vimrc.local ~/.vimrc.local
sed -i.bak -e "/Bundle 'enomsg\/vim-haskellConcealPlus'/d" ~/.vimrc
