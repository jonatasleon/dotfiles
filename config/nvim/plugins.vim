call plug#begin()

" Utilities
Plug 'KabbAmine/vCoolor.vim'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'etdev/vim-hexcolor'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'chrisbra/csv.vim'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'

" Text Editing
Plug 'andrewradev/splitjoin.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'valloric/matchtagalways'
Plug 'tommcdo/vim-exchange'
Plug 'machakann/vim-highlightedyank'

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
Plug 'w0rp/ale'

" Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" HTML Support
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" i3wm
Plug 'PotatoesMaster/i3-vim-syntax'

" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

" All of your Plugins must be added before the following line
call plug#end()
