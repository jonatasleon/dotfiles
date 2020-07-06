"""""""""""""""""""""""""""""""""""""""""""""""""
" Jonatas' Vimrc Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " be iMproved, required
set nowrap
set encoding=utf8

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/general.vim
source ~/.config/nvim/functions.vim

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType liquid       call pencil#init()
augroup END

augroup recpos
   autocmd!
   autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Hook goyo functions
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Call every time we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
autocmd FileType liquid call pencil#init()

" Set cursorline
autocmd InsertLeave,WinEnter *
  \ set cursorline
autocmd InsertEnter,WinLeave *
  \ set nocursorline

" Set Proper Tabs for a full-stack development
autocmd BufNewFile,BufRead *.html,*.css,*.js
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
let g:python_host_prog = expand("~") . '/.pyenv/versions/py2/bin/python'
let g:python3_host_prog = expand("~") . '/.pyenv/versions/py3/bin/python'

" Startify config
let g:startify_change_to_dir = 0

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

" CTags-Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

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

" Disable Esp key in insert mode
inoremap <Esc> <Nop>

" Map space to Leader
map <Space> <Leader>

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
nnoremap <silent> <expr> <Leader>n  RunOutNERDTree(':bnext<CR>')
nnoremap <silent> <expr> <Leader>p  RunOutNERDTree(':bprev<CR>')
nnoremap <silent> <expr> <Leader>1  RunOutNERDTree(':bfirst<CR>')
nnoremap <silent> <expr> <Leader>9  RunOutNERDTree(':blast<CR>')
nnoremap <silent> <expr> <Leader>bm RunOutNERDTree(':bm<CR>')
nnoremap <silent> <expr> <Leader>ba RunOutNERDTree(':ba<CR>')
nnoremap <silent> <Leader>bv :vs<CR><C-w><C-w>:b#<CR>
nnoremap <silent> <Leader>bs :sp<CR><C-w><C-w>:b#<CR>

" Save document
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :w !sudo tee %<CR>

" Close window
nnoremap <silent> <expr> <Leader>q IsLastBuffer() ? ':q<CR>' : ':bd<CR>'
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Quickly open .vimrc in new buffer
nnoremap <expr> <Leader>vv RunOutNERDTree(':edit ~/.dotfiles/config/nvim/init.vim<CR>')
nnoremap <expr> <Leader>vp RunOutNERDTree(':edit ~/.dotfiles/config/nvim/plugins.vim<CR>')

" Enable folding with the Leader + Spacebar
nnoremap <Leader><Space> za

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><cr> :noh<CR>

nnoremap <silent> <C-a><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-a><C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <Leader>w <C-w><C-w>

" Set Carbon map
xnoremap <Leader>p :CarbonNowSh<CR>

" Set Ag map
noremap <Leader>a :Ag! <cword><cr>

" change current work (like ciw) but repeatable with dot . for same next word.
nnoremap <Leader>ac :let @/=expand('<cword>')<CR>cgn

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Zen Mode
nnoremap <Leader>z :Goyo<CR>

" CTags Maps
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

" Marks
nnoremap <Leader>m ma
nnoremap <Leader>' 'azz

" Align Markdown Tables
au FileType markdown vmap <Leader>l <Plug>(EasyAlign)

" Commands Assignment ==============================
" Open file in chrome
command! -nargs=1 Chrome execute "silent !google-chrome <args>" | redraw!

source ~/.config/nvim/airline.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/nerdtree.vim
