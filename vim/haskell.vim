
" mostly taken from http://www.stephendiehl.com/posts/vim_haskell.html

nnoremap <Leader>t :GhcModType<CR>
nnoremap <Leader>T :GhcModTypeInsert<CR>

nnoremap <Leader>h :Hoogle<CR>
nnoremap <Leader>H :Hoogle<Space>

" there are a few different choices here: GhcModInfo, GhcModInfoPreview, and
" Hoogle, and I'm not sure which I should prefer. Preview has syntax 
" highlighting, I think because it opens a new file, while Hoogle shows more
" documentation instead of source code. I might do something like have ,i
" be only the start of the map, and then have ,ig for GhcMod, ,ip for
" GhcModPreview, and ,ih for Hoogle. That they open different styles of
" windows is kind of inconvenient
nnoremap <Leader>i :HoogleInfo<CR>
nnoremap <Leader>I :HoogleInfo<Space>
nnoremap <leader>z :HoogleClose<CR>:nohlsearch<CR>
