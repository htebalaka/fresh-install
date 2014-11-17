
" mostly taken from http://www.stephendiehl.com/posts/vim_haskell.html

" need to find out how these two differ from syntastic
nnoremap <buffer> <F4> :GhcModLint<CR>
nnoremap <buffer> <F5> :GhcModCheck<CR>

nnoremap <Leader>t :GhcModType<CR>
nnoremap <Leader>T :GhcModTypeInsert<CR>
nnoremap <Leader>c :SyntasticCheck hlint<CR>
nnoremap <Leader>C :SyntasticCheck ghc_mod<CR>
nnoremap <Leader>h :Hoogle<CR>
nnoremap <Leader>H :Hoogle<Space>
nnoremap <Leader>i :HoogleInfo<CR>
nnoremap <Leader>I :HoogleInfo<Space>
