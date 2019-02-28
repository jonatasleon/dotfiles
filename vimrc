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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/ZoomWin'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'vim-python/python-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" Git configurations
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""""""""""""""

" Set NERDTree config
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '\.swp$'] "ignore files in NERDTree

" Set NERDTreeTab config
let g:nerdtree_tabs_open_on_console_startup=1

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Show doctring folded code
let g:SimpylFold_docstring_preview=1

" Show linenumbers
set number
set ruler

" Disabe automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Set Proper Tabs for PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" Set Proper Tabs for a full-stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Highlight python code
let python_highlight_all=1

" Set onedark (https://github.com/joshdick/onedark.vim) as color scheme
syntax on
colorscheme onedark
