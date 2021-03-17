" Set Proper Tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" Disabe automatic comment insertion
autocmd FileType *
  \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set cursorline
autocmd InsertLeave,WinEnter *
  \ set cursorline
autocmd InsertEnter,WinLeave *
  \ set nocursorline

augroup recpos
   autocmd!
   autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Set Proper Tabs for a full-stack development
autocmd BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd BufNewFile, BufRead *.js, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

autocmd BufNewFile,BufRead *.html
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4

" Flag unnecessary whitespace
autocmd BufRead,BufNewFile *.c,*.h
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
autocmd BufRead,BufNewFile *.ejs set filetype=html
autocmd BufRead,BufNewFile *.js set filetype=javascript

highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Call every time we open a Markdown file
function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/

    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}" syn match liquid '{%.*%}'
    " Liquid multi line. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'

    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

augroup pencil
    autocmd!
    " Align Markdown Tables
    autocmd FileType markdown vmap <Leader>l <Plug>(EasyAlign)

    autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
    autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown PencilSoft

    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType liquid       call pencil#init()
augroup END

" Vim pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
