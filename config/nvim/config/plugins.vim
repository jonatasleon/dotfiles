" Polyglot setup
let g:polyglot_disabled = ['tmux', 'latex']

call plug#begin()

" Utilities
Plug 'xolox/vim-misc'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'chrisbra/csv.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'frazrepo/vim-rainbow'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Text Editing
Plug 'andrewradev/splitjoin.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tommcdo/vim-exchange'
Plug 'machakann/vim-highlightedyank'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'mattn/vim-textobj-url'

" File/Window/Pane navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'troydm/zoomwintab.vim'

" Git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Colorscheme " https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Linting
Plug 'sheerun/vim-polyglot'

" Complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Python support
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/indentpython.vim'

" Javascript Support
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" *TeX/Markdown support
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'parkr/vim-jekyll'
Plug 'xolox/vim-notes'

" HTML & CSS Support
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'

" All of your Plugins must be added before the following line
call plug#end()
