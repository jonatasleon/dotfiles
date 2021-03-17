nnoremap <silent> <C-a><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-a><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-a><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-a><C-l> :TmuxNavigateRight<CR>

" Remap move split
let g:tmux_navigator_no_mappings = 1

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1
