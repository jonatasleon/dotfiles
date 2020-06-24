call plug#begin()

" Utilities
Plug 'xolox/vim-misc'
Plug 'KabbAmine/vCoolor.vim'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'chrisbra/csv.vim'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'

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
Plug 'scrooloose/nerdtree'
Plug 'troydm/zoomwintab.vim'

" Git support
Plug 'Xuyuanp/nerdtree-git-plugin'
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

" Snippets
Plug 'honza/vim-snippets'

" Python support
Plug 'plytophogy/vim-virtualenv'
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

" HTML Support
Plug 'alvan/vim-closetag'

" i3wm
Plug 'PotatoesMaster/i3-vim-syntax'

" All of your Plugins must be added before the following line
call plug#end()
