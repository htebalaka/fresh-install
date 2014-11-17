let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" sets the number of spaces vim display for a <TAB> character when it
" encounters one while reading a file
set tabstop=4

" sets the number of spaces vim displays when a <TAB> character is entered by
" the user, or removed when backspace is entered
set softtabstop=4

" tabs are replaced with spaces in the file itself, rather than actual '\t'
" characters being inserted
set expandtab
