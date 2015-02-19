
" this file is for leader/command based remappings
let mapleader = "\<space>"

" toggle a fold, or close all folds
nnoremap <Leader>f za
nnoremap <Leader>F zM

map <Leader>r :source ~/.vimrc<cr><Plug>(unite_restart)

" retroactive sudo-save
cmap w!!<cr> w !sudo tee % >/dev/null

" set space to insert a single character under the cursor, works by entering
" nnoremap <space> i<space><esc>r

" closes the current buffer, without closing the window pane
nnoremap <leader>q :bd<cr>
nnoremap <leader>wq :w<cr>:bd<cr>
nnoremap <leader>Q :bd!<cr>

" switches to the previous buffer. {B}ackwards is remapped to gW, using g more
" consistently tindicate WORD
nnoremap <Leader>B :b#<cr>

" toggle tagbar browser, mnemonic is 'object browser'
nnoremap <Leader>o :TagbarToggle<cr>

" makes Y behave more like C/D and not like yy
nnoremap Y y$
