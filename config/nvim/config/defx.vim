call defx#custom#option('_', {
            \ 'columns': 'mark:indent:icons:filename:type',
            \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'ignored_files': '*.pyc,*.pyd,*~,*.swo,*.swp,.git,.hg,.svn,.bzr,.DS_Store',
            \ })

call defx#custom#column('mark', {
            \ 'readonly_icon': '',
            \ 'selected_icon': '✓',
            \ })

call defx#custom#column('time', {
            \ 'format': '%Y %b %e %H:%M:%S',
            \ })

nnoremap <silent> <C-n> :Defx -resume -toggle -columns=git:mark:indent:icons:filename:type:size:time<CR>
tnoremap <silent> <C-n> <C-\><C-n>:Defx -toggle<CR>

function! s:defx_toggle_tree_or_open_file() abort
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    else
        return defx#do_action('multi', ['drop', 'quit'])
    endif
endfunction

function! s:defx_cd_or_open_file() abort
    if defx#is_directory()
        return defx#do_action('open_directory')
    else
        return defx#do_action('multi', ['drop', 'quit'])
    endif
endfunction

function! s:defx_settings() abort
    " double click/Enter/l to open file
    nnoremap <silent><buffer><expr> <2-LeftMouse> <sid>defx_toggle_tree_or_open_file()
    nnoremap <silent><buffer><expr> <CR> <sid>defx_toggle_tree_or_open_file()
    nnoremap <silent><buffer><expr> l    <sid>defx_cd_or_open_file()

    nnoremap <silent><buffer><expr> q     defx#do_action('quit')
    nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
    nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
    nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])

    nnoremap <silent><buffer><expr><nowait> <Tab> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr><nowait> <S-Tab> defx#do_action('toggle_select') . 'k'
    nnoremap <silent><buffer><expr> *      defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> <C-c>  defx#do_action('clear_select_all')
    nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

    nnoremap <silent><buffer><expr> n     defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N     defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> dd    defx#do_action('remove')
    nnoremap <silent><buffer><expr> r     defx#do_action('rename')
    nnoremap <silent><buffer><expr> !     defx#do_action('execute_command')
    nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
    nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
    nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')

    nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
endfunction

" Ref:
" https://github.com/Shougo/vimfiler.vim/blob/edbb2f2e6baa66c51f73a82afa2bb740415a64ea/plugin/vimfiler.vim#L72
" https://github.com/Shougo/defx.nvim/issues/121
function! s:browse() abort
    let l:path = expand('<amatch>')
    if l:path ==# '' || bufnr('%') != expand('<abuf>')
        return
    endif

    if &filetype ==# 'defx' && line('$') != 1
        return
    endif

    if !isdirectory(l:path)
        return
    endif

    bd
    exe ':Defx -split=no -columns=mark:indent:icons:filename:type:size:time ' . l:path
endfunction

" disable netrw.
augroup FileExplorer
    autocmd!
augroup END

augroup defx_group
    autocmd!
    " auto close if it is the last
    autocmd BufEnter * if (&buftype ==# 'defx' || &buftype ==# 'nofile')
                \ && (!has('vim_starting'))
                \ && winbufnr(2) == -1 | quit! | endif
    " Move focus to the next window if current buffer is defx
    autocmd TabLeave * if &ft ==# 'defx' | wincmd w | endif
    " keymap
    autocmd FileType defx do WinEnter | call s:defx_settings()
    autocmd FileType defx set nonumber
    autocmd FileType defx set norelativenumber
    autocmd FileType defx set noshowcmd
    autocmd FileType defx set nolist
    autocmd FileType defx set listchars=
    " replace netrw to defx
    autocmd BufEnter * call s:browse()
augroup END

