let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <Leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <Leader><Space> :silent <C-u> :silent WhichKey 'g'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '->'

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map = extend(g:which_key_map, {
  \ 'T': [':TagbarToggle', 'Tagbar toggle'],
  \ })

let g:which_key_map.k = {
  \ 'name': '+coc',
  \ 'i': [':CocCommand python.setInterpreter', 'Set Python interpreter'],
  \ 'l': [':CocCommand python.runLinting', 'Run linting'],
  \ 'r': [':CocCommand pyright.restartserver', 'Restart Server'],
  \ 's': [':CocCommand pyright.organizeimports', 'Sort imports'],
  \ }

" l is for search
let g:which_key_map.l = {
  \ 'name' : '+search' ,
  \ 'o' : [':set spell!'   , 'toggle spell check'],
  \ '/' : [':History/'     , 'history'],
  \ ';' : [':Commands'     , 'commands'],
  \ 'a' : [':Ag'           , 'text Ag'],
  \ 'b' : [':Buffers'      , 'open buffers'],
  \ 'B' : [':BLines'       , 'current buffer'],
  \ 'c' : [':Commits'      , 'commits'],
  \ 'C' : [':BCommits'     , 'buffer commits'],
  \ 'f' : [':Files'        , 'files'],
  \ 'g' : [':GFiles'       , 'git files'],
  \ 'G' : [':GFiles?'      , 'modified git files'],
  \ 'h' : [':History'      , 'file history'],
  \ 'H' : [':History:'     , 'command history'],
  \ 'l' : [':Lines'        , 'lines'] ,
  \ 'm' : [':Marks'        , 'marks'] ,
  \ 'M' : [':Maps'         , 'normal maps'] ,
  \ 'p' : [':Helptags'     , 'help tags'] ,
  \ 'P' : [':Tags'         , 'project tags'],
  \ 's' : [':Snippets'     , 'snippets'],
  \ 'S' : [':Colors'       , 'color schemes'],
  \ 't' : [':Rg'           , 'text Rg'],
  \ 'T' : [':BTags'        , 'buffer tags'],
  \ 'w' : [':Windows'      , 'search windows'],
  \ 'y' : [':Filetypes'    , 'file types'],
  \ 'z' : [':FZF'          , 'FZF'],
  \ }

" Register which key map
autocmd! User vim-which-key call which_key#register('<Space>', "g:which_key_map")
