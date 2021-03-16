"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" =====================================================================
" Set onedark (https://github.com/joshdick/onedark.vim) as color scheme

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

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
let g:python_host_prog = expand("~/.pyenv/versions/py2/bin/python")
let g:python3_host_prog = expand("~/.pyenv/versions/py3/bin/python")
let g:node_host_prog = expand("~/.nvm/versions/node/v10.20.1/bin/node")

" Remap move split
let g:tmux_navigator_no_mappings = 1

" rainbow enable
let g:rainbow_active = 1

" Show doctring folded code
let g:SimpylFold_docstring_preview=1

" Indent Highlight
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
let g:indentLine_enabled = 1

" vCoolor
let g:vcoolor_disable_mappings = 1

" Lightlime
let g:limelight_conceal_ctermfg = '240'

" Vue
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
nnoremap <silent> <expr> <Leader>q ':bd<CR>'
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Quickly open .vimrc in new buffer
nnoremap <Leader>vv :edit ~/.dotfiles/config/nvim/init.vim<CR>
nnoremap <Leader>vp :edit ~/.dotfiles/config/nvim/config/plugins.vim<CR>

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><CR> :nohlsearch<CR>

" Set Carbon map
xnoremap <Leader>p :CarbonNowSh<CR>

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Marks
nnoremap <Leader>' 'azz

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
