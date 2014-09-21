" this must be first, most of this is taken from http://nvie.com/posts/how-i-boosted-my-vim/

" setup vundle
"$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
let mapleader = ","
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" --- User plugins

Plugin 'klen/python-mode'

"Plugin 'eagletmt/ghcmod-vim'             " requires the below
"Plugin 'Shougo/vimproc'

"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'eagletmt/neco-ghc'
Plugin 'dag/vim2hs'
Plugin 'scrooloose/syntastic'
"Plugin 'vim-testobj-indent' -- needs git info

" --- :PluginInstall
call vundle#end()
filetype plugin indent on



" Quickly edit/reload the vimrc file
"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>


"" CHANGE VIM BEHAVIOUR
set hidden

"set history=1000         " remember more commands and search history
"set undolevels=1000      " use many muchos levels of undo
"set wildignore=*.swp,*.bak,*.pyc,*.class
"set title                " change the terminal's title
"set visualbell           " don't beep
"set noerrorbells         " don't beep

"set nowrap        " don't wrap lines
"set tabstop=4     " a tab is four spaces
"set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
"set autoindent    " always set autoindenting on
"set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
"set shiftwidth=4  " number of spaces to use for autoindenting
"set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
"set showmatch     " set show matching parenthesis
"set ignorecase    " ignore case when searching
"set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
"set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
"set hlsearch      " highlight search terms
"set incsearch     " show search matches as you type

"set nobackup
"set noswapfile "apparently can cause some issues

filetype on
filetype plugin on
filetype indent on
syntax on
"colorscheme mustang

" mostly from code.tutsplus.com/articles/top-10-pitfuls-when-switching-to-vim
" blah blah   
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab
set showcmd
set number
set smartindent
set autoindent
set laststatus=2
set linespace=3
set wrap
set textwidth=79
set formatoptions=qrn1
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"nnoremap ; :



"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set pastetoggle=<F2>
" -- commands to install pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" -- commands to install sensible
" cd ~/.vim/bundle && git clone git://github.com/tpope/vim-sensible.git
"
" cd ~/.vim
" mkdir -p bundle && cd bundle
" git clone git://github.com/klen/python-mode.git
