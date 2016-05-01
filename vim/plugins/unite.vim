
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

" keymaps
"   /  current file
"   {b|B} {current buffers|recent buffers} via filename
"   {u|U} {current project|all gits} via filename
"   {a|A} {current project|all gits} via grep
map <leader>/ :Unite -start-insert -winheight=10 -buffer-name=/ line<cr>
map <leader>b :Unite -start-insert -no-split -buffer-name=buffers buffer<cr>
map <leader>B :Unite -start-insert -winheight=10 -buffer-name=recent bookmark<cr>
map <leader>r :Unite -start-insert -no-split -buffername=mru file_mru<cr>
map <leader>a :execute ':Unite -buffer-name=ag -no-split
    \ -auto-preview -truncate -winheight=30
    \ grep:'.unite#util#path2project_directory(getcwd())<cr>
map <leader>A :execute ':Unite -buffer-name=ag -no-split
    \ -auto-preview -truncate -winheight=30
    \ grep:~/gits'<cr>
map <leader>u :execute ':Unite -buffer-name=files -start-insert
    \ -winheight=10
    \ file_rec/async:'.unite#util#path2project_directory(getcwd())<cr>
map <leader>U :execute ':Unite -buffer-name=files -start-insert
    \ -winheight=10
    \ file_rec/async:~/gits'<cr>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    map <buffer> d <noop>
    map <buffer> <space> <leader>

    " tab opens in split
    imap <silent><buffer><expr> <tab> unite#do_action('vsplit')
endfunction

