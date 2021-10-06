call plug#begin()

" Utilities
Plug 'xolox/vim-misc'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'chrisbra/csv.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'mattn/emmet-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'preservim/tagbar'

Plug 'moll/vim-bbye' " optional dependency
Plug 'aymericbeaumet/vim-symlink'

" Starter
Plug 'mhinz/vim-startify'
Plug 'rmagatti/auto-session'

" Side Browser
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

" Finder and Dispatcher
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
Plug 'wellle/targets.vim'

" File/Window/Pane navigation
Plug 'christoomey/vim-tmux-navigator'

" Git support
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

" Colorscheme
Plug 'joshdick/onedark.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Python support
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-scripts/indentpython.vim'

" Javascript Support
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'

" *TeX/Markdown support
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'

" HTML & CSS Support
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'

Plug 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call plug#end()
