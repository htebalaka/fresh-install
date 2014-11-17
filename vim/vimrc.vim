source ~/gits/fresh-install/vim/keymap.vim
source ~/gits/fresh-install/vim/layout.vim
source ~/gits/fresh-install/vim/nerdtree.vim

autocmd FileType haskell source ~/gits/fresh-install/vim/haskell.vim
autocmd FileType python source ~/gits/fresh-install/vim/python.vim
autocmd FileType cpp source ~/gits/fresh-install/vim/cpp.vim

" show syntastic errors
map <Leader>e :Errors<CR>
" toggle syntastic errors
map <Leader>s :SyntasticToggleMode<CR>

" tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

