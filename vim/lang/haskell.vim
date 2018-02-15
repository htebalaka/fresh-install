
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
nnoremap <leader><space> :HoogleClose<CR>:nohlsearch<CR>

highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
highlight Folded      gui=italic  guifg=Black      guibg=Grey90 cterm=None
highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90

set foldcolumn=1
set foldmethod=expr
set foldexpr=GetPositionFold(v:lnum)
set foldtext=CustomFoldText()
set foldminlines=2



function! CustomFoldText()
    let cursor = v:foldstart
    let line = getline(cursor)

    " if the line opens a haddock comment find the declaration
    if line =~ '^ *-- |'
        let isComment = 0
        " find the first non-comment line
        while line =~ '\v^\s*\-\-'
            let cursor += 1
            let line = getline(cursor)
            let isComment = 1
        endwhile
    elseif line =~ '^ *-- =\+'
        " the fold opens a header, so just use the line
        return line . repeat(' ', 100)
    endif

    if (line =~ '\v^data') || (line =~ '\v^newtype') || (line =~ '^class') || (line =~ '^instance')
        " the line opens a non-value level declaration
        if (line =~ '^data') || (line =~ '^newtype')
            let line = substitute(line, ' =.*$', '', '')
        endif
        let line = substitute(line, ' where.*$', '', '')
        return line . repeat(' ', 100)
    else
        " the line is a type, get the full type signature
        " ^ should be tested, and otherwise use the top line
        let currIndent = IndentLevel(cursor)
        " any indented lines following the beginning of a type signature
        " are assumed to be a part of it, so we append them
        while IndentLevel(cursor+1) == (currIndent + 1)
            let cursor += 1
            let line = line . substitute(getline(cursor), '^\s*', ' ', '')
        endwhile
        return line . repeat(' ', 100)
    endif

    let width = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldPercent = 100*(foldSize*1.0)/line('$')
    let foldPercentStr = printf("[%.1f", foldPercent) . "%]"
    let expansionStr = repeat(' ', 80 - strwidth(line . foldPercentStr))
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum)/ &shiftwidth
endfunction

function! IsHaddockPreamble(lnum)
    let hComment = '\v^\s*\-\-\s\|'
    let comment = '\v^\s*\-\-'

    let contents = getline(a:lnum)

    if (contents =~ comment)
        if (contents =~ hComment)
            return 1
        else
            return IsHaddockPreamble(a:lnum - 1)
        endif
    else
        return 0
    endif
endfunction

function! IsTypeSignature(lnum)
    let contents = getline(a:lnum)
    if contents =~ '\v^\s*\S+\s::'
        return 1
    elseif (contents =~ '\v^\s*\S+$') && (getline(a:lnum+1) =~ '\v^\s*::')
        return 1
    else
        return 0
    endif
endfunction

" a line introducting a type signature (or followed by a where) is >t
" a line introducing a toplevel binding is >1
" an indented line after a data/newtype/class/instance is >t
" a line with a haddock header is >t
function! GetPositionFold(lnum)
    let prevContents = getline(a:lnum-1)
    let lineContents = getline(a:lnum)

    let openHaddock = '\v^\s*--\s\|'
    let openMultiHaddock = '\v\s*\{\-\s\|'
    let header = '\v^\s*--\s=+'
    let openComment = '\v^s*\-\-'
    let closeMultiComment = '\v\s*\-\}'
    let data = '\v^data '
    let newtype = '\v^newtype\s*'
    let typedec = '\v^\s*\S+\s::'
    let blank = '\v^\s*$'

    if (lineContents =~ openHaddock) || (lineContents =~ openMultiHaddock)
        return ('>' . (IndentLevel(a:lnum) + 1))
    elseif (lineContents =~ '^ *-- =\+')
        let headerLevel = strlen(matchlist(lineContents, '^ *-- \(=\+\)')[1])
        let foldLevel = headerLevel + IndentLevel(a:lnum) + 1
        return ('>' . foldLevel)
    elseif IsHaddockPreamble(a:lnum-1)
        return '='
    elseif IsTypeSignature(a:lnum)
        " (lineContents =~ typedec)
        return ('>' . (IndentLevel(a:lnum) + 1))
    elseif (lineContents =~ data) || (lineContents =~ newtype) ||
            \ (lineContents =~ '^class ') ||
            \ (lineContents =~ '^instance ')
        if IndentLevel(a:lnum+1)
            return ('>' . (IndentLevel(a:lnum) + 1))
        else
            return '0'
        endif
    elseif (lineContents =~ blank)
        return '0'
    else
        return '='
    endif
endfunction

