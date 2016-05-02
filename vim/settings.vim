
" allow switching between buffers without saving
set hidden

" dont save swap files
set noswapfile

" show whitespace
set list

" disable errorbells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" highlights the current line
set cursorline
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" show line numbers
set nu

" show matching parens
set showmatch

" show commands entered on the bottom-right of the screen
set showcmd

" dont show all search highlights
set nohlsearch
set incsearch

" increase width so that left window has >80 chars width
" set winwidth=86

" change default matching parentheses color indicator
hi MatchParen cterm=none ctermbg=green ctermfg=blue
