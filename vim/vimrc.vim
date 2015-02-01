
if !1 | finish | endif
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
source ~/gits/fresh-install/vim/plugins.vim
call neobundle#end()
" Required:
filetype plugin indent on
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" source custom files
source ~/gits/fresh-install/vim/themes.vim
source ~/gits/fresh-install/vim/keymap.vim
source ~/gits/fresh-install/vim/movements.vim
source ~/gits/fresh-install/vim/settings.vim

" source plugin specific settings
source ~/gits/fresh-install/vim/conque.vim
source ~/gits/fresh-install/vim/syntastic.vim
source ~/gits/fresh-install/vim/tagbar.vim
source ~/gits/fresh-install/vim/airline.vim
source ~/gits/fresh-install/vim/hardtime.vim

" source language specific settings
autocmd FileType haskell source ~/gits/fresh-install/vim/haskell.vim
autocmd FileType python source ~/gits/fresh-install/vim/python.vim
autocmd FileType cpp source ~/gits/fresh-install/vim/cpp.vim

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

