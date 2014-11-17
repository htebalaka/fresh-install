
" this file is for non-plugin based remappings

"remap jk/kj to escape
inoremap jk <Esc>
inoremap kj <Esc>

" remap movement keys to use jkli. the g-<Direction> causes up and down to
" work over visual lines rather than actual lines, which works better with
" line-wrapping. because i is mapped to insert by default we remap h to i
noremap i g<Up>
noremap j <Left>
noremap k g<Down>
noremap h i
noremap H I

"remap window movement keys to match up with above, using <C-direction> to
"change between windows
noremap <C-j> <C-w><Left>
noremap <C-k> <C-w><Down>
noremap <C-l> <C-w><Right>
noremap <C-i> <C-w><Up>

" retroactive sudo-save
cmap w!!<CR> w !sudo tee % >/dev/null

" set space to insert a single character under the cursor, works by entering

nnoremap <space> i<space><esc>r

" closes the current buffer. works by restoring the previously opened buffer,
" then closing the previously opened buffer, so that any splits are preserved
nnoremap :d<CR> :b#<CR>:bd #<CR>

" saves and closes the current buffer, using the same method as above
nnoremap :wd<CR> :w<CR>:b#<CR>:bd #<CR>

" closes the buffer without saving
nnoremap :d!<CR> :b#<CR>:bd! #<CR>

" lists all open buffers, and prompts for which buffer to switch to
noremap <Leader>b :buffers<CR>:buffer<Space>

" switches to the previous buffer
nnoremap <Leader>B :b#<CR>

" toggle tagbar browser, mnemonic is 'object browser'
nnoremap <Leader>o :TagbarToggle<CR>

nnoremap <leader>z :nohlsearch<CR>
