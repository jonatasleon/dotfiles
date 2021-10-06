"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" ===============================================
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

" Wild options
set wildignore+=*/node_modules/*
set wildmode=longest:full,full
set wildmenu

" Update time
set updatetime=300

" Set timeout
set timeout
set timeoutlen=500

" Split
set splitbelow
set splitright

set mouse=a

" Variable assignment ===============================
let g:python_host_prog = trim(system("asdf which python2"))
let g:python3_host_prog = trim(system("asdf which python3"))
let g:node_host_prog = trim(system("asdf which node"))

" Show doctring folded code =============================
let g:SimpylFold_docstring_preview=1

" Indent Highlight ======================================
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1
let g:indentLine_fileTypeExclude = ['startify', 'defx']

" Lightlime =============================================
let g:limelight_conceal_ctermfg = '240'

" Vue ===================================================
let g:vue_pre_processors = []

" NERDCommenter =========================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:user_emmet_leader_key='<C-Y>'

" EditoConfig ============================================
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" AutoPairs ==============================================
let g:AutoPairsFlyMode = 0

" Highlight python code
let python_highlight_all=1

" Blamer =================================================
let g:blamer_delay = 500


" Mappings ===============================
" Map jk to ESC in insert mode
inoremap jk <esc>
inoremap kj <esc>

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
nnoremap <silent> <expr> <Leader>q (IsLastBuffer()) ? ":bd<CR>:Startify<CR>" : ":Bdelete<CR>"
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Quickly open .vimrc in new buffer
nnoremap <Leader>vv :edit ~/.dotfiles/config/nvim/init.vim<CR>
nnoremap <Leader>vp :edit ~/.dotfiles/config/nvim/config/plugins.vim<CR>

" Press <Leader> Enter to remove search highlights
nnoremap <silent> <Leader><CR> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" Set Carbon map
xnoremap <Leader>p :CarbonNowSh<CR>

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Marks
nnoremap <Leader>' 'azz

nnoremap <S-T> :ter<CR>

" Open file under cursor
nmap <Leader>o :call OpenFileInPrevWindow()<CR>

" https://stackoverflow.com/a/27820229
" o/O Start insert mode with [count] blank lines.
"     The default behavior repeats the insertion [count]
"     times, which is not so useful.
function! s:NewLineInsertExpr( isUndoCount, command )
    if ! v:count
        return a:command
    endif

    let l:reverse = { 'o': 'O', 'O' : 'o' }
    " First insert a temporary '$' marker at the next line (which is necessary
    " to keep the indent from the current line), then insert <count> empty lines
    " in between. Finally, go back to the previously inserted temporary '$' and
    " enter insert mode by substituting this character.
    " Note: <C-\><C-n> prevents a move back into insert mode when triggered via
    " |i_CTRL-O|.
    return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
    \   a:command . "$\<Esc>m`" .
    \   v:count . l:reverse[a:command] . "\<Esc>" .
    \   'g``"_s'
endfunction
nnoremap <silent> <expr> o <SID>NewLineInsertExpr(1, 'o')
nnoremap <silent> <expr> O <SID>NewLineInsertExpr(1, 'O')

" Quickly add empty lines
" https://github.com/mhinz/vim-galore#quickly-add-empty-lines
nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Don't lose selection when shifting sidewards
" https://github.com/mhinz/vim-galore#dont-lose-selection-when-shifting-sidewards
xnoremap < <gv
xnoremap > >gv

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
