
" only display errors from the highest priority syntax checker
let g:syntastic_aggregate_errors = 0

" automatically populate errors in the location list
let g:syntastic_always_populate_loc_list = 1

" automatically open and close the location list when errors are detected
let g:syntastic_auto_loc_list = 2

" ,s saves the file, runs the syntax checker, and display any found errors
nnoremap <leader>s :w<cr>:SyntasticCheck<cr>:Errors<cr>

" ,S closes the syntax checker
nnoremap <leader>S :SyntasticReset<CR>

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["c++", "cpp"],
    \ "passive_filetypes": ["haskell"] }
