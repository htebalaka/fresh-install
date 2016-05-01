
NeoBundle 'tpope/vim-sensible'

" i only really use easymotion for the s2 key
NeoBundle 'Lokaltog/vim-easymotion'

" fanfingtastic makes f/F/t/T continue past newlines, as well as provides
" a fanfingtastic_; and fanfingtastic_, to replace the default ;, ,
" which i've mapped to nN. fanfingtastic doesnt work with spiiph/vim-space
" unfortunately, which would provide a more versatile nN
NeoBundle 'dahu/vim-fanfingtastic'

" color-scheme
NeoBundle 'altercation/vim-colors-solarized'


" syntastic
NeoBundle 'Syntastic'

NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
" smart searching, with extensions for most-recent-fil
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" NeoBundle 'eagletmt/ghcmod-vim'
" NeoBundle 'eagletmt/neco-ghc'
" NeoBundle 'dag/vim2hs'

" NeoBundle 'vim-haskellFold'

" vim-repeat makes the . operator work with more plugins, and is a
" dependency of some other plugins i'm using (i think just easymotion)
NeoBundle 'tpope/vim-repeat'

" displays marks visually in buffers
NeoBundle 'kshenoy/vim-signature'

" man page viewer
NeoBundle 'Z1MM32M4N/vim-superman'

" intelligently switch between relative and absolute line numbers when in
" insert mode or other modes
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'

" fish syntax
NeoBundle 'dag/vim-fish'

NeoBundle 'bling/vim-airline'

" vim-tmux-navigator
NeoBundle 'christoomey/vim-tmux-navigator'

" highlights words that are the same as the one under the cursor
NeoBundle 'vasconcelloslf/vim-interestingwords'
nnoremap <Leader>h :call InterestingWords('n')<cr>
vnoremap <leader>h :call InterestingWords('v')<cr>
noremap <Leader>H :call UncolorAllWords()<cr>

" gundo requires python2.4 :(
"NeoBundle 'sjl/gundo.vim'

"NeoBundle 'Shougo/neocomplete.vim'

