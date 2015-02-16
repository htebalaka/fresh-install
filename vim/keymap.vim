
" this file is for leader/command based remappings
map <Leader> \

map <Leader>r :source ~/.vimrc<cr>

" retroactive sudo-save
cmap w!!<CR> w !sudo tee % >/dev/null

" set space to insert a single character under the cursor, works by entering
nnoremap <space> i<space><esc>r

" closes the current buffer, without closing the window pane
nnoremap :d<CR> :Bd<CR>
nnoremap :wd<CR> :w<CR>:Bd<CR>
nnoremap :d!<CR> :Bd!<CR>

" prompts for a buffer name. {b}ackwards is remapped to W to be more consistent
" with other operators
nnoremap b :buffer<space>

" switches to the previous buffer. {B}ackwards is remapped to gW, using g more
" consistently tindicate WORD
nnoremap <Leader>B :b#<CR>

" toggle tagbar browser, mnemonic is 'object browser'
nnoremap <Leader>o :TagbarToggle<CR>

"nnoremap <leader><space> :nohlsearch<CR>
let g:ctrlp_map = '<C-p>'

" makes Y behave more like C/D and not like yy
nnoremap Y y$
