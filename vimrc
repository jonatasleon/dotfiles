"""""""""""""""""""""""""""""""""""""""""""""""""
" Jonatas' Vimrc Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " be iMproved, required
set nowrap
set encoding=utf8

""" START Vundle Configuration

" Disable file type for vundle
filetype off    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utilities
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'etdev/vim-hexcolor'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'chrisbra/csv.vim'

" Text Editing
Plugin 'andrewradev/splitjoin.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'valloric/matchtagalways'
Plugin 'tommcdo/vim-exchange'

" File/Window/Pane navigation
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ZoomWin'

" Git support
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Colorscheme " https://github.com/joshdick/onedark.vim
Plugin 'joshdick/onedark.vim'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Linting
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'

" Python support
Plugin 'Valloric/YouCompleteMe'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'vim-python/python-syntax'
Plugin 'vim-scripts/indentpython.vim'

" Plugin Support
Plugin 'pangloss/vim-javascript'

" *TeX/Markdown support
Plugin 'reedes/vim-pencil'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'

" HTML Support
Plugin 'alvan/vim-closetag'
Plugin 'mattn/emmet-vim'

" i3wm
Plugin 'PotatoesMaster/i3-vim-syntax'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

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

" Set pastetoggle key
set pastetoggle=<Leader>i

" System clipboard
set clipboard+=unnamedplus

" Bracked paste workaround: https://vimhelp.org/term.txt.html#xterm-bracketed-paste
set t_BE=

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

set hidden

" Show invisible characters
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Wildignore
set wildignore+=*/node_modules/*

" Update time
set updatetime=250

" Arrow-keys support
set <Left>=OD
set <Right>=OC
set <Up>=OA
set <Down>=OB

" Define a function to create path to executables into virtualenv
fun! GetEnvPath(bin_name)
    return g:vim_venv . '/bin/' . a:bin_name
endf

fun! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
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

" Call every time we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
autocmd FileType liquid       call pencil#init()

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType liquid       call pencil#init()
augroup END

" Set cursorline
autocmd InsertLeave,WinEnter *
  \ set cursorline
autocmd InsertEnter,WinLeave *
  \ set nocursorline

" Set NERDTree config
" autocmd vimenter *
  " \ NERDTree
" autocmd StdinReadPre *
  " \ let s:std_in=1
" autocmd VimEnter *
  " \ if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Set Proper Tabs for a full-stack development
autocmd BufNewFile,BufRead *.html,*.css
  \ set tabstop=2     |
  \ set softtabstop=2 |
  \ set shiftwidth=2

" Flag unnecessary whitespace
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h
  \ match BadWhitespace /\s\+$/

" Disabe automatic comment insertion
autocmd FileType *
  \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript

" LimeLigth integration with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Variable assignment ===============================
" Define default virtualenv directory
let g:vim_venv = expand("~") . '/.vim/venv'

" Startify config
let g:startify_change_to_dir = 0

" ctrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '_site\|node_modules\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }
let g:ctrlp_show_hidden = 1

" Session settings
let g:session_autoload='no'
let g:session_autosave='no'
let g:session_default_to_last=1
let g:session_command_aliases=1

" Remap move split
let g:tmux_navigator_no_mappings = 1

" Vim pencil
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'

" Set YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$', '__pycache__', 'node_modules'] "ignore files in NERDTree
let NERDTreeQuitOnOpen = 3

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Set Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formmater = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
" let g:airline_section_x = '%{PencilMode()}'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Show doctring folded code
let g:SimpylFold_docstring_preview=1

" ALE Config
let g:ale_vim_vint_use_global = 1
let g:ale_fix_on_save = 1
let g:ale_virtualenv_dir_names = [g:vim_venv]
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%: %code%] %s [%severity%]'
let g:ale_sign_column_always = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ],
  \ 'vim': ['vint'],
  \ 'javascript': ['eslint'],
  \ 'html': ['prettier'],
  \ 'json': ['jsonlint']
  \ }
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ }
let g:ale_linter_aliases = {
  \ 'vue': ['javascript', 'html', 'scss'],
  \ }
let g:ale_vim_vint_executable = GetEnvPath('vint')
let g:vue_disable_pre_processors=1
" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.ejs"

" Gitgutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Polyglot setup
let g:polyglot_disabled = ['tmux', 'latex']

" Highlight python code
let python_highlight_all=1

" Trigger configuration. Do not use <Tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" CTags-Tagbar
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" Indent Highlight
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

" vCoolor
let g:vcoolor_disable_mappings = 1

" Lightlime
let g:limelight_conceal_ctermfg = '240'

" Variable assignment ===============================
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

" Command is only returned when out of NERDTree
fun! RunOutNERDTree(command)
    if !(exists("b:NERDTree") && b:NERDTree.isTabTree())
        return a:command
    endif
    echo "You're into NERDTree"
endf

fun! IsLastBuffer()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
endf

" Buffers maps
nnoremap <silent> <expr> <Leader>n  RunOutNERDTree(':bnext<CR>')
nnoremap <silent> <expr> <Leader>p  RunOutNERDTree(':bprev<CR>')
nnoremap <silent> <expr> <Leader>1  RunOutNERDTree(':bfirst<CR>')
nnoremap <silent> <expr> <Leader>9  RunOutNERDTree(':blast<CR>')
nnoremap <silent> <expr> <Leader>bm RunOutNERDTree(':bm<CR>')
nnoremap <silent> <expr> <Leader>ba RunOutNERDTree(':ba<CR>')
nnoremap <silent> <Leader>bl :vs<CR><C-w><C-w>:b#<CR>
nnoremap <silent> <Leader>bL :sp<CR><C-w><C-w>:b#<CR>
nnoremap <silent> <Leader>bq :bdelete %<CR>

" Save document
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :w !sudo tee %<CR>

" Close window
nnoremap <silent> <expr> <Leader>q IsLastBuffer() ? ':q<CR>' : ':bd<CR>'
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.vimrc<CR>

" Quickly open .vimrc in new buffer
nnoremap <expr> <Leader>vv RunOutNERDTree(':edit ~/.dotfiles/vimrc<CR>')

" Enable folding with the Leader + Spacebar
nnoremap <Leader><Space> za

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><cr> :noh<CR>

" Toggle Relative Number
nnoremap <silent> <Leader>rn :set relativenumber!<CR>

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" Resize split to NERDTree split initial size
nnoremap <silent> <Leader>t :NERDTreeFocus <bar> :vertical resize 30<CR>

nnoremap <silent> <C-a><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-a><C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <Leader>w <C-w><C-w>

" Set Carbon map
xnoremap <Leader>p :CarbonNowSh<CR>

" ALE Maps
nnoremap <silent> <Leader>an :ALENextWrap<CR>
nnoremap <silent> <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>ai :ALEInfo<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>al :ALELint<CR>
nnoremap <Leader>ag :YcmCompleter GoTo<CR>
nnoremap <Leader>ar :YcmCompleter GoToReferences<CR>
nnoremap <Leader>am :YcmCompleter RefactorRename<Space>
" change current work (like ciw) but repeatable with dot . for same next word.
nnoremap <Leader>ac :let @/=expand('<cword>')<CR>cgn

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Zen Mode
nnoremap <Leader>z :Goyo<CR>

" CTags Maps
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

" Vimgrep
nnoremap <Leader>vw :execute "vimgrep /" . expand('<cword>') . "/gj **" <Bar> cw<CR>

" Marks
nnoremap <Leader>m ma
nnoremap <Leader>' 'a

" Commands Assignment ==============================
" Add command to find a term in all current dir
command! -nargs=+ FindAll vimgrep /<args>/gj ** | cw

command! -nargs=1 Chrome execute "silent !google-chrome <args>" | redraw!
