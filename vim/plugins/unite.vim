
" fuzzy search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async,grep,buffer,line',
    \ 'sorters','sorter_rank')
call unite#custom#source('file_rec/async,grep',
    \ 'ignore_pattern', '\v' . '.cabal-sandbox' . '|' . 'dist/' . '|' . '.stack-work'
    \ . '|' . '.antigen/' . '|' . '.cabal')

" this doesn't wor
" call unite#custom#source('file_rec/async,grep,buffer,line',
"    \ 'filters','matcher_fuzzy')

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

" i'm undecided if i prefer -no-split or -winheight=10
map <leader>b :Unite buffer
    \ -start-insert -no-split -buffer-name=buffers<cr>
map <leader>B :Unite bookmark
    \ -start-insert -no-split -buffer-name=recent<cr>
map <leader>y :Unite register
    \ -start-insert -no-split -buffer-name=yanks<cr>
map <leader>u :Unite file_mru file_rec/async:!
    \ -start-insert -no-split -buffer-name=files<cr>
map <leader>U :Unite file_rec/async:~/gits
    \ -start-insert -no-split -buffer-name=files<cr>
map <leader>/ :Unite line -auto-preview
    \ -start-insert -no-split -buffer-name=/<cr>
map <leader>a :Unite grep:! -auto-preview -truncate
    \ -start-insert -no-split -buffer-name=ag<cr>
map <leader>A :Unite grep:~/gits -auto-preview -truncate
    \ -start-insert -no-split -buffer-name=ag<cr>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    map <buffer> d <noop>
    map <buffer> <space> <leader>

    " tab opens in split
    imap <silent><buffer><expr> <tab> unite#do_action('vsplit')
endfunction

