
" remap jk/kj to escape
imap jk <Esc>
imap kj <Esc> 

" remap movement keys
map i <Up>
map j <Left>
map k <Down>

"remap window movement keys to match up with above
map <C-j> <C-w>h
map <C-k> <C-w>j
map <C-l> <C-w>l
map <C-i> <C-w>k

" remap and `i` and `h` to compensate
noremap h i
noremap H I

" retroactive sudo-save
cmap w!! w !sudo tee % >/dev/null " allow w!! to sudo save

nmap <space> h_<esc>r
