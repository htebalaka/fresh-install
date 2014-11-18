
" this file is for leader/command based remappings

" retroactive sudo-save
cmap w!!<CR> w !sudo tee % >/dev/null

" set space to insert a single character under the cursor, works by entering
nnoremap <space> i<space><esc>r

" closes the current buffer, without closing the window pane
nnoremap :d<CR> :Bd<CR>
nnoremap :wd<CR> :w<CR>:Bd<CR>
nnoremap :d!<CR> :Bd!<CR>

" lists all open buffers, and prompts for which buffer to switch to
noremap <Leader>b :buffers<CR>:buffer<Space>

" switches to the previous buffer
nnoremap <Leader>B :b#<CR>

" toggle tagbar browser, mnemonic is 'object browser'
nnoremap <Leader>o :TagbarToggle<CR>

nnoremap <leader>z :nohlsearch<CR>

" makes Y behave more like C/D and not like yy
nnoremap Y y$
