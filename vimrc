"""""""""""""""""""""""""""""""""""""""""""""""""
" Jonatas' Vimrc Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " be iMproved, required
syntax on
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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/ZoomWin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Git support
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Colorscheme
" https://github.com/joshdick/onedark.vim
Plugin 'joshdick/onedark.vim'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Python support
Plugin 'plytophogy/vim-virtualenv'
Plugin 'vim-python/python-syntax'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'ambv/black'

" Snippets
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

" Map jk to ESC in insert mode
inoremap jk <esc>

" Disable Esp key in insert mode
inoremap <esc> <nop>

" Map space to Leader
map <Space> <Leader>

" Quickly replace all tabs with spaces
nnoremap <Leader><Space> :%s/<Tab>/  /g<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.vimrc<CR>

" Quickly open .vimrc in new buffer
nnoremap <Leader>vv :edit ~/.vimrc<CR>

" Change move to displayed line
nnoremap j gj
nnoremap k gk

" Remap move split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Leader>w <C-W><C-W>

" Move to beginning/end of line
nnoremap B ^
nnoremap E $

" Show line number
set number

" Auto read files change
set autoread

" Set relative number by default
set relativenumber

" Toggle Relative Number
nnoremap <silent> <Leader>rn :set relativenumber!<CR>

" Select all content
nnoremap vA ggVG

" Save document
nnoremap <S-s> :w<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :w !sudo tee %<CR>

" Close window
nnoremap <Leader>q :q<CR>

" Reopen last closed buffer
nnoremap <Leader>bl :vs<bar>:b#<CR>

" Delete current buffer
nnoremap <Leader>bq :bdelete %<CR>

" Set pastetoggle key
set pastetoggle=<Leader>i

" Copy line
nnoremap Y y$

" Set NERDTree config
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$', '__pycache__'] "ignore files in NERDTree
" Resize split to NERDTree split initial size
nnoremap <silent> <Leader>t :vertical resize 30<CR>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Set buftabline shortcut
set hidden
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>
nnoremap <Leader>1 :bfirst<CR>
nnoremap <Leader>9 :blast<CR>
nnoremap <Leader>bm :bm<CR>

" Set Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formmater = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

" status line
set laststatus=2

" Enable folding
set foldmethod=syntax
set foldlevel=99

" Enable folding with the spacebar+f
nnoremap <Leader><space> za

" Show doctring folded code
let g:SimpylFold_docstring_preview=1

" Show linenumbers
set number
set ruler

" Enable Highlight Search
set hlsearch

" Highlight while search
set incsearch

" Case Insensitivity Pattern Matching
set ignorecase

" Overrides ignorecase if pattern contains upcase
set smartcase

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><cr> :noh<cr>

" Show invisible characters
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Disabe automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" System clipboard
set clipboard=unnamed

" Set Proper Tabs for PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" Highlight python code
let python_highlight_all=1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
nnoremap <Leader>c :Black<CR>

" Trigger configuration. Do not use <Tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Set Proper Tabs for a full-stack development
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set onedark (https://github.com/joshdick/onedark.vim) as color scheme
colorscheme onedark
