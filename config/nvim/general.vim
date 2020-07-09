"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

syntax on

" Set onedark (https://github.com/joshdick/onedark.vim) as color scheme
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

" Modify how vim shows BadWhitespace
highlight BadWhitespace ctermbg=red guibg=darkred

" Options setting ===============================
" Show command progress
set showcmd

" Auto read files change
set autoread

" Show line number
set number
" Set relative number by default
set relativenumber

" Set wrap text
set wrap linebreak nolist

" Set conceal level
set conceallevel=1

" System clipboard
set clipboard+=unnamedplus

" Keep cursor centered
set scrolloff=10

" Show linenumbers
set ruler

" Enable Highlight Search
set hlsearch

" Highlight while search
set incsearch

" Case Insensitivity Pattern Matching
set ignorecase

" Overrides ignorecase if pattern contains upcase
set smartcase

" status line
set laststatus=2

" Enable folding
set foldmethod=syntax
set foldlevel=99

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files.
set nobackup
set nowritebackup

set cmdheight=1

" Define spell languages
set spelllang=pt_br,en_us

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Show invisible characters
set list
set listchars=tab:>·,trail:~,extends:>,precedes:<

" Set Proper Tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Wild options
set wildignore+=*/node_modules/*
set wildmode=longest:full,full
set wildmenu

" Update time
set updatetime=300

" Set timeout
set timeout
set timeoutlen=500

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType liquid       call pencil#init()
augroup END

augroup recpos
   autocmd!
   autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Call every time we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
autocmd FileType liquid call pencil#init()

" Set cursorline
autocmd InsertLeave,WinEnter *
  \ set cursorline
autocmd InsertEnter,WinLeave *
  \ set nocursorline

" Set Proper Tabs for a full-stack development
autocmd BufNewFile,BufRead *.html
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4

autocmd BufNewFile,BufRead *.css,*.js
  \ set tabstop=2     |
  \ set softtabstop=2 |
  \ set shiftwidth=2

" Flag unnecessary whitespace
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h
  \ match BadWhitespace /\s\+$/ |
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4

" Disabe automatic comment insertion
autocmd FileType *
  \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript

" Variable assignment ===============================
let g:python_host_prog = expand("~/.pyenv/versions/py2/bin/python")
let g:python3_host_prog = expand("~/.pyenv/versions/py3/bin/python")
let g:node_host_prog = expand("~/.nvm/versions/node/v10.20.1/bin/node")

" Remap move split
let g:tmux_navigator_no_mappings = 1

" Vim pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Show doctring folded code
let g:SimpylFold_docstring_preview=1

" Polyglot setup
let g:polyglot_disabled = ['tmux', 'latex']

" Highlight python code
let python_highlight_all=1

" Indent Highlight
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1

" vCoolor
let g:vcoolor_disable_mappings = 1

" Lightlime
let g:limelight_conceal_ctermfg = '240'

" Mappings ===============================
" Map jk to ESC in insert mode
inoremap jk <esc>

" Disable Esc key in insert mode
inoremap <Esc> <C-c>

" Change move to displayed line
nnoremap j gj
nnoremap k gk
nnoremap G Gzz

" Select all content
nnoremap vA ggVG

" Set copy/paste keys
nnoremap <Leader>y "+yy
xnoremap <Leader>y "+y

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Buffers maps
nnoremap <silent> <Leader>n  :bnext<CR>
nnoremap <silent> <Leader>p  :bprev<CR>
nnoremap <silent> <Leader>bm :bm<CR>
nnoremap <silent> <Leader>ba :ba<CR>
nnoremap <silent> <Leader>bv :vs<CR><C-w><C-w>:b#<CR>
nnoremap <silent> <Leader>bs :sp<CR><C-w><C-w>:b#<CR>

" Save document
nnoremap <silent> <Leader>s :w<CR>
nnoremap <Leader>S :w !sudo tee %<CR>

" Close window
nnoremap <silent> <expr> <Leader>q IsLastBuffer() ? ':q<CR>' : ':bd<CR>'
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Quickly open .vimrc in new buffer
nnoremap <Leader>vv :edit ~/.dotfiles/config/nvim/init.vim<CR>
nnoremap <Leader>vp :edit ~/.dotfiles/config/nvim/plugins.vim<CR>

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><CR> :nohlsearch<CR>

" Set Carbon map
xnoremap <Leader>p :CarbonNowSh<CR>

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Zen Mode
nnoremap <Leader>z :Goyo<CR>

" Marks
nnoremap <Leader>m ma
nnoremap <Leader>' 'azz

" Align Markdown Tables
au FileType markdown vmap <Leader>l <Plug>(EasyAlign)
