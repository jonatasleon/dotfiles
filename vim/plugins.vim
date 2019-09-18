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
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'chrisbra/csv.vim'
Plugin 'mileszs/ack.vim'

" Text Editing
Plugin 'andrewradev/splitjoin.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'valloric/matchtagalways'
Plugin 'tommcdo/vim-exchange'
Plugin 'machakann/vim-highlightedyank'

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
Plugin 'mxw/vim-jsx'

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
