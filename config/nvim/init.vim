"""""""""""""""""""""""""""""""""""""""""""""""""
" Jonatas' Vimrc Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible    " be iMproved, required
set nowrap
set encoding=utf8

source ~/.config/nvim/plugins.vim

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

" Set pastetoggle key
set pastetoggle=<Leader>i

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

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show invisible characters
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<

" Set Proper Tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Wildignore
set wildignore+=*/node_modules/*

" Update time
set updatetime=300

function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/

    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}" syn match liquid '{%.*%}'
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

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowcmd
  set nolist
  set listchars=
  Limelight
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set showcmd
  set list
  set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
  Limelight!
  hi Normal guibg=NONE ctermbg=NONE
endfunction

" Command is only returned when out of NERDTree
function! RunOutNERDTree(command)
    if !(exists("b:NERDTree") && b:NERDTree.isTabTree())
        return a:command
    endif
    echo "You're into NERDTree"
endfunction

function! IsLastBuffer()
    return len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType liquid       call pencil#init()
augroup END

augroup recpos
   autocmd!
   autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Hook goyo functions
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Call every time we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
autocmd FileType liquid call pencil#init()

" Set cursorline
autocmd InsertLeave,WinEnter *
  \ set cursorline
autocmd InsertEnter,WinLeave *
  \ set nocursorline

" Set Proper Tabs for a full-stack development
autocmd BufNewFile,BufRead *.html,*.css,*.js
  \ set tabstop=2     |
  \ set softtabstop=2 |
  \ set shiftwidth=2

" Flag unnecessary whitespace
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h
  \ match BadWhitespace /\s\+$/ |
  \ set tabstop=4     |
  \ set softtabstop=4 |
  \ set shiftwidth=4

" Disabe automatic comment insertion
autocmd FileType *
  \ setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.js set filetype=javascript

" Variable assignment ===============================
let g:python_host_prog = expand("~") . '/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog = expand("~") . '/.pyenv/versions/nvim3/bin/python'

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
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%: %code%] %s [%severity%]'
let g:ale_sign_column_always = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'css': ['csslint'],
  \ 'javascript': ['eslint'],
  \ 'json': ['jsonlint'],
  \ 'vim': ['vint']
  \ }
let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'html': ['prettier'],
  \ 'javascript': ['prettier-eslint'],
  \ '*': [ 'remove_trailing_lines', 'trim_whitespace' ]
  \ }
" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.ejs"
let g:closetag_filetypes = 'javascript'
let g:closetag_regions = {
  \ 'javascript': 'jsxRegion',
  \ }

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
let g:indentLine_enabled = 1

" vCoolor
let g:vcoolor_disable_mappings = 1

" Lightlime
let g:limelight_conceal_ctermfg = '240'

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript': 1,
    \}

" Mappings ===============================
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

" Buffers maps
nnoremap <silent> <expr> <Leader>n  RunOutNERDTree(':bnext<CR>')
nnoremap <silent> <expr> <Leader>p  RunOutNERDTree(':bprev<CR>')
nnoremap <silent> <expr> <Leader>1  RunOutNERDTree(':bfirst<CR>')
nnoremap <silent> <expr> <Leader>9  RunOutNERDTree(':blast<CR>')
nnoremap <silent> <expr> <Leader>bm RunOutNERDTree(':bm<CR>')
nnoremap <silent> <expr> <Leader>ba RunOutNERDTree(':ba<CR>')
nnoremap <silent> <Leader>bv :vs<CR><C-w><C-w>:b#<CR>
nnoremap <silent> <Leader>bs :sp<CR><C-w><C-w>:b#<CR>

" Save document
nnoremap <Leader>s :w<CR>
nnoremap <Leader>S :w !sudo tee %<CR>

" Close window
nnoremap <silent> <expr> <Leader>q IsLastBuffer() ? ':q<CR>' : ':bd<CR>'
nnoremap <Leader>Q :qa<CR>

" Quickly source .vimrc
nnoremap <Leader>vr :source ~/.config/nvim/init.vim<CR>

" Quickly open .vimrc in new buffer
nnoremap <expr> <Leader>vv RunOutNERDTree(':edit ~/.dotfiles/config/nvim/init.vim<CR>')
nnoremap <expr> <Leader>vp RunOutNERDTree(':edit ~/.dotfiles/config/nvim/plugins.vim<CR>')

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Enable folding with the Leader + Spacebar
nnoremap <Leader><Space> za

" Press <Leader> Enter to remove search highlights
noremap <silent> <Leader><cr> :noh<CR>

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

" Set Ack map
noremap <Leader>a :Ack! <cword><cr>

" ALE Maps
nnoremap <silent> <Leader>an :ALENextWrap<CR>
nnoremap <silent> <Leader>ap :ALEPreviousWrap<CR>
nnoremap <Leader>ai :ALEInfo<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>al :ALELint<CR>

" change current work (like ciw) but repeatable with dot . for same next word.
nnoremap <Leader>ac :let @/=expand('<cword>')<CR>cgn

" Vim Pencil Format Maps
nnoremap <silent> Q gqap
xnoremap <silent> Q gq

" Zen Mode
nnoremap <Leader>z :Goyo<CR>

" CTags Maps
nnoremap <silent> <Leader>tb :TagbarToggle<CR>

" Marks
nnoremap <Leader>m ma
nnoremap <Leader>' 'azz

" Commands Assignment ==============================
" Open file in chrome
command! -nargs=1 Chrome execute "silent !google-chrome <args>" | redraw!

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
