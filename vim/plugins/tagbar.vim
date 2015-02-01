
" opens the tagbar until you select a tag, then closes it
nnoremap <leader>o :TagbarToggle<cr>

" displays the line in which a tag is defined when selecting it in the command line
set updatetime=0

" sorts tags by file location (0) or by name (1)
let g:tagbar_sort = 0
