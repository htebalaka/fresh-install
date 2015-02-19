
" searches the current file
map <leader>/ :Unite -start-insert -winheight=10 -buffer-name=/ line<cr>

" searches the buffer list, -quick-match is another alternative to
" start-insert
map <leader>b :Unite -start-insert -winheight=10 -buffer-name=buffers buffer<cr>

" command P :Unite -

" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async,buffer','sorters','sorter_rank')
call unite#custom#source('file_rec/async,grep','ignore_pattern',
    \ '\v' . '.cabal-sandbox' . '|' . 'dist/')
"call unite#custom#source('file_rec/async','ignore_pattern', 'dist/')
nnoremap <leader>u :execute ':Unite -buffer-name=files -start-insert
    \ -winheight=10
    \ file_rec/async:'.unite#util#path2project_directory(getcwd())<cr>

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>U :execute ':Unite -buffer-name=ag -no-split
    \ -auto-preview -truncate -winheight=30
    \ grep:'.unite#util#path2project_directory(getcwd())<cr>

" unite remaps space, so change it back to colon for the buffer
"autocmd FileType unite,vimfiler call s:unite_my_settings()
"function s:unite_my_settings()
    "unmap! <buffer> <space>
    "noremap <buffer> <space> :
"endfunction
