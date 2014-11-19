" use tab for searching instead of n
noremap <Tab> n
noremap <S-Tab> N

" these make n/N work for paging through f/t motions instead of the search motions
nmap n <Plug>fanfingtastic_;
xmap n <Plug>fanfingtastic_;
omap n <Plug>fanfingtastic_;
nmap N <Plug>fanfingtastic_,
xmap N <Plug>fanfingtastic_,
omap N <Plug>fanfingtastic_,

" remap the capital movement keys to indicate first non-whitespace character
" in line, last character in line, top of file, and bottom file
noremap H ^
noremap J G
noremap K gg
noremap L $

"remap jk/kj to escape
inoremap jk <Esc>
inoremap kj <Esc>

" remap movement keys so that up-down work over visual lines rather than
" actual lines
noremap j gj
noremap k gk

"remap window movement keys to match up with above, using <C-direction> to
"change between windows
noremap <C-h> <C-w><Left>
noremap <C-j> <C-w><Down>
noremap <C-k> <C-w><Up>
noremap <C-l> <C-w><Right>

" Word re-mappings, to provide symmetry with the f/t motions I use
" capitals to indicate backwards, and g to indicate WORD. this frees
" the b character for other uses
noremap w w
noremap W b
noremap gw W
noremap gW B
noremap e e
noremap E ge
noremap ge E
noremap gE ge

" the default behaviour of s can be accomplished with cl, likewise S and cc
map s <Plug>(easymotion-s2)
map S <Plug>(easymotion-lineanywhere)
" use the default line_anywhere, except also match the first and last character
" of words consisting of only non-alphanumeric characters surrounded by whitespace
let g:EasyMotion_re_line_anywhere = '\v' .
        \       '(<.|^$)' . '|' .
        \       '(.>|^$)' . '|' .
        \       '(_\zs.)' . '|' .
        \       '(#\zs.)' . '|' .
        \       '(^\zs.)' . '|' . '(.\ze$)' . '|' .
        \       '(\s*|^)\zs\W+\ze(\s*|$)'
"test <$> helloMyName **
" these are similar to the default mappings, but provide different highlight
" methods and some other functionality
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)

" lowcase characters will also match upcase, though the reverse isnt true
let g:EasyMotion_smartcase = 0

