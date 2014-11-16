
" remap jk/kj to escape
inoremap jk <Esc>
inoremap kj <Esc> 

" remap movement keys
noremap i <Up>
noremap j <Left>
noremap k <Down>
" remap and `i` and `h` to compensate
noremap h i
noremap H I

"remap window movement keys to match up with above
noremap <C-j> <C-w><Left>
noremap <C-k> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-i> <C-w><Up>

"remap ,s<direction> to open in a direction
" left, from h
nnoremap <leader>sj :leftabove vnew<CR>
" right, from l
nnoremap <leader>sl :rightbelow vnew<CR>
" up, from k
nnoremap <leader>si :leftabove new<CR>
" down, from j
nnoremap <leader>sk :rightbelow new<CR>

" retroactive sudo-save
cmap w!! w !sudo tee % >/dev/null " allow w!! to sudo save

" set space to insert a single character under the cursor
nnoremap <space> i_<esc>r
