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
" another option for this is (easymotion-bd-wl) or (eaysmotion-bd-Wl). i'd like  -#@!
" something between /word/ and /WORD/, that works for both /e/ and /w/. the regex can
" be customized with /let g:EasyMotion_re_line_anywhere/.
map S <Plug>(easymotion-lineanywhere)
let g:EasyMotion_re_line_anywhere = '\v' .
    \       '(<.|^$)' . '|' .
    \       '(.>|^$)' . '|' .
    \       '(\l)\zs(\u)' . '|' .
    \       '(_\zs.)' . '|' .
    \       '(#\zs.)' . '|' .
    \       '(^\s*\zs\S)' . '|' . '(\S\ze\s*$)' . '|' . '(.\ze)$' " handles last non-ws, first non-ws, and eol

"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)

" lowcase characters will also match upcase, though the reverse isnt true
let g:EasyMotion_smartcase = 0

