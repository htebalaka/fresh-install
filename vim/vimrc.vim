
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
source ~/gits/fresh-install/vim/keymap.vim
source ~/gits/fresh-install/vim/movements.vim
source ~/gits/fresh-install/vim/settings.vim

" source plugin specific settings
source ~/gits/fresh-install/vim/plugins/themes.vim
source ~/gits/fresh-install/vim/plugins/conque.vim
source ~/gits/fresh-install/vim/plugins/syntastic.vim
source ~/gits/fresh-install/vim/plugins/tagbar.vim
source ~/gits/fresh-install/vim/plugins/airline.vim
source ~/gits/fresh-install/vim/plugins/hardtime.vim
source ~/gits/fresh-install/vim/plugins/unite.vim

" source language specific settings
autocmd FileType haskell source ~/gits/fresh-install/vim/lang/haskell.vim
autocmd FileType python source ~/gits/fresh-install/vim/lang/python.vim
autocmd FileType cpp source ~/gits/fresh-install/vim/lang/cpp.vim
autocmd FileType vim,haskell,python,cpp call s:vim_my_syntax()
function! s:vim_my_syntax()
    highlight OverLength ctermbg=none ctermfg=white guibg=none
    "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
endfunction

set expandtab tabstop=4 shiftwidth=4 softtabstop=4
hi MatchParen cterm=none ctermbg=none ctermfg=blue
" hi MatchParen cterm=none ctermbg=green ctermfg=blue

