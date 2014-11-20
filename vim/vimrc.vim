
" source custom files
source ~/gits/fresh-install/vim/unmappings.vim
source ~/gits/fresh-install/vim/keymap.vim
source ~/gits/fresh-install/vim/settings.vim
source ~/gits/fresh-install/vim/movements.vim

" source plugin specific settings
source ~/gits/fresh-install/vim/syntastic.vim
source ~/gits/fresh-install/vim/tagbar.vim
source ~/gits/fresh-install/vim/airline.vim
source ~/gits/fresh-install/vim/hardtime.vim

" source language specific settings
autocmd FileType haskell source ~/gits/fresh-install/vim/haskell.vim
autocmd FileType python source ~/gits/fresh-install/vim/python.vim
autocmd FileType cpp source ~/gits/fresh-install/vim/cpp.vim

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

