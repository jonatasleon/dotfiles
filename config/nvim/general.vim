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

" Better display for messages
set cmdheight=2

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

" Wildignore
set wildignore+=*/node_modules/*

set wildmode=longest:full,full
set wildmenu

" Update time
set updatetime=300
