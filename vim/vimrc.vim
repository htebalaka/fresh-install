
" source custom files
source ~/gits/fresh-install/vim/unmappings.vim
source ~/gits/fresh-install/vim/keymap.vim
source ~/gits/fresh-install/vim/nerdtree.vim

autocmd FileType haskell source ~/gits/fresh-install/vim/haskell.vim
autocmd FileType python source ~/gits/fresh-install/vim/python.vim
autocmd FileType cpp source ~/gits/fresh-install/vim/cpp.vim

" show syntastic errors
map <Leader>e :Errors<CR>
" toggle syntastic errors
map <Leader>s :SyntasticToggleMode<CR>

" tagbar
let g:tagbar_autofocus = 1

" highlights the current line
set cursorline
" show matching parens
set showmatch


" nnoremap <Leader>z :HoogleClose<CR>:NERDTreeClose<CR>:TagbarClose<CR>
